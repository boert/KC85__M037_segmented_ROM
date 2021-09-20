all: MODUL.BIN

MODUL.BIN: romstart.bin romdata.bin directory.bin
		cat romstart.bin  directory.bin romdata.bin  > MODUL.BIN

romstart.bin: romstart.asm  datetime.inc date.inc  directory.bin 
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
		cd helpers && ./create_ROM-Image.py M047 kcc/*.KCC
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
