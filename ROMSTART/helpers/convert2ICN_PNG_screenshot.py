#! /usr/bin/env python3

"""
Aufruf: skrip.py  <bild.png> <X> <Y> [show]

bild.png sollte eine Auflösung 320x256 Pixel haben

Werte für X: 0..
Werte für Y: 0..

"""

from PIL import Image
import sys
import os
import math

NOVIEW = True
if 'show' in sys.argv[ -1]: 
    NOVIEW = False

# Farbkonstanten
# color constants
ihi = 255   # hohe Intensität
ilo = 160   # niedrige Intensität
fgcolors = [
        [   0,   0,   0], # schwarz
        [   0,   0, ihi], # blau
        [ ihi,   0,   0], # rot
        [ ihi,   0, ihi], # purpur
        [   0, ihi,   0], # gruen
        [   0, ihi, ihi], # tuerkis
        [ ihi, ihi,   0], # gelb
        [ ihi, ihi, ihi], # weiss

        # Vordergrundfarben mit gemischten Primaerfarben
        [   0,   0,   0 ], # schwarz
        [ ilo,   0, ihi ], # violett
        [ ihi, ilo,   0 ], # orange
        [ ihi,   0, ilo ], # purpurrot
        [   0, ihi, ilo ], # gruenblau
        [   0, ilo, ihi ], # blaugruen
        [ ilo, ihi,   0 ], # gelbgruen
        [ ihi, ihi, ihi ]] # weiss

bgcolors = [
        [   0,   0,   0], # schwarz
        [   0,   0, ilo], # blau
        [ ilo,   0,   0], # rot
        [ ilo,   0, ilo], # purpur
        [   0, ilo,   0], # gruen
        [   0, ilo, ilo], # tuerkis
        [ ilo, ilo,   0], # gelb
        [ ilo, ilo, ilo]] # weiss


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


def distance(c1, c2):
    (r1,g1,b1) = c1
    (r2,g2,b2) = c2
    return math.sqrt((r1 - r2)**2 + (g1 - g2) ** 2 + (b1 - b2) **2)


def get_fgcolor_index( rgb):
    #colors = fgcolors
    #closest_colors = sorted(colors, key=lambda color: distance(color, rgb))
    #closest_color = closest_colors[0]
    #print( closest_color)
    for index in range( len( fgcolors)):
        if rgb == tuple( fgcolors[ index]):
        #if rgb == closest_color:
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



pic = Image.open( filename)
pic = pic.convert( 'RGB')


# show full picture
if not NOVIEW:
    factor = 3
    picshow = pic.resize(( pic.width * factor, pic.height * factor))
    #picshow.show()



# Auswahl aus Kommandozeile (x y)
try:
    left = int( sys.argv[ 2])
    top  = int( sys.argv[ 3])
except:
    left = 0
    top = 0


width  = 14
height = 8

print( "use crop box: %i, %i - %i, %i" % ( left, top, left+width, top+height))

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

if False:
    colors = set()
# check number of colors
    for x in range( pic.width):
        for y in range( pic.height):
            color = pic.getpixel(( x, y))
            colors.add( color)
    print( len( colors), colors)
    sys.exit( 0)


# pixel and color
colors = []
for x in range( pic_icon.width >> 3):
    for y in range( pic_icon.height):
        byte = 0
        fgset = set()
        bgset = set()
        for bit in range( 8):
            rgb = pic_icon.getpixel(( x * 8 + bit, y))
            #print( rgb, "    ", end="")
            fgindex = get_fgcolor_index( rgb)
            fgset.add( fgindex)
            bgindex = get_bgcolor_index( rgb)
            bgset.add( bgindex)
            #print( fgindex, bgindex, "    ", end="")
        fgset.discard( -1)
        bgset.discard( -1)
        #print( bgset, fgset, "    ", end="")
        if len( fgset) > 1:
            fgset = fgset.difference( bgset)
        if len( bgset) > 1:
            bgset = bgset.difference( fgset)
        if len( fgset) == 0:
            fgset.add( 0)
        if len( bgset) == 0:
            bgset.add( 0)
        fgcol = fgset.pop()
        bgcol = bgset.pop()
        #print( fgcol, bgcol, "    ", end="")
        colors.append(( fgcol << 3) + bgcol)
        
        for bit in range( 8):
            if fgcol == get_fgcolor_index( pic_icon.getpixel(( x * 8 + bit, y))):
                byte += 1 << ( 7 - bit)
        icon.append( byte)
        #print( byte, fgcol, bgcol, "    ", end="")
icon += colors

iconfilename = os.path.splitext( filename)[ 0] + '.ICN'
outfile = open( iconfilename, 'w+b')
outfile.write( bytearray( icon))
outfile.close()
print( "%d bytes written to %s" % ( len( icon), iconfilename))
