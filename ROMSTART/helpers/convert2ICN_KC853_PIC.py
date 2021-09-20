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
    if spalte < 32:
        # spalte 00..31
        mixvbits = ( zeile & 0xF0) + (( zeile & 0x03) << 2) + (( zeile & 0x0C) >> 2)
        pixel_address = 0x8000 + ( mixvbits << 5) + spalte 
        color_address = 0xA800 + (( zeile & 0xFC) << 3) + spalte
    else:
        # spalte 32..39
        mixpbits = ( zeile & 0xC0) + (( zeile & 0x30) >> 4) + ( zeile & 0xC0) + (( zeile & 0x03) << 4)
        mixcbits = (( zeile & 0xC0) >> 2) + (( zeile & 0x30) >> 4) + (( zeile & 0xC0) >> 2)
        pixel_address = 0xA000 + ( mixpbits << 3) + ( spalte & 0x07) 
        color_address = 0xB000 + ( mixcbits << 3) + ( spalte & 0x07) 

    return ( pixel_address, color_address)


def getpixeladdr( addr):
    if addr >= 0x8000 and addr < 0xA800:
        if addr < 0xA000:
            spalte = ( addr & 0x001F)
            zeile  = (( addr & 0x1E00) >> 5) + (( addr & 0x0180) >> 7) + (( addr & 0x0060) >> 3)
        else:
            spalte = ( addr & 0x0007) + 0x20
            zeile  = (( addr & 0x0600) >> 3) + (( addr & 0x0180) >> 7) + (( addr & 0x0060) >> 3) + (( addr & 0x0018) << 1)
        return( zeile, spalte)
    else:
        return False


def getcoloraddr( addr):
    if addr >= 0xA800 and addr < 0xB200:
        if addr < 0xB000:
            spalte = ( addr & 0x001F)
            zeile  = (( addr & 0x07E0) >> 3)
        else:
            spalte = ( addr & 0x0007) + 0x20
            zeile  = (( addr & 0x0180) >> 1) + (( addr & 0x0060) >> 3) + (( addr & 0x0018) << 1)
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

pic = Image.new( mode = 'RGB', size = (320, 256), color = 'black')

picarray = pic.load()

pixels = [[0] * 256 for i in range( 320)]
colors = [[0x79] * 256 for i in range( 320)]

# read 85/3-Bild (PIC)
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
    else:
        pix_row, pix_col = getcoloraddr( index + 0x8000)
        color = data[ index]

        for crow in range( 4):
            for ccol in range( 8):
                try:
                    colors[ pix_col * 8 + ccol][pix_row + crow] = color
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

# width  = 112 pixel
# height =  64 pixel
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
    for y in range( pic_icon.height >> 2):
        fcol = 0
        bcol = 0
        for row in range( 4):
            for bit in range( 8):
                fgcol = get_fgcolor_index( pic_icon.getpixel(( x * 8 + bit, y * 4 + row)))
                bgcol = get_bgcolor_index( pic_icon.getpixel(( x * 8 + bit, y * 4 + row)))
                if fgcol > 0:
                    fcol = fgcol
                if bgcol > 0:
                    bcol = bgcol
        icon.append(( fcol << 3) + bcol)
        icon.append(( fcol << 3) + bcol)
        icon.append(( fcol << 3) + bcol)
        icon.append(( fcol << 3) + bcol)

iconfilename = os.path.splitext( filename)[ 0] + '.ICN'
outfile = open( iconfilename, 'w+b')
outfile.write( bytearray( icon))
outfile.close()
print( "%d bytes written to %s" % ( len( icon), iconfilename))
