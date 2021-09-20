; vim: set tabstop=8 noexpandtab:

; ROMSTART-Software für M045/M046/M047
; by Bert Lange, 12/2020


; für Anzeige und Modulsteuerworte relevant:
;BLOCKS	EQU	256	; M045
;BLOCKS	EQU	512	; M046
BLOCKS	EQU	1024	; M047


; genutzte Systemzellen:
	; IX + 2  maximale Anzahl an Programmen
	; IX + 3  aktuelle Auswahl
	; IX + 11 Modulschacht

; Anzahl der für die ROM-Verwaltung (nur Programm) reservierten Blöcke
PRGBLOCS	EQU	11

; Anzahl der maximal dargestellte Verzeichniseinträge
MAXENTRY	EQU	18

; Position des Inhaltsverzeichnisses
DIRZEILE	EQU	11
DIRSPALTE	EQU	3 

; Position der Grafikvorschau
ICON_X		EQU	23
ICON_Y		EQU	2

; Größe der Grafikvorschau
ICON_WIDTH 	EQU 	14
ICON_HEIGHT	EQU 	8


;---------------------------------------- 

PV1     EQU     0F003h 	; Sprungverteiler
CAOSVER EQU 	0EDFFh 	; CAOS Version (ab 4.1)


; CAOS Funktionsnummern
; bzw. Unterprogramme
CRT     EQU     000h
KBD     EQU     004h
KBDS	EQU	00Ch
BYE     EQU     00Dh
KBDZ	EQU	00Eh
COLORUP	EQU	00Fh
LOOP	EQU	012h
ERRM	EQU	019h
HLHX	EQU	01Ah
AHEX	EQU	01Ch
OSTR    EQU     023h
MODU	EQU	026h
SPACE	EQU	02Bh
CRLF	EQU	02Ch
HOME	EQU	02Dh
PADR	EQU	034h
WININ	EQU	03Ch
WINAK	EQU	03Dh
LINE	EQU	03Eh
CSTBT	EQU	042h
ZKOUT   EQU     045h

; Sonderzeichen
BREAK	EQU	003h
CUL	EQU	008h
CUR	EQU	009h
CUD     EQU     00Ah
LF      EQU     00Ah
CUU     EQU     00Bh
CLS     EQU     00Ch
CR      EQU     00Dh
STOP	EQU	013h
ESC	EQU	01Bh
SPC	EQU	020h

; VRAM-Zellen
VRAM    EQU     08000h
ARGN    EQU     0B781h
ARG1	EQU	0B782h
ARG2	EQU	0B784h
ARG3	EQU	0B786h
ARG4	EQU	0B788h
CURSO   EQU     0B7A0h
STBT	EQU	0B7A2h
COLOR	EQU	0B7A3h
NCAOS	EQU	0B7B4h
FARB	EQU	0B7D6h

; manuelle Adressen
JUMPI	EQU	00010h
VSWITCH	EQU	0400Eh
VEND	EQU	04032h
HCOPY	EQU	00010h


        ORG     0C000h

	; Code für Autostart in Schacht 08 

	; Hilfsprogramm zum Modul umschalten (41h -> C1h)
	; umkopieren und starten
	LD	HL, VSWITCH		; Quelle
	LD	DE, JUMPI		; Ziel
	LD	BC, VEND - VSWITCH	; Länge
	LDIR
	JP	JUMPI


CSWITCH:
	; BASIC wegschalten (nur bei 85/3 nötig, bei 85/4 unproblematisch)
	LD	A, 2
	LD	L, 02h		; Schacht
	LD	D, 0		; Steuerwort
	CALL	PV1
	DB	MODU

	; Modul auf Adresse C000 schalten
	LD	A, 2
	LD	L, 008h		; Schacht
	LD	D, 0C1h 	; Steuerwort
	CALL	PV1
	DB	MODU

	LD	(IX+11), L	; Schacht sichern

	; RAM4 zuschalten (nur bei 85/4 nötig, bei 85/3 unproblematisch)
	LD	A, 2
	LD	L, 004h		; Schacht
	LD	D, 003h 	; Steuerwort
	CALL	PV1
	DB	MODU

	JP	CSTART

;HCOPY:
CCOPY:
	; Hilfsprogramm zum Block umkopieren
	; mit Modulumschaltung
	; in	HL = Quelladresse
	;	BC = Anzahl
	;	DE = Zieladresse
	;	 A = Modulsteuerwort
	; Modul mit Steuerwort schalten
	PUSH	BC
	LD	B, (IX+11)
	LD	C, 080h
	OUT	(C), A
	POP	BC

	; umkopieren
	LDIR

	; ROM-Bank zurückschalten
	PUSH	BC
	LD	B, (IX+11)
	LD	C, 080h
	LD	A, 0C1h
	OUT	(C), A
	POP	BC

	RET

CEND:

	; Menüwort
	DB	07Fh, 07Fh
	DB	'ROMSTART'
	DB	01h

	; Start über Menü
MENUSTART:
	
	; suche eigenen Modulschacht
	; nicht nötig bei Autostart im Schacht 08
	LD	BC, 00780h	; Schacht 08
SEARCH:
	INC	B
	LD	A, 0FFh		; Ende erreicht?
	CP	B
	JR	Z, NOTFOUND
	IN	A, (C)
	CP	001h		; Autostartkennung?
	JR	Z, CHECKON
	CP	STRUKTB
	JR	NZ, SEARCH
CHECKON:	
	LD	H, 0B8h		; Modulsteuerwortspeicher
	LD	L, B
	LD	A, (HL)
	BIT	0, A		; Modul eingeschaltet?
	JR	Z, SEARCH	; nein, weitersuchen
	LD	(IX+11), B	; ja, Modulschacht sichern
	JR	CSTART
NOTFOUND:
	; Modul nicht gefunden
	; oder Kennbyte (Hardware) passt nicht zu Programm (Software)
	; oder Modul nicht richtig eingeschaltet
        CALL	PV1
        DB  	OSTR
MSGBYTE DB      'Strukturbyte ', 0
	CALL	PV1
	DB	ERRM
	RET

	; Einsprung für Autostart
CSTART:
	; HCOPY umkopieren
	LD	HL, CCOPY  		; Quelle
	LD	DE, JUMPI		; Ziel
	LD	BC, CEND - CCOPY  	; Länge
	LDIR

	; Fenster initialisieren
	LD	A, 9
	LD	HL, 0000h
	LD	DE, 2028h ; Zeilen/Spalten
	LD	C, L
	CALL	PV1
	DB	WININ

	; Fenster aktivieren
	LD	A, 9
	CALL	PV1
	DB	WINAK

	; Farbe setzen, so geht es auch gleich auf dem /3er
	LD	A, 07Ah
	LD	(COLOR), A

	; Bildschirm löschen
	LD  	A, CLS
	CALL 	PV1
	DB  	CRT

	
	; Systeminfo ausgeben
	; Modul
	; Programmname
	; System
	; bei 85/3 auch RAM-Modul

        LD  	L,  2		; Cursorspalte
	LD	H, 31		; Cursorzeile 
        LD  	(CURSO), HL

        ; Ausgabe Autor
        CALL	PV1
        DB  	OSTR
AUTHOR	DB 	96, ' B. Lange, KC-Club', 0

        LD  	L, 28		; Cursorspalte
	LD	H, 31		; Cursorzeile 
        LD  	(CURSO), HL

        ; Ausgabe Buildzeit
        LD  	HL, BUILDSTR
        CALL	PV1
        DB  	ZKOUT


        ; Cursor setzen
        LD  	L,  3		; Cursorspalte
	LD	H,  3		; Cursorzeile 
        LD  	(CURSO), HL

        ; Ausgabe Titel
        CALL 	PV1
        DB  	OSTR
MSGTITL DB      'ROM-Kollektion', 0


	
	LD	A, (0E011h)	; CAOS ab 4.1 hat dort 07f7fh stehen
	CP	07Fh		; KC85/4?
	JR	Z, A854

        ; Ausgabe KC bzw. CAOS
        ; Cursor setzen
        LD  	L,  3		; Cursorspalte
	LD	H,  8		; Cursorzeile 
        LD  	(CURSO), HL

        CALL 	PV1
        DB  	OSTR
MSG853	DB	'KC85/3', 0
        

        LD  	L,  3		; Cursorspalte
	LD	H,  9		; Cursorzeile 
        LD  	(CURSO), HL

	; auf KC85/3 nach RAM-Modulen (M011/M022) suchen
	; Anzeige RAM bzw. ob Modul genutzt
	LD	A, 0F4h		; M022
	CALL	MODSUCH
	JR	NC, RAMFOUND
	LD	A, 0F6h		; M011
	CALL	MODSUCH
	JR	NC, RAMFOUND
	; kein RAM-Modul gefunden
	; Ausgabe wenig RAM
	CALL	PV1
	DB	OSTR
MSGNRAM	DB	'16k RAM', 0
	JR	AEND


RAMFOUND:
	; M022/M011 gefunden
	LD	B, A		; Schacht wegspeichern
        CALL	PV1
        DB  	OSTR
MSGM022	DB	'32k RAM (M022/M011)', 0

	; M022 oder M011 einschalten
MODON:	LD	A, 2
	LD	L, B   		; Schacht
	LD	D, 043h 	; Steuerwort
	CALL	PV1
	DB	MODU
	
	JR	AEND

A854:
	; bei 85/4+ nur CAOS-Version ausgeben
        ; Cursor setzen
        LD  	L,  3		; Cursorspalte
	LD	H,  9		; Cursorzeile 
        LD  	(CURSO), HL

	CALL	PV1
	DB	OSTR
MSGCAOS	DB	'CAOS ', 0

	LD	A, (CAOSVER)
	RRCA
	RRCA
	RRCA
	RRCA
	AND	00Fh
	ADD	A, 030h
	CALL	PV1
	DB	CRT

	LD	A, '.'
	CALL	PV1
	DB	CRT
	
	LD	A, (CAOSVER)
	AND	00Fh
	ADD	A, 030h
	CALL	PV1
	DB	CRT

AEND:
        LD  	L,  3		; Cursorspalte
	LD	H,  2		; Cursorzeile 
        LD  	(CURSO), HL

        ; Ausgabe Titel
        LD  	HL, MSGMODU
        CALL 	PV1
        DB  	ZKOUT


        LD  	L, DIRSPALTE+2	; Cursorspalte
	LD	H, DIRZEILE	; Cursorzeile 
        LD  	(CURSO), HL

	; Farbe ändern
	LD	HL, COLOR
	DEC	(HL)
	DEC	(HL)

        ; Ausgabe Überschrift/Header
        CALL	PV1
        DB  	OSTR
MSGHEAD	DB	'NAME           LOAD ENDE START', 0
	
	; Farbe zurückändern
	LD	HL, COLOR
	INC	(HL)
	INC	(HL)

	CALL	PV1
	DB	CRLF
	
	; Fenster für Vorschau definieren
	LD	A, 8
	; H = Ypos, L = Xpos
	; D = Höhe, E = Breite
	;LD	HL, 0 + (ICON_Y - 1) << 8 + (ICON_X - 1)
	;LD	DE, 0 + (ICON_HEIGHT + 2) << 8 + (ICON_WIDTH + 2)
	LD	HL, 0 + (ICON_Y - 0) << 8 + (ICON_X - 0)
	LD	DE, 0 + (ICON_HEIGHT + 0) << 8 + (ICON_WIDTH + 0)
	LD	C, L
	CALL	PV1
	DB	WININ

	; Farbe einstellen
	LD	A, 2
	LD	(ARGN), A
	LD	E, 0
	LD	L, 0fh
	CALL	PV1
	DB	COLORUP

	CALL	CLRICON

	; Ausgabe Directory
	LD	IY, DIRSTART
	LD	(IX+2), 0	; Maximalzahl
	LD	(IX+3), 1	; aktuelle Position/Auswahl
	
DIRNEXT:
	; Anzahl mitzählen
	INC	(IX+2)		; Maximalzahl erhöhen

	;LD	HL, IY
	; IY -> HL
	PUSH	IY
	POP	HL		; zeigt auf Controlbyte
	INC	HL		; zeigt jetzt auf Name

	; erste Spalte, Leerzeichen
	LD	A, DIRSPALTE+2
	CALL	NSPACE

	; Ausgabe Name+Erweiterung
	LD	B, 11		; Anzahl
NNEXT: 	LD	A, (HL)
	CALL	PV1
	DB	CRT
	INC	HL
	DJNZ	NNEXT

	LD	A, 4
	CALL	NSPACE

	; Loadadresse
	LD	E, (HL)		; +12
	INC	HL
	LD	D, (HL)		; +13
	EX	DE, HL		; DE = Ladeadresse
	CALL	PV1
	DB	HLHX
	EX	DE, HL		; HL = Zeiger

	; Endadresse (Loadadresse + Länge)
	INC	HL
	LD	C, (HL)		; + 14
	INC	HL
	LD	B, (HL)		; + 15 Länge
	EX	DE, HL		; HL = Ladeadresse
	ADD	HL, BC		; HL = Ladeadresse + Länge
	CALL	PV1
	DB	HLHX
	EX	DE, HL		; HL = Zeiger
	
	BIT	0, (IY+0)	; Test auf startfähig
	JR	Z, NOSTART

	; Startadresse
	INC	HL
	LD	E, (HL)		; +16
	INC	HL
	LD	D, (HL)		; +17
	EX	DE, HL		; HL = Startadresse
	CALL	PV1
	DB	HLHX
NOSTART:

	; letzter Eintrag? (MSB ist gesetzt)
	BIT	7, (IY+0)
	JR	NZ, KEYWAIT
    
	; Bildschirm voll?
	LD	A, (IX+2)
	CP	MAXENTRY	; maximale Zeilenanzahl
	JR	Z, KEYWAIT

	; sonst neue Zeile und
	; nächster Verzeichniseintrag
	CALL	PV1
	DB	CRLF
	LD	BC, 28
	ADD	IY, BC
	JR	DIRNEXT

KEYWAIT:
	; Markierung ausgeben
	LD	A, (IX+3)	; aktuelle Position/Auswahl
	ADD	A, DIRZEILE
        LD  	L, DIRSPALTE	; Cursorspalte
	LD	H, A 		; Cursorzeile 
        LD  	(CURSO), HL

	LD	IY, STBT	; IRM-Steuerbyte modifizieren
	SET	3, (IY+0)
	LD	A, CUR		; Pfeil ausgeben
	CALL	PV1
	DB	CRT
	RES	3, (IY+0)	; Steuerbyte zurücksetzen
	
	CALL	GETDIR		; HL = Zeiger auf Verzeichniseintrag
	PUSH	HL
	CALL	RAMWARN		; ggf. auf RAM-Probleme hinweisen
	POP     HL		; HL = Zeiger auf Verzeichniseintrag
	CALL	BILDCHK		; Bild zeigen, wenn vorhanden


        ; auf Taste warten
KEYIN:
	CALL 	PV1
        DB 	KBDZ
	JR	NC, KEYIN
	
	; Markierung entfernen
	PUSH	AF
	LD	A, (IX+3)	; aktuelle Position/Auswahl	
	ADD	A, DIRZEILE
        LD  	L, DIRSPALTE	; Cursorspalte
	LD	H, A 		; Cursorzeile 
        LD  	(CURSO), HL

	CALL	PV1
	DB	SPACE
	
	CALL	CLRICON
	
	POP	AF
	
	; ESC		Abbruch ins CAOS
	; STOP		Abbruch ins CAOS
	; Ctrl-C	Abbruch ins CAOS
	; Q     	Abbruch ins CAOS
	; L		Laden ohne Start
	; Cursor hoch	vorhergehender Eintrag
	; Cursor runter	nächster Eintrag
	; Cursor links	erster Eintrag
	; Cursor rechts	letzter Eintrag
	; Enter        	Laden & Starten
	; Space        	Laden & Starten
	

	CP	ESC
	JR	Z, EXIT

	CP	BREAK
	JR	Z, EXIT

	CP	STOP
	JR	Z, EXIT

	CP	'Q'
	JR	Z, EXIT

	CP	CUU
	JR	Z, SETPREV

	CP	CUD
	JR	Z, SETNEXT

	CP	CUL
	JR	Z, SETFIRST

	CP	CUR
	JR	Z, SETLAST


	CP	CR
	SCF			; CY = 1 -> Start
	JR	Z, LOADPROG

	CP	SPC
	SCF			; CY = 1 -> Start
	JR	Z, LOADPROG
	

	CP	'L'
	SCF
	CCF			; CY = 0 -> Load only
	JR	Z, LOADPROG

KEYNEXT:			; unbekannte Taste
	JR	KEYWAIT

EXIT:
	CALL	CLEARSCR
	JP	JUMPCAOS
	
SETPREV:
	DEC	(IX+3)		; aktuelle Auswahl verringen
	LD	A, (IX+3)
	JR	Z, SETLAST
	JR	KEYNEXT

SETNEXT:
	INC	(IX+3)		; aktuelle Auswahl erhöhen
	LD	A, (IX+2)	; mit Maximal vergleichen
	CP	(IX+3)
	JR	C, SETFIRST
	JR	KEYNEXT

SETFIRST:
	LD	(IX+3), 1	; aktuelle Auswahl = 1
	JR	KEYNEXT

SETLAST:
	LD	A, (IX+2)	; aktuelle Auswahl = max.
	LD	(IX+3), A
	JR	KEYNEXT


LOADPROG:
	PUSH	AF		; load/start-Flag sichern
	; Position holen
	; Zeiger auf Verzeichniseintrag ermitteln
	CALL	GETDIR
	PUSH	HL
	POP	IY		; IY zeigt auf Verzeichniseintrag
	
	; copy
	LD	L, (IY+18)	; HL = Startblock
	LD	H, (IY+19)
	
	; prüfen ob komprimiert
	BIT	6, (IY+0)
	JR	Z, COPYONLY

	; ja, komprimiert
	LD	E, (IY+20)	; DE = Ladeadresse gepackt
	LD	D, (IY+21)
	LD	C, (IY+22)	; BC = Länge gepackt
	LD	B, (IY+23)

	PUSH	DE		; Adresse gepackte Daten
	CALL	ROMCOPY
	POP	HL		; Adresse gepackte Daten
	
	LD	E, (IY+12)	; DE = Ladeadresse
	LD	D, (IY+13)
	
	;   HL: source address (compressed data)
	;   DE: destination address (decompressing)
	CALL	dzx7_turbo
	JR	GO_RUN

COPYONLY:
	LD	E, (IY+12)	; DE = Ladeadresse
	LD	D, (IY+13)
	LD	C, (IY+14)	; BC = Programmlänge
	LD	B, (IY+15)

	CALL	ROMCOPY

GO_RUN:
	CALL	CLEARSCR
	POP	AF		; load/start-Flag
	JR	NC, JUMPCAOS

	LD	A, (IY+0)	; Controlbyte holen
	LD	L, (IY+16)	; Startadresse holen
	LD	H, (IY+17)
	AND	007h		; maskieren
	CP	2		; 2 = LOAD only
	JR	Z, JUMPCAOS
	
	LD	DE, JUMPCAOS	; auf Stack, falls
	PUSH	DE		; Programm RET verwendet
	JP	(HL)		; dann Start!

JUMPCAOS:
        ; zurueck in CAOS
        CALL PV1
        DB  LOOP
        ;DB  BYE; geht nicht -> fängt bei Autostart sofort von vorn an
        ;RET    ; geht auch nicht -> Stack u.U. leer


	; Funktion GET_MOD
	; Modulsteuerwort aus Blocknummer ermitteln
	; in:  	HL	Blocknummer
	; out: 	A	Modulsteuerwort
GET_MOD:
	; HL div 64 -> A Nr. des Eintrags aus MODCTRL-Tabelle
	PUSH	HL
	PUSH	BC
	; https://www.chilliant.com/z80shift.html
        ; T-Cycles: 42
        ; Bytes: 7
        ; Trashed: A
        XOR A
        ADD HL, HL
        RLA
        ADD HL, HL
        RLA
        LD L, H
        LD H, A

	; Eintrag aus MODCTRL-Tabelle holen
	LD 	BC, MODCTRL
	ADD 	HL, BC
	LD	A, (HL)
	POP	BC
	POP	HL
	RET


	; Funktion GET_ADDR
	; Quelladresse aus Blocknummer ermitteln
	; in:  	HL	Blocknummer
	;	HL	Quelladresse

GET_ADDR:
	; HL mod 64 * 128 -> Quelladresse 
	PUSH	AF
	LD	A, L
	AND	03Fh
	LD	L, A
	XOR	A
	LD	H, A
	; https://www.chilliant.com/z80shift.html
        ; T-Cycles: 32
        ; Bytes: 8
        ; Trashed: A
        ;XOR A
        SRL H
        RR L
        RRA
        LD H, L
        LD L, A
	LD	A, H
	ADD	A, MODBASE
	LD	H, A
	POP	AF
	RET

	
	; Bildschirm löschen
CLEARSCR:
	; Farbe setzen, so geht es auch gleich auf dem /3er
	LD	A, 039h
	LD	(COLOR), A

	; Bildschirm löschen
	LD  	A, CLS
	CALL 	PV1
	DB  	CRT
	RET


	; Zeiger auf Verzeichniseintrag ermitteln
	; OUT:
	;	HL	Zeiger auf Eintrag
	; ändert:
	;	AF
GETDIR:
	LD	A, (IX+3)	; aktuelle Auswahl
	LD	HL, DIRSTART
	DEC	A
	RET	Z		; schon fertig, weil Index=0

	PUSH	BC
	PUSH	DE
	LD	B, A
	LD	DE, 28
INCINDEX:
	ADD	HL, DE		; HL erhöhen
	DJNZ	INCINDEX

	POP	DE
	POP	BC
	RET

	
	; nach Vorschaubild suchen und ggf. ausgeben
	; IN:
	;	HL	Zeiger auf Verzeichniseintrag
	; ändert:
	;	IY
BILDCHK:
	; Bild vorhanden?
	
	PUSH	HL
	POP	IY
	LD	L, (IY+24)	; Bildblocknr holen
	LD	H, (IY+25)
	LD	C, (IY+26)	; BC = Bildlänge
	LD	B, (IY+27)

	LD	A, H		; auf 0FFFFh prüfen
	CP	0FFh		; = kein Bild
	RET	Z

BILD_DA:	
	; immer komprimiert
	LD	DE, 01000h	; Zwischenspeicher
	CALL	ROMCOPY

	; entpacken
	LD	DE, 00200h
	LD	HL, 01000h
	;   HL: source address (compressed data)
	;   DE: destination address (decompressing)
	CALL	dzx7_turbo	; entpacken
	
	; auf 0200h = Höhe
	; auf 0201h = Breite
	LD	HL, 0200h
	LD	C, (HL)		; Höhe
	INC	HL
	LD	B, (HL)		; Breite
	INC	HL		; erstes Bildpixel
	
	; Bildhöhe Cursor -> Pixel
	LD	A, C
	SLA	A
	SLA	A
	SLA	A		; Höhe in Pixelzeilen
	LD	C, A
	
	; welcher KC?
	LD	A, (0E011h)	; CAOS ab 4.1 hat dort 07f7fh stehen
	CP	07Fh		; KC85/4?
	JR	NZ, COPY853

COPY854:	; 85/4
	LD	DE, 08000h + ICON_X * 256 + ICON_Y * 8
	PUSH	BC		; Dimension sichern
	CALL	COPYIRM		; Pixeldaten
	POP	BC		; Dimension wiederherstellen
	LD	DE, 08000h + ICON_X * 256 + ICON_Y * 8
	CALL	COLORSW
	CALL	COPYIRM		; Farbdaten
	CALL	COLORSW

	RET


	; 85/3
	;	BC  Breite, Höhe (Dimensionen)
	;	HL  Quelladresse
COPY853:
	LD	D, ICON_X
	LD	E, ICON_Y * 8
	PUSH	BC		; Dimension sichern für Farbe
				; B = Breite, C = Höhe (Pixel)
C02:
	PUSH	BC
C01:
	PUSH	DE
	CALL	REPIXEL		; umrechnen (lassen)
	LDI			; Byte umladen
	POP	DE		; D = Spalte, E = Zeile		
	INC	DE		; D  weiterzählen
	LD	A, C
	OR	A
	JR	NZ, C01
	POP	BC
	LD	E, ICON_Y * 8	; Pixelzeile zurücksetzen
	INC	D		; nächste Spalte
	DEC	B
	JR	NZ, C02
	POP	BC		; Dimension wiederherstellen

	; und jetzt noch die Farbe
	LD	D, ICON_X
	LD	E, ICON_Y * 8
C04:
	PUSH	BC
C03:
	PUSH	DE
	CALL	RECOLOR		; umrechnen (lassen)
	LDI			; Byte umladen
	POP	DE		
	INC	DE		; DE weiterzählen
	LD	A, C
	OR	A
	JR	NZ, C03		; nächste Pixelzeile
	POP	BC
	LD	E, ICON_Y * 8	; Pixelzeile zurücksetzen
	INC	D		; nächste Spalte
	DEC	B		; Restbreite
	JR	NZ, C04

	RET


	; Koordinate in Pixeladresse umrechnen
	; IN
	;	D   Zeile
	;	E   Spalte
	; OUT	DE  Pixeladresse
REPIXEL:
	PUSH	HL
	LD	H, E
	LD	L, D
	CALL	PV1
	DB	PADR
	EX	DE, HL
	POP	HL
	RET


	; Koordinate in Farbadresse umrechnen
	; IN
	;	D   Zeile
	;	E   Spalte
	; OUT	DE  Farbadresse
RECOLOR:
	PUSH	HL
	LD	H, E
	LD	L, D
	CALL	PV1
	DB	PADR
	POP	HL
	RET


	; IN
	; 	DE  Zieladresse im IRM
	;	BC  Dimensionen
	;	HL  Quelladresse
COPYIRM:
	PUSH	BC
	LD	B, 0		; ausblenden
	LDIR			; nur Höhe kopieren
	POP	BC
	LD	E, ICON_Y * 8  	; Pixelzeile zurücksetzen
	INC	D		; nächste Spalte
	DEC	B
	JR	NZ, COPYIRM
	RET


	; schaltet zwischen Pixel & Farbebene um
COLORSW:
	CALL	PV1
	DB	OSTR
	DB	ESC
	DB	'9'
	DB	0
	RET


	; Daten von ROM in RAM kopieren
	; blockweise mit Modulsteuerung
	; IN	HL	Startblock (nicht Adresse)
	;	DE	Zieladresse
	;	BC	Länge
ROMCOPY:
	PUSH	HL
	CALL	GET_MOD		; A = Modulsteuerwort
	CALL	GET_ADDR	; HL = Quelladresse

	PUSH	BC		; Länge sichern
	PUSH	AF		; Steuerwort sichern

	; BC schon Null?
	XOR	A
	CP	B
	JR	C, CP128
	OR	080h
	CP	C
	JR	NC, CPREST
	; Rest ist kleiner als 128 
CP128:	LD	BC, 128
CPREST:
	POP	AF		; Steuerwort holen

	CALL	HCOPY
	POP	BC		; Länge holen

	POP	HL		; Blocknummer
	INC	HL		; erhöhen

	; BC noch mehr als 128 Bytes
	XOR	A
	CP	B
	JR	C, SUBBLK
	OR	128
	CP	C
	RET	NC

SUBBLK:	PUSH	HL
	LD	H, B
	LD	L, C
	LD	BC, -128
	ADD	HL, BC
	LD	B, H
	LD	C, L
	POP	HL
	JR	ROMCOPY


	; Platz für Vorschau löschen
CLRICON:
	; Fenster setzen
	LD	A, 8
	CALL	PV1
	DB	WINAK
	
	; Bildschirm löschen
	LD  	A, CLS
	CALL 	PV1
	DB  	CRT
	
	; Fenster zurück
	LD	A, 9
	CALL	PV1
	DB	WINAK
	
	RET

	; Modulsuche ab Schacht 8
	; in:
	; 	A	Modulkennung
	; out:
	;	CY = 0	gefunden und
	;	A	Modulschacht oder
	;	CY = 1	nicht gefunden
	; ändert:
	;	BC, DE
MODSUCH:
	LD	D, A		; D = gesuchte Kennung
	LD	BC, 00880h
MODNEXT:
	IN	A, (C)		; Kennung einlesen
	CP	D
	JR	Z, MODFOUND	; gefunden
	INC	B
	JR 	NZ, MODNEXT
				; nicht gefunden
	SCF			; Carry auf 1
	RET

MODFOUND:
	LD	A, B		; Modulschacht 
	SCF			; Carry auf 1
	CCF			; Carry invert
	RET


	; zeigt ggf. Warnung wg fehlendem Speicher
	; Adressbereich 4000h-7FFFh
	;
	; RAM4 komprimiert RAM32        Warnung
	; ja   x           x            nein
	; nein ja          x	        ja
	; nein nein        ja           ja
	; nein nein        nein         nein
	; IN:
	;	HL		Zeiger auf Verzeichnis
	; ändert:
	;	BC, HL, AF, IY
RAMWARN:
	; Test ob RAM4 beschreibbar ist
	LD	A, 55h
	LD	(7FFFh), A
	LD	A, (7FFFh)
	CP	55h
	RET	Z
	
	
	PUSH	HL
	POP	IY

        LD  	L,  3		; Cursorspalte
	LD	H,  6		; Cursorzeile 
        LD  	(CURSO), HL

	BIT	6, (IY+0)	; komprimiert?
	JR	NZ, R_ATT	; ja -> Warnung
	
	BIT	5, (IY+0)	; RAM32?
	JR	NZ, R_ATT	; ja -> Warnung
	
	LD	A, 19
	CALL	NSPACE
	RET
R_ATT:	
      	CALL	PV1
	DB	OSTR
MSGATTN	DB	'Achtung, kein RAM4!', 0
	
	RET

	; bestimmte Anzahl Leerzeichen ausgeben
	; in:
	;	A	Anzahl
NSPACE:
	PUSH	BC
	LD	B, A
NEXTSPC:
	CALL	PV1
	DB	SPACE
	DJNZ	NEXTSPC

	POP	BC
	RET


; Entpacker
    ;include 'dzx7_standard.asm'
    include 'dzx7_turbo.asm'
    ;include 'dzx7_mega.asm'


; Modulsteuerworte
MODBASE	EQU	0C0h		; Modul-Basisadresse
IF BLOCKS = 256
STRUKTB	EQU	070h
MSGMODU DB	'M045, 32k (4*8k)',0	
MODCTRL	DB	MODBASE + 001h, MODBASE + 011h
	DB	MODBASE + 021h, MODBASE + 031h
ENDIF
IF BLOCKS = 512
STRUKTB	EQU	071h
MSGMODU DB	'M046, 64k (8*8k)',0	
MODCTRL	DB	MODBASE + 001h, MODBASE + 005h
	DB	MODBASE + 011h, MODBASE + 015h
	DB	MODBASE + 021h, MODBASE + 025h
	DB	MODBASE + 031h, MODBASE + 035h
ENDIF
IF BLOCKS = 1024
STRUKTB	EQU	072h
MSGMODU DB	'M047, 128k (16*8k)',0	
MODCTRL	DB	MODBASE + 001h, MODBASE + 005h
	DB	MODBASE + 009h, MODBASE + 00Dh
	DB	MODBASE + 011h, MODBASE + 015h
	DB	MODBASE + 019h, MODBASE + 01Dh
	DB	MODBASE + 021h, MODBASE + 025h
	DB	MODBASE + 029h, MODBASE + 02Dh
	DB	MODBASE + 031h, MODBASE + 035h
	DB	MODBASE + 039h, MODBASE + 03Dh
ENDIF

; DEBUG
;include datetime.inc
; RELEASE
include date.inc

; fill space till directory (128 byte block)
FILLUP:	DEFL	DIRSTART - HERE

IF FILLUP > 128
.WARNING Adjust space for program! (decrease or increase PRGBLOCS)
ENDIF

HERE:	
	DEFS	FILLUP, 0FFh	

; xx Blocks für Programm reserviert
; anpassen mit PRGBLOCS und in create_ROM-Image.py
	ORG 0C000h + PRGBLOCS * 128
DIRSTART:

END
