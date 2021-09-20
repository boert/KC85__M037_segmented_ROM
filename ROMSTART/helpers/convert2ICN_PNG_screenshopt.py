#! /usr/bin/env python3

from PIL import Image
import sys
import os
import math

NOVIEW = True
if 'show' in sys.argv[ -3]: 
    NOVIEW = False

# Farbkonstanten
# color constants
fgcolors = [
        [   0,   0,   0], # schwarz
        [   0,   0, 233], # blau
        [ 233,   0,   0], # rot
        [ 233,   0, 233], # purpur
        [   0, 233,   0], # gruen
        [   0, 233, 233], # tuerkis
        [ 233, 233,   0], # gelb
        [ 233, 233, 233], # weiss

        # Vordergrundfarben mit gemischten Primaerfarben
        [   0,   0,   0 ], # schwarz
        [ 146,   0, 233 ], # violett
        [ 233, 146,   0 ], # orange
        [ 233,   0, 146 ], # purpurrot
        [   0, 233, 146 ], # gruenblau
        [   0, 146, 233 ], # blaugruen
        [ 146, 233,   0 ], # gelbgruen
        [ 233, 233, 233 ]] # weiss

bgcolors = [
        [   0,   0,   0], # schwarz
        [   0,   0, 146], # blau
        [ 146,   0,   0], # rot
        [ 146,   0, 146], # purpur
        [   0, 146,   0], # gruen
        [   0, 146, 146], # tuerkis
        [ 146, 146,   0], # gelb
        [ 146, 146, 146]] # weiss


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

"""
colors = set()
# check number of colors
for x in range( pic.width):
    for y in range( pic.height):
        color = pic.getpixel(( x, y))
        colors.add( color)
print( len( colors), colors)
sys.exit( 0)
"""

# pixel and color
colors = []
for x in range( pic_icon.width >> 3):
    for y in range( pic_icon.height):
        byte = 0
        fgset = set()
        bgset = set()
        for bit in range( 8):
            rgb = pic_icon.getpixel(( x * 8 + bit, y))
            fgindex = get_fgcolor_index( rgb)
            fgset.add( fgindex)
            bgindex = get_bgcolor_index( rgb)
            bgset.add( bgindex)
        fgset.discard( -1)
        bgset.discard( -1)
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
        colors.append(( fgcol << 3) + bgcol)
        
        for bit in range( 8):
            if fgcol == get_fgcolor_index( pic_icon.getpixel(( x * 8 + bit, y))):
                byte += 1 << ( 7 - bit)
        icon.append( byte)
icon += colors

iconfilename = os.path.splitext( filename)[ 0] + '.ICN'
outfile = open( iconfilename, 'w+b')
outfile.write( bytearray( icon))
outfile.close()
print( "%d bytes written to %s" % ( len( icon), iconfilename))
