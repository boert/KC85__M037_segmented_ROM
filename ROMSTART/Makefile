# Bitte einen Modultyp auswählen
#MODULTYP = M045
#MODULTYP = M046
#MODULTYP = M047
#MODULTYP = M062_32k
MODULTYP = M062_64k

all: MODUL_$(MODULTYP).BIN

MODUL_$(MODULTYP).BIN: romstart.bin romdata.bin directory.bin
		cat romstart.bin  directory.bin romdata.bin  > MODUL_$(MODULTYP).BIN

romstart.bin: romstart.asm  datetime.inc date.inc  directory.bin 
		echo -n "$(MODULTYP)  EQU  1"              >  modul.inc
		pasmo -v romstart.asm romstart.bin romstart.symbol


datetime.inc: FORCE
		echo -n "BUILDSTR DB 'build: "      >  datetime.inc
		echo -n `date +"%d.%m.%y %H:%M"`    >> datetime.inc
		echo -n "', 0"                      >> datetime.inc

date.inc: FORCE
		echo -n "BUILDSTR DB          '"    >  date.inc
		echo -n `date +"%d.%m.%Y"`          >> date.inc
		echo -n "', 0"                      >> date.inc

directory.bin:
		cd helpers && ./create_ROM-Image.py  $(MODULTYP)  kcc_tools/*.KCC
		mv helpers/*.bin .

FORCE:

clean:
		rm -f romstart.bin
		rm -f romstart.symbol
		rm -f datetime.inc
		rm -f date.inc

dist-clean: clean
		rm -f MODUL.BIN
		rm -f directory.bin
		rm -f romdata.bin
