ifndef MODULTYP
# Bitte einen Modultyp auswählen
#MODULTYP = M045
#MODULTYP = M046
#MODULTYP = M047
#MODULTYP = M062_32k
MODULTYP = M062_64k
endif

BINFILE = MODUL_$(MODULTYP).BIN

all: $(BINFILE)

$(BINFILE): romstart.bin romdata.bin directory.bin
	cat romstart.bin  directory.bin romdata.bin  > $(BINFILE)

romstart.bin: romstart.asm  datetime.inc date.inc
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

romdata.bin: directory.bin

directory.bin:
	cd helpers && ./create_ROM-Image.py  $(MODULTYP)  kcc_tools/*.KCC
	mv helpers/*.bin .

FORCE:

clean:
	rm -f romstart.bin
	rm -f romstart.symbol
	rm -f datetime.inc
	rm -f date.inc
	rm -f modul.inc

dist-clean: clean
	rm -f $(BINFILE)
	rm -f directory.bin
	rm -f romdata.bin
	rm -f romstartm045.bin
	rm -f romstartm046.bin
	rm -f romstartm047.bin
	rm -f romstartm062_32k.bin
	rm -f romstartm062_64k.bin

romstarts:
	export MODULTYP=M045     && $(MAKE) romstart.bin && mv romstart.bin romstartm045.bin
	export MODULTYP=M046     && $(MAKE) romstart.bin && mv romstart.bin romstartm046.bin
	export MODULTYP=M047     && $(MAKE) romstart.bin && mv romstart.bin romstartm047.bin
	export MODULTYP=M062_32k && $(MAKE) romstart.bin && mv romstart.bin romstartm062_32k.bin
	export MODULTYP=M062_64k && $(MAKE) romstart.bin && mv romstart.bin romstartm062_64k.bin
