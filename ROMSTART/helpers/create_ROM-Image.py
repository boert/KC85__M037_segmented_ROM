#! /usr/bin/env python3

"""
Ziel: ein ROM-Image anzulegen mit einem
  Verzeichnis der Programme
  und den entsprechenden Programmen

Aufbau:
Verzeichniss
Porgramm1
Programm2
Programm3

alle Programme sind in 128 Byte Blöcke aufgeteilt
bei 2 Byte für die Blocknummer lassen sich bis zu 8 MByte adressieren (theoretisch)

ein Verzeichniseintrag besteht aus 28 Bytes:
    Name (8), Dateityp (3)
    ROM-Blocknummer (2), Anzahl der ROM-Blöcke (2), Link auf Grafik (2)
    Argumente (1), Ladeadresse (2), Endadresse + 1 (2), Startadresse (2)

in einen Block passen 4 Verzeichniseinträge

(16k ROM ->  128 Blöcke)
 32k ROM ->  256 Blöcke
 64k ROM ->  512 Blöcke
128k ROM -> 1024 Blöcke

Byte
0       Controlbyte
        Bit 7       letzter Verzeichniseintrag
        Bit 6       komprimiert
        Bit 5       RAM Erweiterung nötig M022/M011 (nur bei KC85/3)
        Bit 4       (Basicprogramm)
        Bit 0..2    02 = normal load, 03 = Selbststart
1-8     Name
9-11    Dateityp/-endung
12,13   Ladeadresse
14,15   Programmlänge
16,17   Startadresse
18,19   Startblock im ROM
20,21   Ladeadresse gepackt
22,23   Länge gepackt
24,25   Startblock der Grafik
26,27   Länge der Grafik
"""

# für Verwaltungsprogramm reservierte Blöcke
# reserved blocks for program
program_blocks = 11

# für Verzeichnis reservierte Blöcke
# reserved blocks for directory
directory_blocks = 3


# Aufruf für Packer
packer_command = './z88dk-zx7 -f'
#packer_command = './lzsa      -f2 -r'


import sys
import os
import binascii
import tempfile
import subprocess


# kleine Hilfsfunktionen
# little helpers

def is_ascii( char):
    b = ord( char)
    return( b > 64 and b < 91) or ( b > 47 and b < 58) or ( b > 96 and b < 123)


def high( number):
    return ( number >> 8)


def low( number):
    return ( number & 0xff)


def load_picture( name, compress = True):
    result = bytearray()

    if not os.path.isfile( picturename):
        # no picture
        return result, "no Icon"

    #print( "found: %s" % picturename)
    if not compress:
        with open( picturename, 'rb') as file:
            result = bytearray( file.read())
    else:
        tempfd, temppath = tempfile.mkstemp()
        commandstr =  '%s %s %s' % ( packer_command, picturename, temppath)
        subprocess.run( commandstr, shell = True, stdout = subprocess.PIPE, stderr = subprocess.STDOUT)
        with open( temppath, 'rb') as file:
            result = bytearray( file.read())
        os.unlink( temppath)

    #print( "bytes loaded: %d" % len( result))
    
    # auf 128 Byte Block auffüllen 
    if( len( result) % 128) != 0:
        result.extend( bytearray( 128 - len( result) % 128))
    
    head, tail = os.path.split( picturename)
    return result, tail




# Hauptprogramm
# main
if len( sys.argv) < 3:
    print( "not enough arguments")
    print( "%s <Modul-type> <KCC-Files>" % ( sys.argv[ 0]))
    print( "valid Modul-types: M045, M046, M047")
    sys.exit( -1)

# maximal verfügbare Blöcke, Hardwareabhängig
# all availible blocks, depends on hardware
modultype = sys.argv[ 1]
modultype = modultype.upper()

if modultype == 'M045':
    maxblocks = 256
elif modultype == 'M046':
    maxblocks = 512
elif modultype == 'M047':
    maxblocks = 1024
else:
    print( "Modul type %s not supported!" % modultype)
    print( "%s <Modul-type> <KCC-Files>" % ( sys.argv[ 0]))
    print( "valid Modul-types: M045, M046, M047")
    sys.exit( -2)

directory = bytearray()
romdata = bytearray()
startblock = program_blocks + directory_blocks
prog_count = 0

# Kopf
# header
print( "program   load  end+1 length start  ram bstrt blocks pstart  pblks plen  Bemerkung/remark")

for filename in sys.argv[ 2:]:

    if os.path.exists( filename):
        # cut header and generate compressed bytes
        tempfd1, temppath1 = tempfile.mkstemp()
        tempfd2, temppath2 = tempfile.mkstemp()
        commandstr =  'dd if=%s of=%s bs=128 skip=1 && %s %s %s' % ( filename, temppath1, packer_command, temppath1, temppath2)
        #print( commandstr)
        result = subprocess.run( commandstr, shell = True, stdout = subprocess.PIPE, stderr = subprocess.STDOUT)
        #print( result)
        if result.returncode > 0:
            print( "Error %d in \"%s\"" % ( result.returncode, result.args))
        with open( temppath2, 'rb') as file:
            compressed_bytes = file.read()
        os.unlink( temppath1)
        os.unlink( temppath2)

        # read uncompressed file
        with open( filename, 'rb') as file:
            bytes = file.read()

        # check if we can use compression
        if len( compressed_bytes) > 0 and ( len( bytes) - 128) > len( compressed_bytes):
            compressed = True
        else:
            compressed = False

        # Variante: Name aus KCC-Datei holen
        # variant from file content
        #name = bytearray( bytes[ 0: 11])
        #name = name.decode()
        # Variante: Name aus Dateinamen nehmen
        # variant from filename
        name = os.path.basename( filename).split( '.')[0]
        name = name[0:8]
        #name = bytearray( name, encoding='ascii')
        #name = name.decode()
        ext  = os.path.basename( filename).split( '.')[1]

        # for debugging
        #if name == 'BIGTURN':
        #    compressed = False

        picturename = os.path.splitext( filename)[0] + ".ICN"
        picture, pic_remark = load_picture( picturename)
        piclength = len( picture)
        picblocks = int( piclength / 128)

        addrargs  = bytes[ 16]
        loadaddr  = bytes[ 17] + ( bytes[ 18] << 8)
        endaddr   = bytes[ 19] + ( bytes[ 20] << 8)
        startaddr = bytes[ 21] + ( bytes[ 22] << 8)
        proglength = endaddr - loadaddr

        if endaddr <= 0x4000:
            ram = "16k"
        elif endaddr < 0x8000:
            ram = "32k"
        else:
            ram = "48k"

        # Auswertung Kopf
        print( "%-8s: " % name, end = '')
        if addrargs < 3:
            print( "%04xh %04xh %04xh  xxxxx  " % ( loadaddr, endaddr, proglength), end = '')
            control_byte = 2
        else:
            print( "%04xh %04xh %04xh  %04xh  " % ( loadaddr, endaddr, proglength, startaddr), end = '')
            control_byte = 3
        
        # Bit 5, wenn mehr als 16k RAM
        if not ( ram == "16k"):
            control_byte += ( 1 << 5)

        # Bit 6, wenn komprimiert
        if compressed:
            control_byte += ( 1 << 6)

        # restliche Daten, bzw. die Payload nehmen
        if compressed:
            data = bytearray( compressed_bytes)
            compressed_length = len( compressed_bytes)
            load_compressed = 0x8000 - compressed_length

            ratio_percent = 100.0 * len( compressed_bytes) / ( len ( bytes) - 128)
            compression_remark = "compressed (%.1f%%)" % ( ratio_percent)
        else:
            data = bytearray( bytes[ 128:])
            compression_remark = " no compression"
            compressed_length = 0
            load_compressed = 0
        
        # auf 128 Byte Block auffüllen 
        if( len( data) % 128) != 0:
            fillup = 128 - len( data) % 128
            data.extend( bytearray( [0xff] * fillup))
            #print( "Warning: data length was no multiple of 128")
        
        blocks = int( len( data) / 128)
        if len( picture) > 0:
            picstart = startblock + blocks
        else:
            picstart = 0xffff

        print( "%s %5d %5d  " % ( ram, startblock, blocks), end = '')
        print( " %5d %5d  %04Xh " % ( picstart, picblocks, piclength), end = '')

        # Verzeichniseintrag erzeugen
        # create dir entry
        directory_entry = bytearray( 28)
        # Steuerbyte
        # controly byte
        directory_entry[ 0] = control_byte
        # Name
        # insert name
        directory_entry[ 1:9] = bytearray( name.ljust( 8), encoding='ascii')
        # Erweiterung
        # insert extension
        directory_entry[ 9:12] = bytearray( ext.ljust( 3), encoding='ascii')
        # Adressen und Startblock
        # set addressen and blocks
        directory_entry[ 12] = low( loadaddr)
        directory_entry[ 13] = high( loadaddr)

        directory_entry[ 14] = low( proglength)
        directory_entry[ 15] = high( proglength)
        
        directory_entry[ 16] = low( startaddr)
        directory_entry[ 17] = high( startaddr)
        
        directory_entry[ 18] = low( startblock)
        directory_entry[ 19] = high( startblock)
        
        directory_entry[ 20] = low( load_compressed)
        directory_entry[ 21] = high( load_compressed)
        
        directory_entry[ 22] = low( compressed_length)
        directory_entry[ 23] = high( compressed_length)
        
        directory_entry[ 24] = low( picstart)
        directory_entry[ 25] = high( picstart)
        
        directory_entry[ 26] = low( piclength)
        directory_entry[ 27] = high( piclength)
        #print( binascii.hexlify( directory_entry))

        if( startblock + blocks + picblocks) > maxblocks:
            print( "ignored, to big")
        else:
            prog_count += 1
            print( "(%d) added, %s, %s" % ( prog_count, compression_remark, pic_remark))
            directory.extend( directory_entry)
            romdata.extend( data)
            romdata.extend( picture)
            startblock += blocks
            startblock += picblocks

if len( directory) == 0:
    print( "ERROR: no ROM content, abort")
    sys.exit( -1)

if len( directory) > ( directory_blocks * 128):
    print( "ERROR: not enough space for directory reserved, abort")
    sys.exit( -1)

# mark last entry
directory[ -28] |= ( 1 << 7)

# extend to full block
filllength = directory_blocks * 128 - len( directory)
directory.extend( bytearray( [0xff] * filllength)) 
if filllength > 128:
    print( "INFO: you can reduce number of directory blocks by %d" % ( filllength / 128))

print()

# statistics
dir_blocks      = int( len( directory) / 128)
data_blocks     = int( len( romdata) / 128)
free_blocks     = maxblocks - program_blocks - dir_blocks - data_blocks
print( "total size of ROM: %4d block(s), %6d bytes" % ( maxblocks, 128 * maxblocks))
print( "size of program:   %4d block(s), %6d bytes" % ( program_blocks, 128 * program_blocks))
print( "size of directory: %4d block(s), %6d bytes" % ( dir_blocks, 128 * dir_blocks))
print( "size of data:      %4d block(s), %6d bytes" % ( data_blocks, 128 * data_blocks))
print( "free:              %4d block(s), %6d bytes" % ( free_blocks, 128 *free_blocks))


outfile = open( 'directory.bin', 'w+b')
outfile.write( directory)
outfile.close()
print( "%d bytes written to directory.bin" % ( len( directory)))


outfile = open( 'romdata.bin', 'w+b')
outfile.write( romdata)
outfile.close()
print( "%d bytes written to romdata.bin" % ( len( romdata)))
