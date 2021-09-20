#! /usr/bin/env python3

from PIL import Image
import sys
import os

NOVIEW = True
if 'show' in sys.argv[ -3]: 
    NOVIEW = False


# Farbkonstanten
# color constants
fgcolors = [
        [   1,   1,   1], # schwarz
        [   1,   1, 255], # blau
        [ 255,   1,   1], # rot
        [ 255,   1, 255], # purpur
        [   1, 255,   1], # gruen
        [   1, 255, 255], # tuerkis
        [ 255, 255,   1], # gelb
        [ 255, 255, 255], # weiss

        # Vordergrundfarben mit gemischten Primaerfarben
        [   2,   2,   2 ], # schwarz
        [ 160,   2, 255 ], # violett
        [ 255, 160,   2 ], # orange
        [ 255,   2, 160 ], # purpurrot
        [   2, 255, 160 ], # gruenblau
        [   2, 160, 255 ], # blaugruen
        [ 160, 255,   2 ], # gelbgruen
        [ 255, 255, 255 ]] # weiss

bgcolors = [
        [   0,   0,   0], # schwarz
        [   0,   0, 160], # blau
        [ 160,   0,   0], # rot
        [ 160,   0, 160], # purpur
        [   0, 160,   0], # gruen
        [   0, 160, 160], # tuerkis
        [ 160, 160,   0], # gelb
        [ 160, 160, 160]] # weiss


# Hilfsfunktionen
# helpers

def getramaddr( zeile, spalte):
    address = 0x8000 + spalte * 256 + zeile
    return address


def getpixeladdr( addr):
    if addr >= 0x8000 and addr < 0xA800:
        zeile = ( addr & 0x00FF)
        spalte = ( addr >> 8) & 0x3F
        return( zeile, spalte)
    else:
        return False


def getcoloraddr( addr):
    if addr >= 0x8000 and addr < 0xA800:
        zeile = ( addr & 0x00FF)
        spalte = ( addr >> 8) & 0x3F
        return( zeile, spalte)
    else:
        return False


def color_fg( kccolor):
    red, green, blue = fgcolors[ ( kccolor >> 3) & 0x0f]
    return (blue << 16) + ( green << 8) + red


def color_bg( kccolor):
    red, green, blue = bgcolors[ kccolor & 0x07]
    return (blue << 16) + ( green << 8) + red

def get_fgcolor_index( rgb):
    for index in range( len( fgcolors)):
        if rgb == tuple( fgcolors[ index]):
            return index
    return -1

def get_bgcolor_index( rgb):
    for index in range( len( bgcolors)):
        if rgb == tuple( bgcolors[ index]):
            return index
    return -1


# main
filename = sys.argv[ 1]
print( filename)


with open( filename, 'rb') as file:
    bytes = file.read()
   
    # restliche Daten, bzw. die Payload nehmen
    data = bytearray( bytes[ 128:12928])

# ggf. Farbdatei laden
try:
    colorfilename = sys.argv[ 2]
    print( colorfilename)
    with open( colorfilename, 'rb') as file:
        colorbytes = file.read()
       
        # restliche Daten, bzw. die Payload nehmen
        colordata = bytearray( colorbytes[ 128:12928])
except:
    print( "no extra color")
    colordata = []


pic = Image.new( mode = 'RGB', size = (320, 256), color = 'black')

picarray = pic.load()

pixels = [[0] * 256 for i in range( 320)]
colors = [[0x78] * 256 for i in range( 320)]

# für 85/4-Bild
row = 0
bcol = 0
for index in range( len( data)):
    if index < 0x2800:
        pix_row, pix_col = getpixeladdr( index + 0x8000)
        byte = data[ index]

        for bitpos in range( 8):
            bit = (byte >> bitpos) & 1
            if bit:
                try:
                    pixels[ pix_col * 8 + 7 - bitpos][pix_row] = 1
                except IndexError:
                    print( pix_col, bitpos, pix_row)


for index in range( len( colordata)):
    if index < 0x2800:
        pix_row, pix_col = getcoloraddr( index + 0x8000)
        color = colordata[ index]
            
        for ccol in range( 8):
            try:
                colors[ pix_col * 8 + ccol][pix_row] = color
            except IndexError:
                print( pix_col, bitpos, pix_row)


# combine pixel and color to final picture
for y in range( pic.height):
    for x in range( pic.width):
        if pixels[ x][ y] == 1:
            picarray[ x, y] = color_fg( colors[ x][ y])
        else:
            picarray[ x, y] = color_bg( colors[ x][ y])


# show full picture
if not NOVIEW:
    factor = 3
    picshow = pic.resize(( pic.width * factor, pic.height * factor))
    picshow.show()



# Auswahl aus Kommandozeile (x y)
try:
    left = int( sys.argv[ -2])
    top  = int( sys.argv[ -1])
except:
    left = 0
    top = 0

width  = 14
height = 8

pic_icon = pic.crop( box = ( left*8, top*8, (left+width)*8, (top+height)*8))

# show icon (selection)
if not NOVIEW:
    factor = 3
    iconshow = pic_icon.resize(( pic_icon.width * factor, pic_icon.height * factor))
    iconshow.show()


# build icon
icon = []
icon.append( height)
icon.append( width)

# pixel
for x in range( pic_icon.width >> 3):
    for y in range( pic_icon.height):
        byte = 0
        for bit in range( 8):
            fgcol = get_fgcolor_index( pic_icon.getpixel(( x * 8 + bit, y)))
            bgcol = get_bgcolor_index( pic_icon.getpixel(( x * 8 + bit, y)))
            if fgcol >= 0:
                byte += 1 << ( 7 - bit)
        icon.append( byte)

# color
for x in range( pic_icon.width >> 3):
    for y in range( pic_icon.height):
        fcol = 0
        bcol = 0
        for bit in range( 8):
            fgcol = get_fgcolor_index( pic_icon.getpixel(( x * 8 + bit, y)))
            bgcol = get_bgcolor_index( pic_icon.getpixel(( x * 8 + bit, y)))
            if fgcol > 0:
                fcol = fgcol
            if bgcol > 0:
                bcol = bgcol
        icon.append(( fcol << 3) + bcol)

iconfilename = os.path.splitext( filename)[ 0] + '.ICN'
outfile = open( iconfilename, 'w+b')
outfile.write( bytearray( icon))
outfile.close()
print( "%d bytes written to %s" % ( len( icon), iconfilename))
