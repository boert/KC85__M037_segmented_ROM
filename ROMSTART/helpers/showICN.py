#! /usr/bin/env python3

"""
ICN-Datei anzeigen

Aufruf: skript.py  <bild.icn> 

"""

from PIL import Image
import sys
import os
import math


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


def getaddr( addr, height):
    zeile = ( addr % height)
    spalte = int( addr / height)
    return( zeile, spalte)


def color_fg( kccolor):
    red, green, blue = fgcolors[ ( kccolor >> 3) & 0x0f]
    return (blue << 16) + ( green << 8) + red


def color_bg( kccolor):
    red, green, blue = bgcolors[ kccolor & 0x07]
    return (blue << 16) + ( green << 8) + red



# main
filename = sys.argv[ 1]
print( filename)

file = open( filename, 'r+b')
icon = bytearray( file.read())
file.close()

icon_height = icon[ 0]
icon_width  = icon[ 1]
pix_width   = icon_width * 8
pix_height  = icon_height * 8
print( "%d bytes read from %s" % ( len( icon), filename))
print( "size: %i * %i" % ( icon_width, icon_height))
print( "pixel: %i * %i" % ( pix_width, pix_height))

pic = Image.new( mode = 'RGB', size = (pix_width, pix_height), color = 'black')
picarray = pic.load()

pixels = [[0] * pix_height for i in range( pix_width)]
colors = [[0x78] * pix_height for i in range( pix_width)]

# Daten teilen
pix_data = icon[2: pix_height * icon_width]
col_data = icon[ pix_height * icon_width+2:]


# Pixeldaten verarbeiten
for index in range( len( pix_data)):
    pix_row, pix_col = getaddr( index, pix_height)
    byte = pix_data[ index]

    for bitpos in range( 8):
        bit = (byte >> bitpos) & 1
        if bit:
            try:
                pixels[ pix_col * 8 + 7 - bitpos][pix_row] = 1
            except IndexError:
                print( pix_col, bitpos, pix_row)

# Farbdaten verarbeiten
for index in range( len( col_data)):
    pix_row, pix_col = getaddr( index, pix_height)
    color = col_data[ index]
        
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

    
factor = 3
picshow = pic.resize(( pic.width * factor, pic.height * factor))
picshow.show()

sys.exit( 0)


# show full picture
if not NOVIEW:
    factor = 3
    picshow = pic.resize(( pic.width * factor, pic.height * factor))
    picshow.show()



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
