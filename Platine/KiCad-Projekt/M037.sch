EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 900  2700 0    50   Input ~ 0
AB0
Text GLabel 900  2600 0    50   Input ~ 0
AB2
Text GLabel 900  2500 0    50   Input ~ 0
AB4
Text GLabel 900  2400 0    50   Input ~ 0
AB6
Text GLabel 2300 2700 2    50   Input ~ 0
AB1
Text GLabel 2300 2600 2    50   Input ~ 0
AB3
Text GLabel 2300 2500 2    50   Input ~ 0
AB5
Text GLabel 2300 2400 2    50   Input ~ 0
AB7
Wire Wire Line
	2300 2400 2250 2400
Wire Wire Line
	2250 2500 2300 2500
Wire Wire Line
	2300 2600 2250 2600
Wire Wire Line
	2250 2700 2300 2700
Wire Wire Line
	950  2700 900  2700
Wire Wire Line
	900  2600 950  2600
Wire Wire Line
	950  2500 900  2500
Wire Wire Line
	900  2400 950  2400
$Comp
L power:GND #PWR033
U 1 1 5F2BA7BF
P 1400 6100
F 0 "#PWR033" H 1400 5850 50  0001 C CNN
F 1 "GND" H 1405 5927 50  0000 C CNN
F 2 "" H 1400 6100 50  0001 C CNN
F 3 "" H 1400 6100 50  0001 C CNN
	1    1400 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 6100 1400 6050
$Comp
L power:+5V #PWR026
U 1 1 5F2BB142
P 1400 5600
F 0 "#PWR026" H 1400 5450 50  0001 C CNN
F 1 "+5V" H 1415 5773 50  0000 C CNN
F 2 "" H 1400 5600 50  0001 C CNN
F 3 "" H 1400 5600 50  0001 C CNN
	1    1400 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 5600 1400 5650
$Comp
L power:GND #PWR03
U 1 1 5F2BCBBC
P 3100 1800
F 0 "#PWR03" H 3100 1550 50  0001 C CNN
F 1 "GND" H 3105 1627 50  0000 C CNN
F 2 "" H 3100 1800 50  0001 C CNN
F 3 "" H 3100 1800 50  0001 C CNN
	1    3100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1800 3100 1700
Wire Wire Line
	3100 1700 3250 1700
Text GLabel 3000 900  0    50   Input ~ 0
AB5
Text GLabel 3000 1000 0    50   Input ~ 0
AB4
Text GLabel 3000 1100 0    50   Input ~ 0
AB7
Text GLabel 3000 1200 0    50   Input ~ 0
AB6
Text GLabel 3000 1300 0    50   Input ~ 0
AB1
Text GLabel 3000 1400 0    50   Input ~ 0
AB0
Text GLabel 3000 1600 0    50   Input ~ 0
AB2
Text GLabel 3000 1500 0    50   Input ~ 0
AB3
Wire Wire Line
	3000 900  3250 900 
Wire Wire Line
	3250 1000 3000 1000
Wire Wire Line
	3000 1100 3250 1100
Wire Wire Line
	3250 1200 3000 1200
Wire Wire Line
	3000 1300 3250 1300
Wire Wire Line
	3250 1400 3000 1400
Wire Wire Line
	3000 1500 3250 1500
Wire Wire Line
	3250 1600 3000 1600
$Comp
L power:GND #PWR034
U 1 1 5F2C19C9
P 1650 6100
F 0 "#PWR034" H 1650 5850 50  0001 C CNN
F 1 "GND" H 1655 5927 50  0000 C CNN
F 2 "" H 1650 6100 50  0001 C CNN
F 3 "" H 1650 6100 50  0001 C CNN
	1    1650 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6100 1650 6050
$Comp
L power:+5V #PWR027
U 1 1 5F2C19D4
P 1650 5600
F 0 "#PWR027" H 1650 5450 50  0001 C CNN
F 1 "+5V" H 1665 5773 50  0000 C CNN
F 2 "" H 1650 5600 50  0001 C CNN
F 3 "" H 1650 5600 50  0001 C CNN
	1    1650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5600 1650 5650
Text GLabel 2300 2200 2    50   Input ~ 0
AB9
Text GLabel 2300 2100 2    50   Input ~ 0
AB11
Text GLabel 900  2200 0    50   Input ~ 0
AB8
Text GLabel 900  2100 0    50   Input ~ 0
AB10
Wire Wire Line
	2300 2100 2250 2100
Wire Wire Line
	2250 2200 2300 2200
Wire Wire Line
	900  2100 950  2100
Wire Wire Line
	900  2200 950  2200
$Comp
L power:+5V #PWR012
U 1 1 5F2C7781
P 2300 3650
F 0 "#PWR012" H 2300 3500 50  0001 C CNN
F 1 "+5V" H 2400 3750 50  0000 C CNN
F 2 "" H 2300 3650 50  0001 C CNN
F 3 "" H 2300 3650 50  0001 C CNN
	1    2300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3700 2300 3700
Wire Wire Line
	2300 3700 2300 3650
$Comp
L power:+5V #PWR011
U 1 1 5F2C852A
P 900 3650
F 0 "#PWR011" H 900 3500 50  0001 C CNN
F 1 "+5V" H 800 3750 50  0000 C CNN
F 2 "" H 900 3650 50  0001 C CNN
F 3 "" H 900 3650 50  0001 C CNN
	1    900  3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  3650 900  3700
Wire Wire Line
	900  3700 950  3700
$Comp
L power:GND #PWR01
U 1 1 5F2C97FE
P 750 950
F 0 "#PWR01" H 750 700 50  0001 C CNN
F 1 "GND" H 650 850 50  0000 C CNN
F 2 "" H 750 950 50  0001 C CNN
F 3 "" H 750 950 50  0001 C CNN
	1    750  950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  900  900  900 
Wire Wire Line
	950  1000 900  1000
$Comp
L power:GND #PWR02
U 1 1 5F2CB9A2
P 2450 950
F 0 "#PWR02" H 2450 700 50  0001 C CNN
F 1 "GND" H 2550 850 50  0000 C CNN
F 2 "" H 2450 950 50  0001 C CNN
F 3 "" H 2450 950 50  0001 C CNN
	1    2450 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 900  2300 900 
Wire Wire Line
	2250 1000 2300 1000
Text GLabel 900  2000 0    50   Input ~ 0
AB12
Wire Wire Line
	900  2000 950  2000
Text GLabel 3000 2400 0    50   Input ~ 0
AB12
Text GLabel 3000 2600 0    50   Input ~ 0
AB8
Text GLabel 3000 2700 0    50   Input ~ 0
AB9
Text GLabel 3000 2800 0    50   Input ~ 0
AB10
Text GLabel 3000 2900 0    50   Input ~ 0
AB11
Wire Wire Line
	3000 2400 3250 2400
Wire Wire Line
	3000 2600 3250 2600
Wire Wire Line
	3000 2700 3250 2700
Wire Wire Line
	3000 2800 3250 2800
Wire Wire Line
	3000 2900 3250 2900
$Comp
L Device:R R1
U 1 1 5F2D3BD5
P 1150 4100
F 0 "R1" V 1100 3900 50  0000 C CNN
F 1 "100" V 1150 4100 50  0000 C CNN
F 2 "RFT_sonstiges:R_Axial_L6.3mm_D2.0mm_P10.16mm_Horizontal" V 1080 4100 50  0001 C CNN
F 3 "~" H 1150 4100 50  0001 C CNN
	1    1150 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5F2D476E
P 1150 4250
F 0 "R2" V 1100 4050 50  0000 C CNN
F 1 "100" V 1150 4250 50  0000 C CNN
F 2 "RFT_sonstiges:R_Axial_L6.3mm_D2.0mm_P10.16mm_Horizontal" V 1080 4250 50  0001 C CNN
F 3 "~" H 1150 4250 50  0001 C CNN
	1    1150 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5F2D4C51
P 1150 4400
F 0 "R3" V 1100 4200 50  0000 C CNN
F 1 "100" V 1150 4400 50  0000 C CNN
F 2 "RFT_sonstiges:R_Axial_L6.3mm_D2.0mm_P10.16mm_Horizontal" V 1080 4400 50  0001 C CNN
F 3 "~" H 1150 4400 50  0001 C CNN
	1    1150 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F2D5013
P 1150 4550
F 0 "R4" V 1100 4350 50  0000 C CNN
F 1 "100" V 1150 4550 50  0000 C CNN
F 2 "RFT_sonstiges:R_Axial_L6.3mm_D2.0mm_P10.16mm_Horizontal" V 1080 4550 50  0001 C CNN
F 3 "~" H 1150 4550 50  0001 C CNN
	1    1150 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5F2D5396
P 1150 4700
F 0 "R5" V 1100 4500 50  0000 C CNN
F 1 "100" V 1150 4700 50  0000 C CNN
F 2 "RFT_sonstiges:R_Axial_L6.3mm_D2.0mm_P10.16mm_Horizontal" V 1080 4700 50  0001 C CNN
F 3 "~" H 1150 4700 50  0001 C CNN
	1    1150 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5F2D5733
P 1150 4850
F 0 "R6" V 1100 4650 50  0000 C CNN
F 1 "100" V 1150 4850 50  0000 C CNN
F 2 "RFT_sonstiges:R_Axial_L6.3mm_D2.0mm_P10.16mm_Horizontal" V 1080 4850 50  0001 C CNN
F 3 "~" H 1150 4850 50  0001 C CNN
	1    1150 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5F2D5B3A
P 1150 5000
F 0 "R7" V 1100 4800 50  0000 C CNN
F 1 "100" V 1150 5000 50  0000 C CNN
F 2 "RFT_sonstiges:R_Axial_L6.3mm_D2.0mm_P10.16mm_Horizontal" V 1080 5000 50  0001 C CNN
F 3 "~" H 1150 5000 50  0001 C CNN
	1    1150 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5F2D5E7B
P 1150 5150
F 0 "R8" V 1100 4950 50  0000 C CNN
F 1 "100" V 1150 5150 50  0000 C CNN
F 2 "RFT_sonstiges:R_Axial_L6.3mm_D2.0mm_P10.16mm_Horizontal" V 1080 5150 50  0001 C CNN
F 3 "~" H 1150 5150 50  0001 C CNN
	1    1150 5150
	0    1    1    0   
$EndComp
Text GLabel 2300 1500 2    50   Input ~ 0
DB0
Text GLabel 2300 1400 2    50   Input ~ 0
DB2
Text GLabel 2300 1300 2    50   Input ~ 0
DB4
Text GLabel 2300 1200 2    50   Input ~ 0
DB6
Text GLabel 900  1500 0    50   Input ~ 0
DB1
Text GLabel 900  1400 0    50   Input ~ 0
DB3
Text GLabel 900  1300 0    50   Input ~ 0
DB5
Text GLabel 900  1200 0    50   Input ~ 0
DB7
Wire Wire Line
	900  1200 950  1200
Wire Wire Line
	950  1300 900  1300
Wire Wire Line
	900  1400 950  1400
Wire Wire Line
	950  1500 900  1500
Wire Wire Line
	2300 1500 2250 1500
Wire Wire Line
	2250 1400 2300 1400
Wire Wire Line
	2300 1300 2250 1300
Wire Wire Line
	2250 1200 2300 1200
Text GLabel 2300 1800 2    50   Input ~ 0
IE-Kette
Text GLabel 900  1800 0    50   Input ~ 0
IE-Kette
Wire Wire Line
	900  1800 950  1800
Wire Wire Line
	2300 1800 2250 1800
Text GLabel 900  1900 0    50   Input ~ 0
AB14
Wire Wire Line
	900  1900 950  1900
Text GLabel 2300 1900 2    50   Input ~ 0
AB15
Wire Wire Line
	2300 1900 2250 1900
Text GLabel 2300 2000 2    50   Input ~ 0
AB13
Wire Wire Line
	2300 2000 2250 2000
$Comp
L power:GND #PWR08
U 1 1 5F2F75CF
P 2300 2950
F 0 "#PWR08" H 2300 2700 50  0001 C CNN
F 1 "GND" H 2400 2850 50  0000 C CNN
F 2 "" H 2300 2950 50  0001 C CNN
F 3 "" H 2300 2950 50  0001 C CNN
	1    2300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2950 2300 2900
Wire Wire Line
	2300 2900 2250 2900
Text GLabel 800  4100 0    50   Input ~ 0
DB0
Text GLabel 800  4400 0    50   Input ~ 0
DB2
Text GLabel 800  4700 0    50   Input ~ 0
DB4
Text GLabel 800  5000 0    50   Input ~ 0
DB6
Text GLabel 800  4250 0    50   Input ~ 0
DB1
Text GLabel 800  4550 0    50   Input ~ 0
DB3
Text GLabel 800  4850 0    50   Input ~ 0
DB5
Text GLabel 800  5150 0    50   Input ~ 0
DB7
Wire Wire Line
	800  5150 1000 5150
Wire Wire Line
	800  5000 1000 5000
Wire Wire Line
	800  4850 1000 4850
Wire Wire Line
	800  4700 1000 4700
Wire Wire Line
	800  4550 1000 4550
Wire Wire Line
	800  4400 1000 4400
Wire Wire Line
	800  4250 1000 4250
Wire Wire Line
	800  4100 1000 4100
Text GLabel 2300 1700 2    39   Input ~ 0
~IORQ
Wire Wire Line
	2300 1700 2250 1700
Text GLabel 1850 4900 0    39   Input ~ 0
~IORQ
Wire Wire Line
	1850 4900 1950 4900
Text GLabel 900  1700 0    39   Input ~ 0
~MREQ
Wire Wire Line
	900  1700 950  1700
Text GLabel 1850 5150 0    39   Input ~ 0
~MREQ
Wire Wire Line
	1850 5150 1950 5150
Text GLabel 900  1600 0    39   Input ~ 0
~WR
Wire Wire Line
	900  1600 950  1600
Text GLabel 1800 4300 0    39   Input ~ 0
~WR
Wire Wire Line
	1800 4300 1950 4300
$Comp
L RFT_Digitalschaltkreise:DL374D D4
U 1 1 5F315588
P 3600 1350
F 0 "D4" H 3600 2017 50  0000 C CNN
F 1 "DL374D" H 3600 1926 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 3650 1250 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/g.cgi?174" H 3650 1250 50  0001 C CNN
	1    3600 1350
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL374D D4
U 2 1 5F316783
P 1400 5850
F 0 "D4" V 1500 6000 50  0000 L CNN
F 1 "DL374D" V 1500 5600 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 1450 5750 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/g.cgi?174" H 1450 5750 50  0001 C CNN
	2    1400 5850
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL374D D5
U 2 1 5F32B1CF
P 1650 5850
F 0 "D5" V 1750 6000 50  0000 L CNN
F 1 "DL374D" V 1750 5600 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 1700 5750 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/g.cgi?174" H 1700 5750 50  0001 C CNN
	2    1650 5850
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL374D D5
U 1 1 5F329A65
P 3600 2650
F 0 "D5" H 3600 3317 50  0000 C CNN
F 1 "DL374D" H 3600 3226 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 3650 2550 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/g.cgi?174" H 3650 2550 50  0001 C CNN
	1    3600 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3000 3250 3000
Wire Wire Line
	3100 3150 3100 3000
$Comp
L power:GND #PWR09
U 1 1 5F2C19DF
P 3100 3150
F 0 "#PWR09" H 3100 2900 50  0001 C CNN
F 1 "GND" H 3105 2977 50  0000 C CNN
F 2 "" H 3100 3150 50  0001 C CNN
F 3 "" H 3100 3150 50  0001 C CNN
	1    3100 3150
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL004D D2
U 2 1 5F345408
P 2150 4900
F 0 "D2" H 2400 4950 50  0000 C CNN
F 1 "DL004D" H 2450 4850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2150 4900 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 2150 4900 50  0001 C CNN
	2    2150 4900
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL004D D2
U 3 1 5F34693D
P 2150 5150
F 0 "D2" H 2400 5200 50  0000 C CNN
F 1 "DL004D" H 2450 5100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2150 5150 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 2150 5150 50  0001 C CNN
	3    2150 5150
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL004D D2
U 1 1 5F3481DA
P 2150 4300
F 0 "D2" H 2400 4400 50  0000 C CNN
F 1 "DL004D" H 2450 4250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2150 4300 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 2150 4300 50  0001 C CNN
	1    2150 4300
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL004D D2
U 7 1 5F3493F7
P 900 5850
F 0 "D2" V 1000 6000 50  0000 L CNN
F 1 "DL004D" V 1000 5600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 900 5850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 900 5850 50  0001 C CNN
	7    900  5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 5F34B643
P 900 6100
F 0 "#PWR031" H 900 5850 50  0001 C CNN
F 1 "GND" H 905 5927 50  0000 C CNN
F 2 "" H 900 6100 50  0001 C CNN
F 3 "" H 900 6100 50  0001 C CNN
	1    900  6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  6100 900  6050
$Comp
L power:+5V #PWR024
U 1 1 5F34E585
P 900 5600
F 0 "#PWR024" H 900 5450 50  0001 C CNN
F 1 "+5V" H 915 5773 50  0000 C CNN
F 2 "" H 900 5600 50  0001 C CNN
F 3 "" H 900 5600 50  0001 C CNN
	1    900  5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  5600 900  5650
$Comp
L RFT_Digitalschaltkreise:DL008D D3
U 2 1 5F35AA16
P 2150 4600
F 0 "D3" H 2400 4650 50  0000 C CNN
F 1 "DL008D" H 2450 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2150 4600 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl008.gif" H 2150 4600 50  0001 C CNN
	2    2150 4600
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL008D D3
U 5 1 5F35B62F
P 1150 5850
F 0 "D3" V 1250 6000 50  0000 L CNN
F 1 "DL008D" V 1250 5600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 1150 5850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl008.gif" H 1150 5850 50  0001 C CNN
	5    1150 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5F35C08B
P 1150 6100
F 0 "#PWR032" H 1150 5850 50  0001 C CNN
F 1 "GND" H 1155 5927 50  0000 C CNN
F 2 "" H 1150 6100 50  0001 C CNN
F 3 "" H 1150 6100 50  0001 C CNN
	1    1150 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR025
U 1 1 5F35EDC8
P 1150 5600
F 0 "#PWR025" H 1150 5450 50  0001 C CNN
F 1 "+5V" H 1165 5773 50  0000 C CNN
F 2 "" H 1150 5600 50  0001 C CNN
F 3 "" H 1150 5600 50  0001 C CNN
	1    1150 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 5600 1150 5650
Wire Wire Line
	1150 6050 1150 6100
Text GLabel 2300 1600 2    39   Input ~ 0
~RD
Wire Wire Line
	2300 1600 2250 1600
Text GLabel 1800 4600 0    39   Input ~ 0
~RD
Wire Wire Line
	1950 4500 1900 4500
Wire Wire Line
	1900 4500 1900 4600
Wire Wire Line
	1900 4600 1800 4600
Wire Wire Line
	1950 4700 1900 4700
Wire Wire Line
	1900 4700 1900 4600
Connection ~ 1900 4600
Wire Wire Line
	2350 4600 2550 4600
$Comp
L RFT_Digitalschaltkreise:DL004D D2
U 5 1 5F38D406
P 2150 4050
F 0 "D2" H 2150 4317 50  0000 C CNN
F 1 "DL004D" H 2150 4226 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2150 4050 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 2150 4050 50  0001 C CNN
	5    2150 4050
	1    0    0    -1  
$EndComp
Text GLabel 900  2900 0    50   Input ~ 0
TAKT
Wire Wire Line
	900  2900 950  2900
Text GLabel 1900 4050 0    50   Input ~ 0
TAKT
Wire Wire Line
	1950 4050 1900 4050
$Comp
L RFT_Digitalschaltkreise:DL000D D15
U 4 1 5F395F98
P 2650 4050
F 0 "D15" H 2650 4367 50  0000 C CNN
F 1 "DL000D" H 2650 4276 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2650 4050 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 2650 4050 50  0001 C CNN
	4    2650 4050
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL000D D15
U 5 1 5F396D57
P 2400 6850
F 0 "D15" V 2500 7000 50  0000 L CNN
F 1 "DL000D" V 2500 6600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2400 6850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 2400 6850 50  0001 C CNN
	5    2400 6850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR044
U 1 1 5F398390
P 2400 6600
F 0 "#PWR044" H 2400 6450 50  0001 C CNN
F 1 "+5V" H 2415 6773 50  0000 C CNN
F 2 "" H 2400 6600 50  0001 C CNN
F 3 "" H 2400 6600 50  0001 C CNN
	1    2400 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR052
U 1 1 5F39856E
P 2400 7100
F 0 "#PWR052" H 2400 6850 50  0001 C CNN
F 1 "GND" H 2405 6927 50  0000 C CNN
F 2 "" H 2400 7100 50  0001 C CNN
F 3 "" H 2400 7100 50  0001 C CNN
	1    2400 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7100 2400 7050
Wire Wire Line
	2400 6650 2400 6600
Wire Wire Line
	2450 4150 2400 4150
Wire Wire Line
	2400 4150 2400 4050
Wire Wire Line
	2400 3950 2450 3950
Wire Wire Line
	2350 4050 2400 4050
Connection ~ 2400 4050
Wire Wire Line
	2400 4050 2400 3950
Wire Wire Line
	3950 900  4050 900 
Wire Wire Line
	4050 1000 3950 1000
Wire Wire Line
	3950 1100 4050 1100
Wire Wire Line
	4050 1200 3950 1200
Wire Wire Line
	3950 1300 4050 1300
Wire Wire Line
	4050 1400 3950 1400
Wire Wire Line
	3950 1500 4050 1500
Wire Wire Line
	4050 1600 3950 1600
Text Label 4050 900  0    50   ~ 0
.14
Text Label 4050 1000 0    50   ~ 0
.13
Text Label 4050 1100 0    50   ~ 0
.16
Text Label 4050 1200 0    50   ~ 0
.15
Text Label 4050 1300 0    50   ~ 0
.10
Text Label 4050 1400 0    50   ~ 0
.09
Text Label 4050 1500 0    50   ~ 0
.12
Text Label 4050 1600 0    50   ~ 0
.11
Wire Wire Line
	3950 2400 4050 2400
Wire Wire Line
	3950 2600 4050 2600
Wire Wire Line
	3950 2700 4050 2700
Wire Wire Line
	3950 2800 4050 2800
Wire Wire Line
	3950 2900 4050 2900
Text Label 4050 2400 0    50   ~ 0
.21
Text Label 4050 2600 0    50   ~ 0
.17
Text Label 4050 2700 0    50   ~ 0
.18
Text Label 4050 2800 0    50   ~ 0
.19
Text Label 4050 2900 0    50   ~ 0
.20
Wire Wire Line
	3250 1800 3200 1800
Wire Wire Line
	3200 1800 3200 2100
Wire Wire Line
	3200 3100 3250 3100
Connection ~ 3200 2100
Wire Wire Line
	3200 2100 3200 3100
Wire Wire Line
	2800 2100 3200 2100
Text Label 2800 2100 0    50   ~ 0
.33
NoConn ~ 3250 2200
NoConn ~ 3250 2300
NoConn ~ 3250 2500
NoConn ~ 3950 2500
NoConn ~ 3950 2300
NoConn ~ 3950 2200
$Comp
L RFT_Digitalschaltkreise:DL030D D13
U 1 1 5F482431
P 5700 1850
F 0 "D13" H 5700 2417 50  0000 C CNN
F 1 "DL030D" H 5700 2326 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5700 1850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl021.gif" H 5700 1850 50  0001 C CNN
	1    5700 1850
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL030D D13
U 2 1 5F4829FD
P 1900 6850
F 0 "D13" V 2000 7000 50  0000 L CNN
F 1 "DL030D" V 2000 6600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 1900 6850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl021.gif" H 1900 6850 50  0001 C CNN
	2    1900 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR050
U 1 1 5F48366E
P 1900 7100
F 0 "#PWR050" H 1900 6850 50  0001 C CNN
F 1 "GND" H 1905 6927 50  0000 C CNN
F 2 "" H 1900 7100 50  0001 C CNN
F 3 "" H 1900 7100 50  0001 C CNN
	1    1900 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR042
U 1 1 5F483800
P 1900 6600
F 0 "#PWR042" H 1900 6450 50  0001 C CNN
F 1 "+5V" H 1915 6773 50  0000 C CNN
F 2 "" H 1900 6600 50  0001 C CNN
F 3 "" H 1900 6600 50  0001 C CNN
	1    1900 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6600 1900 6650
Wire Wire Line
	1900 7050 1900 7100
$Comp
L RFT_Digitalschaltkreise:DL002D D12
U 5 1 5F4B5CE5
P 1650 6850
F 0 "D12" V 1750 7000 50  0000 L CNN
F 1 "DL002D" V 1750 6600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 1650 6850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 1650 6850 50  0001 C CNN
	5    1650 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR049
U 1 1 5F4B7BB8
P 1650 7100
F 0 "#PWR049" H 1650 6850 50  0001 C CNN
F 1 "GND" H 1655 6927 50  0000 C CNN
F 2 "" H 1650 7100 50  0001 C CNN
F 3 "" H 1650 7100 50  0001 C CNN
	1    1650 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR041
U 1 1 5F4B7D28
P 1650 6600
F 0 "#PWR041" H 1650 6450 50  0001 C CNN
F 1 "+5V" H 1665 6773 50  0000 C CNN
F 2 "" H 1650 6600 50  0001 C CNN
F 3 "" H 1650 6600 50  0001 C CNN
	1    1650 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6600 1650 6650
Wire Wire Line
	1650 7050 1650 7100
$Comp
L RFT_Digitalschaltkreise:DL002D D12
U 1 1 5F4C1C50
P 4750 1600
F 0 "D12" H 5000 1700 50  0000 C CNN
F 1 "DL002D" H 5050 1550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4750 1600 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 4750 1600 50  0001 C CNN
	1    4750 1600
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL002D D12
U 4 1 5F4C2681
P 4750 1300
F 0 "D12" H 5000 1400 50  0000 C CNN
F 1 "DL002D" H 5050 1250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4750 1300 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 4750 1300 50  0001 C CNN
	4    4750 1300
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL002D D12
U 3 1 5F4C2B0B
P 4750 1900
F 0 "D12" H 5000 2000 50  0000 C CNN
F 1 "DL002D" H 5050 1850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4750 1900 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 4750 1900 50  0001 C CNN
	3    4750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 900  4550 900 
Wire Wire Line
	4400 1100 4550 1100
Wire Wire Line
	4400 1200 4550 1200
Wire Wire Line
	4400 1400 4550 1400
Wire Wire Line
	4400 1500 4550 1500
Wire Wire Line
	4400 1700 4550 1700
Wire Wire Line
	4400 1800 4550 1800
Wire Wire Line
	4400 2000 4550 2000
$Comp
L RFT_Digitalschaltkreise:DL002D D12
U 2 1 5F4F4A7C
P 4750 1000
F 0 "D12" H 5000 1100 50  0000 C CNN
F 1 "DL002D" H 5050 950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4750 1000 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 4750 1000 50  0001 C CNN
	2    4750 1000
	1    0    0    -1  
$EndComp
Text Label 4400 900  0    50   ~ 0
.09
Text Label 4400 1100 0    50   ~ 0
.10
Text Label 4400 1400 0    50   ~ 0
.11
Text Label 4400 1200 0    50   ~ 0
.12
Text Label 4400 1500 0    50   ~ 0
.14
Text Label 4400 1700 0    50   ~ 0
.13
Text Label 4400 1800 0    50   ~ 0
.15
Text Label 4400 2000 0    50   ~ 0
.17
Wire Wire Line
	4950 1000 5450 1000
Wire Wire Line
	5450 1800 5500 1800
Wire Wire Line
	5450 1000 5450 1800
Wire Wire Line
	4950 1300 5350 1300
Wire Wire Line
	5500 1700 5250 1700
Wire Wire Line
	5250 1700 5250 2500
Wire Wire Line
	5250 2500 4400 2500
Text Label 4400 2500 0    50   ~ 0
.16
Wire Wire Line
	5500 1500 5250 1500
Wire Wire Line
	5250 1500 5250 1600
Wire Wire Line
	5250 1600 4950 1600
Wire Wire Line
	4950 1900 5450 1900
Wire Wire Line
	5450 1900 5450 2000
Wire Wire Line
	5450 1900 5500 1900
Wire Wire Line
	5500 2000 5450 2000
Wire Wire Line
	5500 2100 5350 2100
Wire Wire Line
	5350 2100 5350 2650
Wire Wire Line
	5350 2650 4400 2650
Wire Wire Line
	2350 4900 2550 4900
Text Label 2550 4900 0    50   ~ 0
.25
Text Label 4400 2650 0    50   ~ 0
.25
$Comp
L RFT_Digitalschaltkreise:DL002D D11
U 5 1 5F562AD0
P 1400 6850
F 0 "D11" V 1500 7000 50  0000 L CNN
F 1 "DL002D" V 1500 6600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 1400 6850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 1400 6850 50  0001 C CNN
	5    1400 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR048
U 1 1 5F562AD6
P 1400 7100
F 0 "#PWR048" H 1400 6850 50  0001 C CNN
F 1 "GND" H 1405 6927 50  0000 C CNN
F 2 "" H 1400 7100 50  0001 C CNN
F 3 "" H 1400 7100 50  0001 C CNN
	1    1400 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR040
U 1 1 5F562ADC
P 1400 6600
F 0 "#PWR040" H 1400 6450 50  0001 C CNN
F 1 "+5V" H 1415 6773 50  0000 C CNN
F 2 "" H 1400 6600 50  0001 C CNN
F 3 "" H 1400 6600 50  0001 C CNN
	1    1400 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 6600 1400 6650
Wire Wire Line
	1400 7050 1400 7100
$Comp
L RFT_Digitalschaltkreise:DL002D D11
U 4 1 5F56B7F1
P 4750 2200
F 0 "D11" H 5000 2300 50  0000 C CNN
F 1 "DL002D" H 5050 2150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4750 2200 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 4750 2200 50  0001 C CNN
	4    4750 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2100 4400 2100
Text Label 4400 2100 0    50   ~ 0
.18
Text GLabel 900  3400 0    39   Input ~ 0
~MAD
Wire Wire Line
	900  3400 950  3400
Text GLabel 4400 2300 0    39   Input ~ 0
~MAD
Wire Wire Line
	4400 2300 4550 2300
Wire Wire Line
	1450 4100 1300 4100
Wire Wire Line
	1450 4250 1300 4250
Wire Wire Line
	1450 4400 1300 4400
Wire Wire Line
	1450 4550 1300 4550
Wire Wire Line
	1450 4700 1300 4700
Wire Wire Line
	1450 4850 1300 4850
Wire Wire Line
	1450 5000 1300 5000
Wire Wire Line
	1450 5150 1300 5150
Text Label 1450 4100 0    50   ~ 0
.01
Text Label 1450 4250 0    50   ~ 0
.02
Text Label 1450 4400 0    50   ~ 0
.03
Text Label 1450 4550 0    50   ~ 0
.04
Text Label 1450 4700 0    50   ~ 0
.05
Text Label 1450 4850 0    50   ~ 0
.06
Text Label 1450 5000 0    50   ~ 0
.07
Text Label 1450 5150 0    50   ~ 0
.08
Wire Wire Line
	2350 4300 2550 4300
Text Label 2550 4300 0    50   ~ 0
.23
Text Label 2550 4600 0    50   ~ 0
.24
Wire Wire Line
	2850 4050 2900 4050
Text Label 2900 4050 0    50   ~ 0
.27
Text GLabel 2300 3200 2    50   Input ~ 0
MEI
Wire Wire Line
	2300 3200 2250 3200
Text GLabel 900  3200 0    50   Input ~ 0
MEO
Wire Wire Line
	900  3200 950  3200
Text GLabel 5650 7400 0    50   Input ~ 0
MEI
Text Label 5750 7400 0    50   ~ 0
.26
$Comp
L RFT_Digitalschaltkreise:DL002D D11
U 3 1 5F64094E
P 6200 1000
F 0 "D11" H 6450 1100 50  0000 C CNN
F 1 "DL002D" H 6500 950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6200 1000 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 6200 1000 50  0001 C CNN
	3    6200 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 900  5950 900 
Wire Wire Line
	5950 900  5950 1850
Wire Wire Line
	5950 1850 5900 1850
Wire Wire Line
	6000 1100 5800 1100
Text Label 5800 1100 0    50   ~ 0
.24
$Comp
L RFT_Digitalschaltkreise:DL004D D2
U 4 1 5F654CC7
P 6200 1850
F 0 "D2" H 6200 2117 50  0000 C CNN
F 1 "DL004D" H 6200 2026 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6200 1850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 6200 1850 50  0001 C CNN
	4    6200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1850 5950 1850
Connection ~ 5950 1850
$Comp
L RFT_Digitalschaltkreise:DL000D D15
U 1 1 5F661393
P 6650 1950
F 0 "D15" H 6650 2267 50  0000 C CNN
F 1 "DL000D" H 6650 2176 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6650 1950 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 6650 1950 50  0001 C CNN
	1    6650 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1850 6400 1850
Wire Wire Line
	6450 2050 6250 2050
Text Label 6250 2050 0    50   ~ 0
.23
$Comp
L RFT_Digitalschaltkreise:DL374D D6
U 1 1 5F68084C
P 3700 4400
F 0 "D6" H 3700 5067 50  0000 C CNN
F 1 "DL374D" H 3700 4976 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 3750 4300 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/g.cgi?174" H 3750 4300 50  0001 C CNN
	1    3700 4400
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL374D D6
U 2 1 5F6813BE
P 1900 5850
F 0 "D6" V 2000 6100 50  0000 C CNN
F 1 "DL374D" V 2000 5750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 1950 5750 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/g.cgi?174" H 1950 5750 50  0001 C CNN
	2    1900 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5F69CAF5
P 1900 6100
F 0 "#PWR035" H 1900 5850 50  0001 C CNN
F 1 "GND" H 1905 5927 50  0000 C CNN
F 2 "" H 1900 6100 50  0001 C CNN
F 3 "" H 1900 6100 50  0001 C CNN
	1    1900 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR028
U 1 1 5F69CDF8
P 1900 5600
F 0 "#PWR028" H 1900 5450 50  0001 C CNN
F 1 "+5V" H 1915 5773 50  0000 C CNN
F 2 "" H 1900 5600 50  0001 C CNN
F 3 "" H 1900 5600 50  0001 C CNN
	1    1900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5600 1900 5650
Wire Wire Line
	1900 6050 1900 6100
Wire Wire Line
	3350 4750 3200 4750
Wire Wire Line
	3200 4750 3200 4900
$Comp
L power:GND #PWR016
U 1 1 5F6CE3F5
P 3200 4900
F 0 "#PWR016" H 3200 4650 50  0001 C CNN
F 1 "GND" H 3205 4727 50  0000 C CNN
F 2 "" H 3200 4900 50  0001 C CNN
F 3 "" H 3200 4900 50  0001 C CNN
	1    3200 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3950 3200 3950
Wire Wire Line
	3200 4050 3350 4050
Wire Wire Line
	3350 4150 3200 4150
Wire Wire Line
	3200 4250 3350 4250
Wire Wire Line
	3350 4350 3200 4350
Wire Wire Line
	3200 4450 3350 4450
Wire Wire Line
	3350 4550 3200 4550
Wire Wire Line
	3200 4650 3350 4650
Text Label 3200 3950 0    50   ~ 0
.04
Text Label 3200 4050 0    50   ~ 0
.07
Text Label 3200 4150 0    50   ~ 0
.06
Text Label 3200 4250 0    50   ~ 0
.03
Text Label 3200 4350 0    50   ~ 0
.02
Text Label 3200 4450 0    50   ~ 0
.01
Text Label 3200 4550 0    50   ~ 0
.08
Text Label 3200 4650 0    50   ~ 0
.05
Wire Wire Line
	3350 4850 3100 4850
Wire Wire Line
	3100 4850 3100 3450
Wire Wire Line
	3100 3450 6900 3450
Wire Wire Line
	6900 1950 6850 1950
$Comp
L RFT_Digitalschaltkreise:DL003D D8
U 1 1 5F761A5D
P 7600 1000
F 0 "D8" H 7850 1100 50  0000 C CNN
F 1 "DL003D" H 7900 950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7600 1000 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 7600 1000 50  0001 C CNN
	1    7600 1000
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL003D D8
U 3 1 5F771A0B
P 7600 1300
F 0 "D8" H 7850 1400 50  0000 C CNN
F 1 "DL003D" H 7900 1250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7600 1300 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 7600 1300 50  0001 C CNN
	3    7600 1300
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL003D D8
U 2 1 5F772526
P 7600 1600
F 0 "D8" H 7850 1700 50  0000 C CNN
F 1 "DL003D" H 7900 1550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7600 1600 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 7600 1600 50  0001 C CNN
	2    7600 1600
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL003D D8
U 4 1 5F772DD7
P 7600 1900
F 0 "D8" H 7850 2000 50  0000 C CNN
F 1 "DL003D" H 7900 1850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7600 1900 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 7600 1900 50  0001 C CNN
	4    7600 1900
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL003D D8
U 5 1 5F773FB0
P 650 6850
F 0 "D8" V 750 7000 50  0000 L CNN
F 1 "DL003D" V 750 6600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 650 6850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 650 6850 50  0001 C CNN
	5    650  6850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR037
U 1 1 5F7916BF
P 650 6600
F 0 "#PWR037" H 650 6450 50  0001 C CNN
F 1 "+5V" H 665 6773 50  0000 C CNN
F 2 "" H 650 6600 50  0001 C CNN
F 3 "" H 650 6600 50  0001 C CNN
	1    650  6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR045
U 1 1 5F791A68
P 650 7100
F 0 "#PWR045" H 650 6850 50  0001 C CNN
F 1 "GND" H 655 6927 50  0000 C CNN
F 2 "" H 650 7100 50  0001 C CNN
F 3 "" H 650 7100 50  0001 C CNN
	1    650  7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  7100 650  7050
Wire Wire Line
	650  6600 650  6650
Wire Wire Line
	7400 2000 7300 2000
Wire Wire Line
	7300 2000 7300 1800
Wire Wire Line
	7400 900  7300 900 
Wire Wire Line
	7300 900  7300 1000
Wire Wire Line
	7400 1100 7300 1100
Connection ~ 7300 1100
Wire Wire Line
	7400 1200 7300 1200
Connection ~ 7300 1200
Wire Wire Line
	7400 1400 7300 1400
Connection ~ 7300 1400
Wire Wire Line
	7300 1400 7300 1200
Wire Wire Line
	7400 1500 7300 1500
Connection ~ 7300 1500
Wire Wire Line
	7300 1500 7300 1400
Wire Wire Line
	7400 1700 7300 1700
Connection ~ 7300 1700
Wire Wire Line
	7300 1700 7300 1500
Wire Wire Line
	7400 1800 7300 1800
Connection ~ 7300 1800
Wire Wire Line
	7300 1800 7300 1700
Text Notes 6500 750  0    50   ~ 0
read 80h
Text Notes 6500 1500 0    50   ~ 0
write 80h
Text Label 8400 1900 0    50   ~ 0
.01
Wire Wire Line
	7800 1600 8400 1600
Wire Wire Line
	8400 1300 7800 1300
Wire Wire Line
	8400 1000 7800 1000
Text Label 8400 1000 0    50   ~ 0
.08
Text Label 8400 1300 0    50   ~ 0
.04
Text Label 8400 1600 0    50   ~ 0
.03
$Comp
L RFT_Digitalschaltkreise:DL003D D10
U 1 1 5F88756C
P 7600 2350
F 0 "D10" H 7850 2450 50  0000 C CNN
F 1 "DL003D" H 7900 2300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7600 2350 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 7600 2350 50  0001 C CNN
	1    7600 2350
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL003D D10
U 4 1 5F8890BA
P 7600 2650
F 0 "D10" H 7850 2750 50  0000 C CNN
F 1 "DL003D" H 7900 2600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7600 2650 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 7600 2650 50  0001 C CNN
	4    7600 2650
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL003D D10
U 3 1 5F88A249
P 7600 2950
F 0 "D10" H 7850 3050 50  0000 C CNN
F 1 "DL003D" H 7900 2900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7600 2950 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 7600 2950 50  0001 C CNN
	3    7600 2950
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL003D D10
U 2 1 5F88A9F1
P 7600 3250
F 0 "D10" H 7850 3350 50  0000 C CNN
F 1 "DL003D" H 7900 3200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7600 3250 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 7600 3250 50  0001 C CNN
	2    7600 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2450 7300 2450
Connection ~ 7300 2000
Wire Wire Line
	7400 2250 7300 2250
Connection ~ 7300 2250
Wire Wire Line
	7300 2250 7300 2150
Wire Wire Line
	7300 2550 7300 2700
Wire Wire Line
	7300 3350 7400 3350
Wire Wire Line
	7300 2550 7400 2550
Wire Wire Line
	7400 3150 7300 3150
Connection ~ 7300 3150
Wire Wire Line
	7300 3150 7300 3350
Wire Wire Line
	7400 3050 7300 3050
Connection ~ 7300 3050
Wire Wire Line
	7300 3050 7300 3150
Wire Wire Line
	7400 2850 7300 2850
Connection ~ 7300 2850
$Comp
L power:GND #PWR010
U 1 1 5F913D0A
P 7100 3300
F 0 "#PWR010" H 7100 3050 50  0001 C CNN
F 1 "GND" H 7105 3127 50  0000 C CNN
F 2 "" H 7100 3300 50  0001 C CNN
F 3 "" H 7100 3300 50  0001 C CNN
	1    7100 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2650 7800 2650
Wire Wire Line
	7400 2750 7300 2750
Connection ~ 7300 2750
Wire Wire Line
	7300 2750 7300 2850
Wire Wire Line
	8400 2950 7800 2950
Wire Wire Line
	8400 3250 7800 3250
Text Label 8400 2350 0    50   ~ 0
.02
Text Label 8400 2650 0    50   ~ 0
.07
Text Label 8400 2950 0    50   ~ 0
.06
Text Label 8400 3250 0    50   ~ 0
.05
$Comp
L RFT_Digitalschaltkreise:DL003D D10
U 5 1 5F9B1240
P 1150 6850
F 0 "D10" V 1250 7000 50  0000 L CNN
F 1 "DL003D" V 1250 6600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 1150 6850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 1150 6850 50  0001 C CNN
	5    1150 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR047
U 1 1 5F9C5A68
P 1150 7100
F 0 "#PWR047" H 1150 6850 50  0001 C CNN
F 1 "GND" H 1155 6927 50  0000 C CNN
F 2 "" H 1150 7100 50  0001 C CNN
F 3 "" H 1150 7100 50  0001 C CNN
	1    1150 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR039
U 1 1 5F9C5E7A
P 1150 6600
F 0 "#PWR039" H 1150 6450 50  0001 C CNN
F 1 "+5V" H 1165 6773 50  0000 C CNN
F 2 "" H 1150 6600 50  0001 C CNN
F 3 "" H 1150 6600 50  0001 C CNN
	1    1150 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 6600 1150 6650
Wire Wire Line
	1150 7050 1150 7100
$Comp
L RFT_Digitalschaltkreise:DL086D D7
U 4 1 5FA0EA2A
P 5500 4550
F 0 "D7" H 5500 4867 50  0000 C CNN
F 1 "DL086D" H 5500 4776 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5500 4550 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl074.gif" H 5500 4550 50  0001 C CNN
	4    5500 4550
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL086D D7
U 5 1 5FA0F23D
P 2150 5850
F 0 "D7" V 2250 6000 50  0000 L CNN
F 1 "DL086D" V 2250 5600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2150 5850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl074.gif" H 2150 5850 50  0001 C CNN
	5    2150 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR029
U 1 1 5FA0FD1A
P 2150 5600
F 0 "#PWR029" H 2150 5450 50  0001 C CNN
F 1 "+5V" H 2165 5773 50  0000 C CNN
F 2 "" H 2150 5600 50  0001 C CNN
F 3 "" H 2150 5600 50  0001 C CNN
	1    2150 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5FA0FECE
P 2150 6100
F 0 "#PWR036" H 2150 5850 50  0001 C CNN
F 1 "GND" H 2155 5927 50  0000 C CNN
F 2 "" H 2150 6100 50  0001 C CNN
F 3 "" H 2150 6100 50  0001 C CNN
	1    2150 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6100 2150 6050
Wire Wire Line
	2150 5650 2150 5600
$Comp
L power:+5V #PWR015
U 1 1 5FA4534E
P 5150 4600
F 0 "#PWR015" H 5150 4450 50  0001 C CNN
F 1 "+5V" H 5050 4700 50  0000 C CNN
F 2 "" H 5150 4600 50  0001 C CNN
F 3 "" H 5150 4600 50  0001 C CNN
	1    5150 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4600 5150 4650
Wire Wire Line
	5150 4650 5300 4650
Wire Wire Line
	5300 4450 4700 4450
Wire Wire Line
	4700 4450 4050 4450
NoConn ~ 4050 4350
$Comp
L power:+5V #PWR017
U 1 1 5FABD336
P 5150 5000
F 0 "#PWR017" H 5150 4850 50  0001 C CNN
F 1 "+5V" H 5165 5173 50  0000 C CNN
F 2 "" H 5150 5000 50  0001 C CNN
F 3 "" H 5150 5000 50  0001 C CNN
	1    5150 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5000 5150 5100
Connection ~ 5150 5100
Wire Wire Line
	5150 5100 5150 5300
Wire Wire Line
	4850 5500 4850 4250
Wire Wire Line
	4850 4250 4050 4250
Wire Wire Line
	4500 5700 4500 3950
Wire Wire Line
	4500 3950 4050 3950
Text Label 6000 5500 0    50   ~ 0
.34
Text Label 6000 5700 0    50   ~ 0
.35
Wire Wire Line
	4050 4650 4400 4650
Wire Wire Line
	4400 4650 4400 5850
Wire Wire Line
	4400 5850 6000 5850
Text Label 6000 5850 0    50   ~ 0
.36
Wire Wire Line
	4050 4150 4300 4150
Wire Wire Line
	4300 4150 4300 6000
Text Label 6000 6000 0    50   ~ 0
.37
$Comp
L RFT_Digitalschaltkreise:DL086D D7
U 1 1 5FBE01C9
P 3300 6100
F 0 "D7" H 3550 6200 50  0000 C CNN
F 1 "DL086D" H 3600 6050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3300 6100 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl074.gif" H 3300 6100 50  0001 C CNN
	1    3300 6100
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL086D D7
U 2 1 5FBE1460
P 3300 6400
F 0 "D7" H 3550 6500 50  0000 C CNN
F 1 "DL086D" H 3600 6350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3300 6400 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl074.gif" H 3300 6400 50  0001 C CNN
	2    3300 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4050 4200 4050
Wire Wire Line
	4200 4050 4200 5450
Wire Wire Line
	4200 5450 3050 5450
Wire Wire Line
	3050 5450 3050 6000
Wire Wire Line
	3050 6000 3100 6000
Text GLabel 2900 6200 0    50   Input ~ 0
AB14
Wire Wire Line
	2900 6200 3100 6200
Wire Wire Line
	4050 4550 4100 4550
Wire Wire Line
	4100 4550 4100 5350
Wire Wire Line
	4100 5350 2950 5350
Wire Wire Line
	2950 5350 2950 6300
Wire Wire Line
	2950 6300 3100 6300
Text GLabel 2900 6500 0    50   Input ~ 0
AB15
Wire Wire Line
	2900 6500 3100 6500
$Comp
L RFT_Digitalschaltkreise:DL002D D11
U 1 1 5FCB24B3
P 4000 6200
F 0 "D11" H 4250 6300 50  0000 C CNN
F 1 "DL002D" H 4300 6150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4000 6200 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 4000 6200 50  0001 C CNN
	1    4000 6200
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL020D D1
U 2 1 5FCE6D15
P 5000 6600
F 0 "D1" H 5000 6967 50  0000 C CNN
F 1 "DL020D" H 5000 6876 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5000 6600 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl014.gif" H 5000 6600 50  0001 C CNN
	2    5000 6600
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL020D D1
U 3 1 5FCE7926
P 650 5850
F 0 "D1" V 750 6000 50  0000 L CNN
F 1 "DL020D" V 750 5600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 650 5850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl014.gif" H 650 5850 50  0001 C CNN
	3    650  5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5FCE8712
P 650 6100
F 0 "#PWR030" H 650 5850 50  0001 C CNN
F 1 "GND" H 655 5927 50  0000 C CNN
F 2 "" H 650 6100 50  0001 C CNN
F 3 "" H 650 6100 50  0001 C CNN
	1    650  6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  6100 650  6050
$Comp
L power:+5V #PWR023
U 1 1 5FD01F3F
P 650 5600
F 0 "#PWR023" H 650 5450 50  0001 C CNN
F 1 "+5V" H 665 5773 50  0000 C CNN
F 2 "" H 650 5600 50  0001 C CNN
F 3 "" H 650 5600 50  0001 C CNN
	1    650  5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  5600 650  5650
$Comp
L power:GND #PWR046
U 1 1 5FD3537C
P 900 7100
F 0 "#PWR046" H 900 6850 50  0001 C CNN
F 1 "GND" H 905 6927 50  0000 C CNN
F 2 "" H 900 7100 50  0001 C CNN
F 3 "" H 900 7100 50  0001 C CNN
	1    900  7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR038
U 1 1 5FD354E0
P 900 6600
F 0 "#PWR038" H 900 6450 50  0001 C CNN
F 1 "+5V" H 915 6773 50  0000 C CNN
F 2 "" H 900 6600 50  0001 C CNN
F 3 "" H 900 6600 50  0001 C CNN
	1    900  6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR043
U 1 1 5FD4E964
P 2150 6600
F 0 "#PWR043" H 2150 6450 50  0001 C CNN
F 1 "+5V" H 2165 6773 50  0000 C CNN
F 2 "" H 2150 6600 50  0001 C CNN
F 3 "" H 2150 6600 50  0001 C CNN
	1    2150 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR051
U 1 1 5FD4EB42
P 2150 7100
F 0 "#PWR051" H 2150 6850 50  0001 C CNN
F 1 "GND" H 2155 6927 50  0000 C CNN
F 2 "" H 2150 7100 50  0001 C CNN
F 3 "" H 2150 7100 50  0001 C CNN
	1    2150 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 6450 4600 6450
$Comp
L RFT_Digitalschaltkreise:DL002D D11
U 2 1 5FDB6FCD
P 3300 6750
F 0 "D11" H 3550 6850 50  0000 C CNN
F 1 "DL002D" H 3600 6700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3300 6750 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 3300 6750 50  0001 C CNN
	2    3300 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6650 2900 6650
Text Label 2900 6650 0    50   ~ 0
.24
Text GLabel 2900 6850 0    50   Input ~ 0
AB13
Wire Wire Line
	2900 6850 3100 6850
Connection ~ 4700 4450
$Comp
L RFT_Digitalschaltkreise:DL008D D3
U 4 1 5FF1E4E5
P 6200 7300
F 0 "D3" H 6200 7617 50  0000 C CNN
F 1 "DL008D" H 6200 7526 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6200 7300 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl008.gif" H 6200 7300 50  0001 C CNN
	4    6200 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6600 5300 6600
Wire Wire Line
	5300 6600 5300 6900
Wire Wire Line
	5300 7200 6000 7200
$Comp
L RFT_Digitalschaltkreise:DL004D D2
U 6 1 5FFB1EB0
P 5650 6600
F 0 "D2" H 5650 6867 50  0000 C CNN
F 1 "DL004D" H 5650 6776 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5650 6600 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl003.gif" H 5650 6600 50  0001 C CNN
	6    5650 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 6600 5300 6600
Connection ~ 5300 6600
$Comp
L RFT_Digitalschaltkreise:DL008D D3
U 1 1 5FFD1661
P 6200 6700
F 0 "D3" H 6200 7017 50  0000 C CNN
F 1 "DL008D" H 6200 6926 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6200 6700 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl008.gif" H 6200 6700 50  0001 C CNN
	1    6200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 6600 5850 6600
Wire Wire Line
	5950 6800 6000 6800
$Comp
L RFT_Digitalschaltkreise:DL020D D1
U 1 1 6002CF10
P 6050 2750
F 0 "D1" H 6300 2850 50  0000 C CNN
F 1 "DL020D" H 6350 2700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6050 2750 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl014.gif" H 6050 2750 50  0001 C CNN
	1    6050 2750
	1    0    0    -1  
$EndComp
Text Label 5600 2750 0    50   ~ 0
.23
Wire Wire Line
	5600 2750 5800 2750
Wire Wire Line
	5800 2750 5800 2700
Wire Wire Line
	5800 2600 5850 2600
Wire Wire Line
	5850 2700 5800 2700
Connection ~ 5800 2700
Wire Wire Line
	5800 2700 5800 2600
Wire Wire Line
	5850 2800 5800 2800
Wire Wire Line
	5800 2800 5800 2750
Connection ~ 5800 2750
Wire Wire Line
	5850 2900 5800 2900
Wire Wire Line
	5800 2900 5800 2800
Connection ~ 5800 2800
Text Notes 5750 3300 0    50   ~ 0
Dieses Signal wird \nauf der Platine bis \ndicht an Pin 27 von \nD16-D19 herangeführt.
Wire Wire Line
	6250 2750 6500 2750
Text Label 6500 2750 0    50   ~ 0
~write
$Comp
L RFT_Digitalschaltkreise:DL155D D9
U 1 1 600EDFD5
P 7100 4300
F 0 "D9" H 7100 4967 50  0000 C CNN
F 1 "DL155D" H 7100 4876 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" H 7150 4200 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl155.gif" H 7150 4200 50  0001 C CNN
	1    7100 4300
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL155D D9
U 2 1 600EE6DB
P 900 6850
F 0 "D9" V 1000 7000 50  0000 L CNN
F 1 "DL155D" V 1000 6600 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" H 950 6750 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl155.gif" H 950 6750 50  0001 C CNN
	2    900  6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  7100 900  7050
Wire Wire Line
	900  6650 900  6600
$Comp
L power:GND #PWR014
U 1 1 60130EBA
P 6600 4050
F 0 "#PWR014" H 6600 3800 50  0001 C CNN
F 1 "GND" H 6605 3877 50  0000 C CNN
F 2 "" H 6600 4050 50  0001 C CNN
F 3 "" H 6600 4050 50  0001 C CNN
	1    6600 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4050 6600 3950
Wire Wire Line
	6600 3950 6750 3950
NoConn ~ 6750 4250
NoConn ~ 6750 4350
Wire Wire Line
	6750 4650 6550 4650
Wire Wire Line
	6550 4750 6750 4750
Text Label 6550 4650 0    50   ~ 0
.36
Text Label 6550 4750 0    50   ~ 0
.37
$Comp
L RFT_Digitalschaltkreise:DL074D D14
U 1 1 601D3C0B
P 7000 5400
F 0 "D14" H 7000 5767 50  0000 C CNN
F 1 "DL074D" H 7000 5676 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7000 5400 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl074.gif" H 7000 5400 50  0001 C CNN
	1    7000 5400
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL074D D14
U 2 1 601D4BD2
P 7000 6150
F 0 "D14" H 7000 6517 50  0000 C CNN
F 1 "DL074D" H 7000 6426 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7000 6150 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl074.gif" H 7000 6150 50  0001 C CNN
	2    7000 6150
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL074D D14
U 3 1 601D54B2
P 2150 6850
F 0 "D14" V 2250 7000 50  0000 L CNN
F 1 "DL074D" V 2250 6600 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2150 6850 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl074.gif" H 2150 6850 50  0001 C CNN
	3    2150 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6650 2150 6600
Wire Wire Line
	2150 7100 2150 7050
$Comp
L power:+5V #PWR020
U 1 1 60218A5B
P 6550 5200
F 0 "#PWR020" H 6550 5050 50  0001 C CNN
F 1 "+5V" H 6565 5373 50  0000 C CNN
F 2 "" H 6550 5200 50  0001 C CNN
F 3 "" H 6550 5200 50  0001 C CNN
	1    6550 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 6300 6550 6300
Wire Wire Line
	6550 6300 6550 6000
Wire Wire Line
	6750 6000 6550 6000
Connection ~ 6550 6000
Wire Wire Line
	6550 6000 6550 5550
Wire Wire Line
	6750 5550 6550 5550
Connection ~ 6550 5550
Wire Wire Line
	6550 5550 6550 5250
Wire Wire Line
	6750 5250 6550 5250
Connection ~ 6550 5250
Wire Wire Line
	6550 5250 6550 5200
Wire Wire Line
	6750 6100 6450 6100
Wire Wire Line
	6450 6100 6450 5350
Wire Wire Line
	6450 5350 6750 5350
Wire Wire Line
	6450 5350 6250 5350
Connection ~ 6450 5350
Text Label 6250 5350 0    50   ~ 0
.27
Wire Wire Line
	6400 6700 6450 6700
Wire Wire Line
	6450 6700 6450 6200
Wire Wire Line
	6450 6200 6750 6200
Wire Wire Line
	7250 6250 7350 6250
Text Label 7350 6250 0    50   ~ 0
.32
Wire Wire Line
	7250 6050 7400 6050
Wire Wire Line
	7400 6050 7400 5700
Wire Wire Line
	7400 5700 6650 5700
Wire Wire Line
	6650 5700 6650 5450
Wire Wire Line
	6650 5450 6750 5450
NoConn ~ 7250 5300
$Comp
L RFT_Digitalschaltkreise:DL000D D15
U 3 1 603BBE48
P 7650 5350
F 0 "D15" H 7650 5667 50  0000 C CNN
F 1 "DL000D" H 7650 5576 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7650 5350 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 7650 5350 50  0001 C CNN
	3    7650 5350
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DL000D D15
U 2 1 603BDB24
P 8250 5350
F 0 "D15" H 8250 5667 50  0000 C CNN
F 1 "DL000D" H 8250 5576 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8250 5350 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl000.gif" H 8250 5350 50  0001 C CNN
	2    8250 5350
	1    0    0    -1  
$EndComp
Connection ~ 7400 5700
Wire Wire Line
	8050 5250 8000 5250
Wire Wire Line
	8450 5350 8500 5350
Wire Wire Line
	6450 3850 6750 3850
Wire Wire Line
	7450 3850 7550 3850
Wire Wire Line
	7450 3950 7550 3950
Wire Wire Line
	7450 4050 7550 4050
Wire Wire Line
	7450 4150 7550 4150
Text Label 7550 3850 0    50   ~ 0
.28
Text Label 7550 3950 0    50   ~ 0
.29
Text Label 7550 4050 0    50   ~ 0
.30
Text Label 7550 4150 0    50   ~ 0
.31
$Comp
L RFT_Digitalschaltkreise:DL086D D7
U 3 1 6054CA5E
P 8050 4650
F 0 "D7" H 8050 4967 50  0000 C CNN
F 1 "DL086D" H 8050 4876 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8050 4650 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/dl074.gif" H 8050 4650 50  0001 C CNN
	3    8050 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4750 7700 4750
Text Label 7700 4750 0    50   ~ 0
.25
Wire Wire Line
	8250 4650 8350 4650
Text Label 8350 4650 0    50   ~ 0
.33
Wire Wire Line
	2300 900  2300 1000
Connection ~ 2300 900 
Wire Wire Line
	2300 900  2250 900 
Wire Wire Line
	900  900  900  1000
Connection ~ 900  900 
Wire Wire Line
	900  900  950  900 
Wire Wire Line
	750  900  750  950 
Wire Wire Line
	2450 900  2450 950 
$Comp
L RFT_Digitalschaltkreise:Brücke RB08
U 1 1 60BA123B
P 7100 2450
F 0 "RB08" V 7100 2450 50  0000 C CNN
F 1 "Brücke" H 7100 2370 50  0001 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 7100 2450 50  0001 C CNN
F 3 "~" H 7100 2450 50  0001 C CNN
	1    7100 2450
	0    -1   -1   0   
$EndComp
$Comp
L RFT_Digitalschaltkreise:Brücke RB01
U 1 1 60C1FC81
P 7100 3050
F 0 "RB01" V 7100 3050 50  0000 C CNN
F 1 "Brücke" H 7100 2970 50  0001 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 7100 3050 50  0001 C CNN
F 3 "~" H 7100 3050 50  0001 C CNN
	1    7100 3050
	0    -1   -1   0   
$EndComp
$Comp
L RFT_Digitalschaltkreise:Brücke RB02
U 1 1 60C74ADA
P 5500 5100
F 0 "RB02" H 5500 5175 50  0000 C CNN
F 1 "Brücke" H 5500 5020 50  0001 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 5500 5100 50  0001 C CNN
F 3 "~" H 5500 5100 50  0001 C CNN
	1    5500 5100
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:Brücke RB03
U 1 1 60C74DA8
P 5500 5300
F 0 "RB03" H 5500 5375 50  0000 C CNN
F 1 "Brücke" H 5500 5220 50  0001 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 5500 5300 50  0001 C CNN
F 3 "~" H 5500 5300 50  0001 C CNN
	1    5500 5300
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:Brücke RB04
U 1 1 60C75078
P 5500 5500
F 0 "RB04" H 5500 5575 50  0000 C CNN
F 1 "Brücke" H 5500 5420 50  0001 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 5500 5500 50  0001 C CNN
F 3 "~" H 5500 5500 50  0001 C CNN
	1    5500 5500
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:Brücke RB05
U 1 1 60C75494
P 5500 5700
F 0 "RB05" H 5500 5775 50  0000 C CNN
F 1 "Brücke" H 5500 5620 50  0001 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 5500 5700 50  0001 C CNN
F 3 "~" H 5500 5700 50  0001 C CNN
	1    5500 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5700 5300 5700
Wire Wire Line
	4850 5500 5300 5500
Wire Wire Line
	5150 5300 5300 5300
Wire Wire Line
	5150 5100 5300 5100
Wire Wire Line
	5700 5100 5900 5100
Wire Wire Line
	5700 5300 5800 5300
$Comp
L RFT_Digitalschaltkreise:Brücke RB06
U 1 1 61006AE3
P 8150 1900
F 0 "RB06" H 8150 1975 50  0000 C CNN
F 1 "Brücke" H 8150 1820 50  0001 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 8150 1900 50  0001 C CNN
F 3 "~" H 8150 1900 50  0001 C CNN
	1    8150 1900
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:Brücke RB07
U 1 1 61007057
P 8150 2350
F 0 "RB07" H 8150 2425 50  0000 C CNN
F 1 "Brücke" H 8150 2270 50  0001 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 8150 2350 50  0001 C CNN
F 3 "~" H 8150 2350 50  0001 C CNN
	1    8150 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1900 7950 1900
Wire Wire Line
	8350 1900 8400 1900
Wire Wire Line
	8350 2350 8400 2350
Wire Wire Line
	7800 2350 7950 2350
Wire Wire Line
	7300 2850 7300 3050
Wire Wire Line
	7100 3250 7100 3300
Wire Wire Line
	7100 2700 7300 2700
Wire Wire Line
	7100 2700 7100 2850
Connection ~ 7300 2700
Wire Wire Line
	7300 2700 7300 2750
Wire Wire Line
	7100 2650 7100 2700
Connection ~ 7100 2700
Wire Wire Line
	7100 2250 7100 2150
Wire Wire Line
	7100 2150 7300 2150
Connection ~ 7300 2150
Wire Wire Line
	7300 2150 7300 2000
Wire Wire Line
	7300 2250 7300 2450
Wire Wire Line
	5800 4550 5800 4500
Wire Wire Line
	5700 4550 5800 4550
Wire Wire Line
	5800 3850 5800 3800
Wire Wire Line
	5800 4150 5800 4200
$Comp
L Device:R R9
U 1 1 5F98A9A8
P 5800 4000
F 0 "R9" H 5650 3950 50  0000 C CNN
F 1 "240" H 5650 4050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5730 4000 50  0001 C CNN
F 3 "~" H 5800 4000 50  0001 C CNN
	1    5800 4000
	-1   0    0    1   
$EndComp
$Comp
L RFT_Optoelektronik:VQA23 B01
U 1 1 5F98C7FC
P 5800 4350
F 0 "B01" H 5950 4400 50  0000 L CNN
F 1 "VQA23" H 5950 4300 50  0000 L CNN
F 2 "LED_THT:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 5800 4350 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/vqa13.gif" H 5800 4350 50  0001 C CNN
	1    5800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5F99F9CB
P 5800 3800
F 0 "#PWR013" H 5800 3650 50  0001 C CNN
F 1 "+5V" H 5700 3900 50  0000 C CNN
F 2 "" H 5800 3800 50  0001 C CNN
F 3 "" H 5800 3800 50  0001 C CNN
	1    5800 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3850 6450 4950
Wire Wire Line
	6450 4950 7600 4950
Text GLabel 5650 7600 0    50   Input ~ 0
MEO
Wire Wire Line
	5650 7600 6450 7600
Wire Wire Line
	6450 7600 6450 7300
Wire Wire Line
	6450 7300 6400 7300
$Comp
L M037-rescue:U27256-RFT_Digitalschaltkreise D16
U 1 1 619F44BA
P 9300 1850
F 0 "D16" H 9300 2900 50  0000 C CNN
F 1 "U27256" H 9300 800 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 9300 3000 50  0001 C CNN
F 3 "" H 9300 3000 50  0001 C CNN
	1    9300 1850
	1    0    0    -1  
$EndComp
$Comp
L M037-rescue:U27256-RFT_Digitalschaltkreise D18
U 1 1 619F8077
P 9300 4300
F 0 "D18" H 9300 5350 50  0000 C CNN
F 1 "U27256" H 9300 3250 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 9300 5450 50  0001 C CNN
F 3 "" H 9300 5450 50  0001 C CNN
	1    9300 4300
	1    0    0    -1  
$EndComp
$Comp
L M037-rescue:U27256-RFT_Digitalschaltkreise D17
U 1 1 61A25AEF
P 10600 1850
F 0 "D17" H 10600 2900 50  0000 C CNN
F 1 "U27256" H 10600 800 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 10600 3000 50  0001 C CNN
F 3 "" H 10600 3000 50  0001 C CNN
	1    10600 1850
	1    0    0    -1  
$EndComp
$Comp
L M037-rescue:U27256-RFT_Digitalschaltkreise D19
U 1 1 61A25AF5
P 10600 4300
F 0 "D19" H 10600 5350 50  0000 C CNN
F 1 "U27256" H 10600 3250 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 10600 5450 50  0001 C CNN
F 3 "" H 10600 5450 50  0001 C CNN
	1    10600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 900  8800 900 
Wire Wire Line
	8950 1000 8800 1000
Wire Wire Line
	8950 1100 8800 1100
Wire Wire Line
	8950 1300 8800 1300
Wire Wire Line
	8950 1200 8800 1200
Wire Wire Line
	8950 1400 8800 1400
Wire Wire Line
	8950 1500 8800 1500
Wire Wire Line
	8950 1600 8800 1600
Wire Wire Line
	8950 1800 8800 1800
Wire Wire Line
	8950 1700 8800 1700
Wire Wire Line
	8950 1900 8800 1900
Wire Wire Line
	8950 2000 8800 2000
Wire Wire Line
	8950 2100 8800 2100
Wire Wire Line
	8950 2300 8800 2300
Wire Wire Line
	8950 2200 8800 2200
Text Label 8800 900  0    50   ~ 0
.09
Text Label 8800 1000 0    50   ~ 0
.10
Text Label 8800 1100 0    50   ~ 0
.11
Text Label 8800 1200 0    50   ~ 0
.12
Text Label 8800 1300 0    50   ~ 0
.13
Text Label 8800 1400 0    50   ~ 0
.14
Text Label 8800 1500 0    50   ~ 0
.15
Text Label 8800 1600 0    50   ~ 0
.16
Text Label 8800 1700 0    50   ~ 0
.17
Text Label 8800 1800 0    50   ~ 0
.18
Text Label 8800 1900 0    50   ~ 0
.19
Text Label 8800 2000 0    50   ~ 0
.20
Text Label 8800 2100 0    50   ~ 0
.21
Text Label 8800 2200 0    50   ~ 0
.34
Text Label 8800 2300 0    50   ~ 0
.35
Wire Wire Line
	4300 6000 6000 6000
Wire Wire Line
	6550 6900 5300 6900
Connection ~ 5300 6900
Wire Wire Line
	5300 6900 5300 7200
Wire Wire Line
	6550 6900 6550 6450
Wire Wire Line
	6550 6450 7650 6450
Wire Wire Line
	8000 5250 8000 5650
Wire Wire Line
	9650 1500 9700 1500
Wire Wire Line
	9700 1600 9650 1600
Wire Wire Line
	9700 1700 9650 1700
Wire Wire Line
	9700 1800 9650 1800
Wire Wire Line
	9700 1900 9650 1900
Wire Wire Line
	9700 2000 9650 2000
Wire Wire Line
	9700 2100 9650 2100
Wire Wire Line
	9700 2200 9650 2200
Text Label 9700 1500 0    50   ~ 0
.01
Text Label 9700 1600 0    50   ~ 0
.02
Text Label 9700 1700 0    50   ~ 0
.03
Text Label 9700 1800 0    50   ~ 0
.04
Text Label 9700 1900 0    50   ~ 0
.05
Text Label 9700 2000 0    50   ~ 0
.06
Text Label 9700 2100 0    50   ~ 0
.07
Text Label 9700 2200 0    50   ~ 0
.08
Wire Wire Line
	8950 3350 8800 3350
Wire Wire Line
	8950 3450 8800 3450
Wire Wire Line
	8950 3550 8800 3550
Wire Wire Line
	8950 3750 8800 3750
Wire Wire Line
	8950 3650 8800 3650
Wire Wire Line
	8950 3850 8800 3850
Wire Wire Line
	8950 3950 8800 3950
Wire Wire Line
	8950 4050 8800 4050
Wire Wire Line
	8950 4250 8800 4250
Wire Wire Line
	8950 4150 8800 4150
Wire Wire Line
	8950 4350 8800 4350
Wire Wire Line
	8950 4450 8800 4450
Wire Wire Line
	8950 4550 8800 4550
Wire Wire Line
	8950 4750 8800 4750
Wire Wire Line
	8950 4650 8800 4650
Text Label 8800 3350 0    50   ~ 0
.09
Text Label 8800 3450 0    50   ~ 0
.10
Text Label 8800 3550 0    50   ~ 0
.11
Text Label 8800 3650 0    50   ~ 0
.12
Text Label 8800 3750 0    50   ~ 0
.13
Text Label 8800 3850 0    50   ~ 0
.14
Text Label 8800 3950 0    50   ~ 0
.15
Text Label 8800 4050 0    50   ~ 0
.16
Text Label 8800 4150 0    50   ~ 0
.17
Text Label 8800 4250 0    50   ~ 0
.18
Text Label 8800 4350 0    50   ~ 0
.19
Text Label 8800 4450 0    50   ~ 0
.20
Text Label 8800 4550 0    50   ~ 0
.21
Text Label 8800 4650 0    50   ~ 0
.34
Text Label 8800 4750 0    50   ~ 0
.35
Wire Wire Line
	10250 3350 10100 3350
Wire Wire Line
	10250 3450 10100 3450
Wire Wire Line
	10250 3550 10100 3550
Wire Wire Line
	10250 3750 10100 3750
Wire Wire Line
	10250 3650 10100 3650
Wire Wire Line
	10250 3850 10100 3850
Wire Wire Line
	10250 3950 10100 3950
Wire Wire Line
	10250 4050 10100 4050
Wire Wire Line
	10250 4250 10100 4250
Wire Wire Line
	10250 4150 10100 4150
Wire Wire Line
	10250 4350 10100 4350
Wire Wire Line
	10250 4450 10100 4450
Wire Wire Line
	10250 4550 10100 4550
Wire Wire Line
	10250 4750 10100 4750
Wire Wire Line
	10250 4650 10100 4650
Text Label 10100 3350 0    50   ~ 0
.09
Text Label 10100 3450 0    50   ~ 0
.10
Text Label 10100 3550 0    50   ~ 0
.11
Text Label 10100 3650 0    50   ~ 0
.12
Text Label 10100 3750 0    50   ~ 0
.13
Text Label 10100 3850 0    50   ~ 0
.14
Text Label 10100 3950 0    50   ~ 0
.15
Text Label 10100 4050 0    50   ~ 0
.16
Text Label 10100 4150 0    50   ~ 0
.17
Text Label 10100 4250 0    50   ~ 0
.18
Text Label 10100 4350 0    50   ~ 0
.19
Text Label 10100 4450 0    50   ~ 0
.20
Text Label 10100 4550 0    50   ~ 0
.21
Text Label 10100 4650 0    50   ~ 0
.34
Text Label 10100 4750 0    50   ~ 0
.35
Wire Wire Line
	10250 900  10100 900 
Wire Wire Line
	10250 1000 10100 1000
Wire Wire Line
	10250 1100 10100 1100
Wire Wire Line
	10250 1300 10100 1300
Wire Wire Line
	10250 1200 10100 1200
Wire Wire Line
	10250 1400 10100 1400
Wire Wire Line
	10250 1500 10100 1500
Wire Wire Line
	10250 1600 10100 1600
Wire Wire Line
	10250 1800 10100 1800
Wire Wire Line
	10250 1700 10100 1700
Wire Wire Line
	10250 1900 10100 1900
Wire Wire Line
	10250 2000 10100 2000
Wire Wire Line
	10250 2100 10100 2100
Wire Wire Line
	10250 2300 10100 2300
Wire Wire Line
	10250 2200 10100 2200
Text Label 10100 900  0    50   ~ 0
.09
Text Label 10100 1000 0    50   ~ 0
.10
Text Label 10100 1100 0    50   ~ 0
.11
Text Label 10100 1200 0    50   ~ 0
.12
Text Label 10100 1300 0    50   ~ 0
.13
Text Label 10100 1400 0    50   ~ 0
.14
Text Label 10100 1500 0    50   ~ 0
.15
Text Label 10100 1600 0    50   ~ 0
.16
Text Label 10100 1700 0    50   ~ 0
.17
Text Label 10100 1800 0    50   ~ 0
.18
Text Label 10100 1900 0    50   ~ 0
.19
Text Label 10100 2000 0    50   ~ 0
.20
Text Label 10100 2100 0    50   ~ 0
.21
Text Label 10100 2200 0    50   ~ 0
.34
Text Label 10100 2300 0    50   ~ 0
.35
Wire Wire Line
	10950 1500 11000 1500
Wire Wire Line
	11000 1600 10950 1600
Wire Wire Line
	11000 1700 10950 1700
Wire Wire Line
	11000 1800 10950 1800
Wire Wire Line
	11000 1900 10950 1900
Wire Wire Line
	11000 2000 10950 2000
Wire Wire Line
	11000 2100 10950 2100
Wire Wire Line
	11000 2200 10950 2200
Text Label 11000 1500 0    50   ~ 0
.01
Text Label 11000 1600 0    50   ~ 0
.02
Text Label 11000 1700 0    50   ~ 0
.03
Text Label 11000 1800 0    50   ~ 0
.04
Text Label 11000 1900 0    50   ~ 0
.05
Text Label 11000 2000 0    50   ~ 0
.06
Text Label 11000 2100 0    50   ~ 0
.07
Text Label 11000 2200 0    50   ~ 0
.08
Wire Wire Line
	10950 3950 11000 3950
Wire Wire Line
	11000 4050 10950 4050
Wire Wire Line
	11000 4150 10950 4150
Wire Wire Line
	11000 4250 10950 4250
Wire Wire Line
	11000 4350 10950 4350
Wire Wire Line
	11000 4450 10950 4450
Wire Wire Line
	11000 4550 10950 4550
Wire Wire Line
	11000 4650 10950 4650
Text Label 11000 3950 0    50   ~ 0
.01
Text Label 11000 4050 0    50   ~ 0
.02
Text Label 11000 4150 0    50   ~ 0
.03
Text Label 11000 4250 0    50   ~ 0
.04
Text Label 11000 4350 0    50   ~ 0
.05
Text Label 11000 4450 0    50   ~ 0
.06
Text Label 11000 4550 0    50   ~ 0
.07
Text Label 11000 4650 0    50   ~ 0
.08
Wire Wire Line
	9650 3950 9700 3950
Wire Wire Line
	9700 4050 9650 4050
Wire Wire Line
	9700 4150 9650 4150
Wire Wire Line
	9700 4250 9650 4250
Wire Wire Line
	9700 4350 9650 4350
Wire Wire Line
	9700 4450 9650 4450
Wire Wire Line
	9700 4550 9650 4550
Wire Wire Line
	9700 4650 9650 4650
Text Label 9700 3950 0    50   ~ 0
.01
Text Label 9700 4050 0    50   ~ 0
.02
Text Label 9700 4150 0    50   ~ 0
.03
Text Label 9700 4250 0    50   ~ 0
.04
Text Label 9700 4350 0    50   ~ 0
.05
Text Label 9700 4450 0    50   ~ 0
.06
Text Label 9700 4550 0    50   ~ 0
.07
Text Label 9700 4650 0    50   ~ 0
.08
Text Label 8800 2500 0    50   ~ 0
.32
Wire Wire Line
	8800 2500 8950 2500
$Comp
L power:+5V #PWR04
U 1 1 62433F9C
P 8700 2600
F 0 "#PWR04" H 8700 2450 50  0001 C CNN
F 1 "+5V" H 8715 2773 50  0000 C CNN
F 2 "" H 8700 2600 50  0001 C CNN
F 3 "" H 8700 2600 50  0001 C CNN
	1    8700 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6243472A
P 8700 2800
F 0 "#PWR06" H 8700 2550 50  0001 C CNN
F 1 "GND" H 8705 2627 50  0000 C CNN
F 2 "" H 8700 2800 50  0001 C CNN
F 3 "" H 8700 2800 50  0001 C CNN
	1    8700 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2800 8950 2800
Wire Wire Line
	8950 2700 8850 2700
Wire Wire Line
	8700 2700 8700 2600
Wire Wire Line
	8950 2600 8850 2600
Wire Wire Line
	8850 2600 8850 2700
Connection ~ 8850 2700
Wire Wire Line
	8850 2700 8700 2700
Text Label 10100 2500 0    50   ~ 0
.32
Wire Wire Line
	10100 2500 10250 2500
$Comp
L power:+5V #PWR05
U 1 1 624F6C26
P 10000 2600
F 0 "#PWR05" H 10000 2450 50  0001 C CNN
F 1 "+5V" H 10015 2773 50  0000 C CNN
F 2 "" H 10000 2600 50  0001 C CNN
F 3 "" H 10000 2600 50  0001 C CNN
	1    10000 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 624F6C2C
P 10000 2800
F 0 "#PWR07" H 10000 2550 50  0001 C CNN
F 1 "GND" H 10005 2627 50  0000 C CNN
F 2 "" H 10000 2800 50  0001 C CNN
F 3 "" H 10000 2800 50  0001 C CNN
	1    10000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2800 10250 2800
Wire Wire Line
	10250 2700 10150 2700
Wire Wire Line
	10000 2700 10000 2600
Wire Wire Line
	10250 2600 10150 2600
Wire Wire Line
	10150 2600 10150 2700
Connection ~ 10150 2700
Wire Wire Line
	10150 2700 10000 2700
Text Label 8800 4950 0    50   ~ 0
.32
Wire Wire Line
	8800 4950 8950 4950
$Comp
L power:+5V #PWR018
U 1 1 62538BF4
P 8700 5050
F 0 "#PWR018" H 8700 4900 50  0001 C CNN
F 1 "+5V" H 8715 5223 50  0000 C CNN
F 2 "" H 8700 5050 50  0001 C CNN
F 3 "" H 8700 5050 50  0001 C CNN
	1    8700 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 62538BFA
P 8700 5250
F 0 "#PWR021" H 8700 5000 50  0001 C CNN
F 1 "GND" H 8705 5077 50  0000 C CNN
F 2 "" H 8700 5250 50  0001 C CNN
F 3 "" H 8700 5250 50  0001 C CNN
	1    8700 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5250 8950 5250
Wire Wire Line
	8950 5150 8850 5150
Wire Wire Line
	8700 5150 8700 5050
Wire Wire Line
	8950 5050 8850 5050
Wire Wire Line
	8850 5050 8850 5150
Connection ~ 8850 5150
Wire Wire Line
	8850 5150 8700 5150
Text Label 10100 4950 0    50   ~ 0
.32
Wire Wire Line
	10100 4950 10250 4950
$Comp
L power:+5V #PWR019
U 1 1 6257C938
P 10000 5050
F 0 "#PWR019" H 10000 4900 50  0001 C CNN
F 1 "+5V" H 10015 5223 50  0000 C CNN
F 2 "" H 10000 5050 50  0001 C CNN
F 3 "" H 10000 5050 50  0001 C CNN
	1    10000 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 6257C93E
P 10000 5250
F 0 "#PWR022" H 10000 5000 50  0001 C CNN
F 1 "GND" H 10005 5077 50  0000 C CNN
F 2 "" H 10000 5250 50  0001 C CNN
F 3 "" H 10000 5250 50  0001 C CNN
	1    10000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5250 10250 5250
Wire Wire Line
	10250 5150 10150 5150
Wire Wire Line
	10000 5150 10000 5050
Wire Wire Line
	10250 5050 10150 5050
Wire Wire Line
	10150 5050 10150 5150
Connection ~ 10150 5150
Wire Wire Line
	10150 5150 10000 5150
Wire Wire Line
	8800 2400 8950 2400
Text Label 8800 2400 0    50   ~ 0
.28
Wire Wire Line
	10100 2400 10250 2400
Text Label 10100 2400 0    50   ~ 0
.29
Wire Wire Line
	8800 4850 8950 4850
Text Label 8800 4850 0    50   ~ 0
.30
Wire Wire Line
	10100 4850 10250 4850
Text Label 10100 4850 0    50   ~ 0
.31
Text Notes 7750 3850 0    50   ~ 0
chip\nenable
Wire Wire Line
	8500 4950 8500 5350
Text Notes 8250 4500 0    50   ~ 0
address\nenable
Text Notes 7350 6700 0    118  ~ 0
SEGMENTED ROM
Text Notes 7350 6850 0    79   ~ 0
Stromlaufplan
Text Notes 7350 7100 0    118  ~ 0
4484.897-00037
Wire Wire Line
	7600 4550 7600 4950
Connection ~ 7600 4950
Wire Wire Line
	7600 4950 8500 4950
Wire Wire Line
	7600 4550 7850 4550
NoConn ~ 7450 4250
NoConn ~ 7450 4350
NoConn ~ 7450 4450
NoConn ~ 7450 4550
$Comp
L Device:CP_Small C1
U 1 1 63A7DC0F
P 600 7500
F 0 "C1" H 688 7546 50  0000 L CNN
F 1 "470/6,3" H 688 7455 50  0000 L CNN
F 2 "RFT_sonstiges:CP_Axial_L21.0mm_D10.0mm_P25.0mm...35.0mm_Horizontal" H 600 7500 50  0001 C CNN
F 3 "~" H 600 7500 50  0001 C CNN
	1    600  7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 63A7FB64
P 1100 7500
F 0 "C2" H 1192 7546 50  0000 L CNN
F 1 "100n" H 1192 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 1100 7500 50  0001 C CNN
F 3 "~" H 1100 7500 50  0001 C CNN
	1    1100 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 63A8031B
P 1450 7500
F 0 "C3" H 1542 7546 50  0000 L CNN
F 1 "100n" H 1542 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 1450 7500 50  0001 C CNN
F 3 "~" H 1450 7500 50  0001 C CNN
	1    1450 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 63A811E4
P 1800 7500
F 0 "C4" H 1892 7546 50  0000 L CNN
F 1 "100n" H 1892 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 1800 7500 50  0001 C CNN
F 3 "~" H 1800 7500 50  0001 C CNN
	1    1800 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 63A811EA
P 2150 7500
F 0 "C5" H 2242 7546 50  0000 L CNN
F 1 "100n" H 2242 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 2150 7500 50  0001 C CNN
F 3 "~" H 2150 7500 50  0001 C CNN
	1    2150 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 63AC8DE1
P 2600 7500
F 0 "C6" H 2692 7546 50  0000 L CNN
F 1 "33n" H 2692 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 2600 7500 50  0001 C CNN
F 3 "~" H 2600 7500 50  0001 C CNN
	1    2600 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 63AC8DE7
P 2950 7500
F 0 "C7" H 3042 7546 50  0000 L CNN
F 1 "33n" H 3042 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 2950 7500 50  0001 C CNN
F 3 "~" H 2950 7500 50  0001 C CNN
	1    2950 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 63AC8DED
P 3300 7500
F 0 "C8" H 3392 7546 50  0000 L CNN
F 1 "33n" H 3392 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 3300 7500 50  0001 C CNN
F 3 "~" H 3300 7500 50  0001 C CNN
	1    3300 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 63AC8DF3
P 3650 7500
F 0 "C9" H 3742 7546 50  0000 L CNN
F 1 "33n" H 3742 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 3650 7500 50  0001 C CNN
F 3 "~" H 3650 7500 50  0001 C CNN
	1    3650 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 63B1045B
P 4000 7500
F 0 "C10" H 4092 7546 50  0000 L CNN
F 1 "33n" H 4092 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 4000 7500 50  0001 C CNN
F 3 "~" H 4000 7500 50  0001 C CNN
	1    4000 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 63B10461
P 4350 7500
F 0 "C11" H 4442 7546 50  0000 L CNN
F 1 "33n" H 4442 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 4350 7500 50  0001 C CNN
F 3 "~" H 4350 7500 50  0001 C CNN
	1    4350 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 63B10467
P 4700 7500
F 0 "C12" H 4792 7546 50  0000 L CNN
F 1 "33n" H 4792 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 4700 7500 50  0001 C CNN
F 3 "~" H 4700 7500 50  0001 C CNN
	1    4700 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 63B1046D
P 5050 7500
F 0 "C13" H 5142 7546 50  0000 L CNN
F 1 "33n" H 5142 7455 50  0000 L CNN
F 2 "RFT_sonstiges:C_Disc_D8.0mm_W2.0mm_P5.00mm_P7.50mm" H 5050 7500 50  0001 C CNN
F 3 "~" H 5050 7500 50  0001 C CNN
	1    5050 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	600  7600 1100 7600
Connection ~ 1100 7600
Wire Wire Line
	1100 7600 1450 7600
Connection ~ 1450 7600
Wire Wire Line
	1450 7600 1800 7600
Connection ~ 1800 7600
Wire Wire Line
	1800 7600 2150 7600
Connection ~ 2150 7600
Wire Wire Line
	2150 7600 2600 7600
Connection ~ 2600 7600
Connection ~ 2950 7600
Wire Wire Line
	2950 7600 3300 7600
Connection ~ 3300 7600
Wire Wire Line
	3300 7600 3650 7600
Connection ~ 3650 7600
Wire Wire Line
	3650 7600 4000 7600
Connection ~ 4000 7600
Wire Wire Line
	4000 7600 4350 7600
Connection ~ 4350 7600
Wire Wire Line
	4350 7600 4700 7600
Connection ~ 4700 7600
Wire Wire Line
	4700 7600 5050 7600
Wire Wire Line
	600  7400 1100 7400
Connection ~ 1100 7400
Wire Wire Line
	1100 7400 1450 7400
Connection ~ 1450 7400
Wire Wire Line
	1450 7400 1800 7400
Connection ~ 1800 7400
Wire Wire Line
	1800 7400 2150 7400
Connection ~ 2150 7400
Wire Wire Line
	2150 7400 2600 7400
Connection ~ 2600 7400
Connection ~ 2950 7400
Wire Wire Line
	2950 7400 3300 7400
Connection ~ 3300 7400
Wire Wire Line
	3300 7400 3650 7400
Connection ~ 3650 7400
Wire Wire Line
	3650 7400 4000 7400
Connection ~ 4000 7400
Wire Wire Line
	4000 7400 4350 7400
Connection ~ 4350 7400
Wire Wire Line
	4350 7400 4700 7400
Connection ~ 4700 7400
Wire Wire Line
	4700 7400 5050 7400
$Comp
L power:+5V #PWR053
U 1 1 63D20298
P 2750 7350
F 0 "#PWR053" H 2750 7200 50  0001 C CNN
F 1 "+5V" H 2765 7523 50  0000 C CNN
F 2 "" H 2750 7350 50  0001 C CNN
F 3 "" H 2750 7350 50  0001 C CNN
	1    2750 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR054
U 1 1 63D2081D
P 2750 7650
F 0 "#PWR054" H 2750 7400 50  0001 C CNN
F 1 "GND" H 2900 7600 50  0000 C CNN
F 2 "" H 2750 7650 50  0001 C CNN
F 3 "" H 2750 7650 50  0001 C CNN
	1    2750 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 7600 2750 7600
Wire Wire Line
	2750 7600 2750 7650
Connection ~ 2750 7600
Wire Wire Line
	2750 7600 2950 7600
Wire Wire Line
	2750 7350 2750 7400
Wire Wire Line
	2750 7400 2950 7400
Wire Wire Line
	2600 7400 2750 7400
Connection ~ 2750 7400
Wire Wire Line
	2350 5150 4600 5150
Wire Wire Line
	4800 6650 4700 6650
Wire Wire Line
	5650 7400 5950 7400
Wire Wire Line
	5950 6800 5950 7400
Connection ~ 5950 7400
Wire Wire Line
	5950 7400 6000 7400
Wire Wire Line
	6400 1000 7300 1000
Connection ~ 7300 1000
Wire Wire Line
	7300 1000 7300 1100
Wire Wire Line
	7300 1100 7300 1200
Text Notes 8000 750  0    50   ~ 0
Strukturbyte
Wire Wire Line
	5500 1600 5350 1600
Wire Wire Line
	5350 1600 5350 1300
Connection ~ 5450 1900
Wire Wire Line
	4950 2200 5500 2200
Wire Wire Line
	4200 6200 4500 6200
Wire Wire Line
	4500 6200 4500 6750
Wire Wire Line
	4500 6750 4800 6750
Wire Wire Line
	4700 4450 4700 6650
Wire Wire Line
	4600 5150 4600 6450
Wire Wire Line
	3500 6750 4350 6750
Wire Wire Line
	4350 6750 4350 6550
Wire Wire Line
	4350 6550 4800 6550
Wire Wire Line
	6900 1950 6900 3450
NoConn ~ 6500 2750
Text Notes 4000 3800 0    50   ~ 0
Steuerwort:\nM045 AASSxxxM\nM046 AASSxSxM\nM047 AASSSSxM
Text Notes 4550 4450 0    50   ~ 0
01h
Text Notes 4050 4350 0    50   ~ 0
02h
Text Notes 4900 5500 0    50   ~ 0
04h
Text Notes 4900 5700 0    50   ~ 0
08h
Text Notes 4900 5850 0    50   ~ 0
10h
Text Notes 4900 6000 0    50   ~ 0
20h
Text Notes 3900 5450 0    50   ~ 0
40h
Text Notes 3900 5350 0    50   ~ 0
80h
Text Notes 4750 3875 0    50   ~ 0
AA  Adressbereich\n00  0000h - 1FFFh \n01  4000h - 5FFFh\n10  8000h - 9FFFh\n11  C000h - DFFFh
Wire Wire Line
	5700 5500 5800 5500
Wire Wire Line
	5800 5300 5800 5500
Connection ~ 5800 5500
Wire Wire Line
	5800 5500 6000 5500
Wire Wire Line
	5900 5700 6000 5700
Connection ~ 5900 5700
Wire Wire Line
	5900 5100 5900 5700
Wire Wire Line
	5700 5700 5900 5700
Text Notes 8400 1800 0    50   ~ 0
01h
Text Notes 8400 1500 0    50   ~ 0
04h
Text Notes 8400 1200 0    50   ~ 0
08h
Text Notes 8400 900  0    50   ~ 0
80h
Text Notes 8400 2250 0    50   ~ 0
02h
Text Notes 8400 2550 0    50   ~ 0
40h
Text Notes 8400 2850 0    50   ~ 0
20h
Text Notes 8400 3150 0    50   ~ 0
10h
Text Notes 9700 7100 0    79   ~ 0
1988, © MPM\n2017, Thomas Schramm\n2020, Bert Lange
Wire Wire Line
	3500 6100 3800 6100
Wire Wire Line
	3500 6400 3750 6400
Wire Wire Line
	3750 6400 3750 6300
Wire Wire Line
	3750 6300 3800 6300
Text Notes 7400 7500 0    79   ~ 0
M037
Text Notes 8150 7650 0    79   ~ 0
6.10.2020
Text Notes 10600 7650 0    79   ~ 0
2
$Comp
L KC85_Modulsteckverbinder:KC85_Modulsteckverbinder_M037 XM
U 1 1 6C96DE75
P 1600 2250
F 0 "XM" H 1350 3800 60  0000 C CNN
F 1 "KC85_Modulsteckverbinder_M037" H 1600 3931 60  0000 C CNN
F 2 "" H 1600 2700 60  0000 C CNN
F 3 "" H 1600 2700 60  0000 C CNN
	1    1600 2250
	1    0    0    -1  
$EndComp
Text Notes 8500 5950 0    50   ~ 0
RB
Text Notes 8425 6200 2    50   ~ 0
 4x8k
Text Notes 8425 6300 2    50   ~ 0
 8x8k
Text Notes 8425 6400 2    50   ~ 0
16x8k
Wire Notes Line style solid
	8450 5850 8450 6400
Text Notes 8650 5950 0    50   ~ 0
01
Text Notes 10000 5950 0    50   ~ 0
02
Text Notes 10150 5950 0    50   ~ 0
03
Text Notes 10300 5950 0    50   ~ 0
04
Text Notes 10450 5950 0    50   ~ 0
05
Text Notes 8800 5950 0    50   ~ 0
06
Text Notes 8950 5950 0    50   ~ 0
07
Text Notes 9100 5950 0    50   ~ 0
08
Text Notes 9350 6200 0    50   ~ 0
70h
Text Notes 9350 6300 0    50   ~ 0
71h
Text Notes 9350 6400 0    50   ~ 0
72h
Text Notes 8675 6200 0    50   ~ 0
x
Text Notes 8675 6300 0    50   ~ 0
x
Text Notes 8675 6400 0    50   ~ 0
x
Text Notes 10025 6200 0    50   ~ 0
x
Text Notes 10025 6300 0    50   ~ 0
x
Text Notes 10175 6200 0    50   ~ 0
x
Text Notes 10325 6300 0    50   ~ 0
x
Text Notes 10325 6400 0    50   ~ 0
x
Text Notes 10475 6400 0    50   ~ 0
x
Text Notes 8825 6400 0    50   ~ 0
x
Text Notes 8825 6200 0    50   ~ 0
x
Text Notes 8975 6200 0    50   ~ 0
x
Text Notes 8975 6300 0    50   ~ 0
x
Text Notes 9300 5950 0    50   ~ 0
Strukturbyte
Text Notes 10650 5750 0    50   ~ 0
Brückenplan
Text Notes 7950 5950 0    50   ~ 0
Modul
Text Notes 7950 6200 0    50   ~ 0
M045
Text Notes 7950 6300 0    50   ~ 0
M046
Text Notes 7950 6400 0    50   ~ 0
M047
Text Notes 10650 5950 0    50   ~ 0
EPROM-Typ
Text Notes 10650 6100 0    50   ~ 0
2764
Text Notes 10650 6300 0    50   ~ 0
27128
Text Notes 10650 6400 0    50   ~ 0
27256
Wire Notes Line
	7900 5800 11150 5800
Wire Notes Line
	11150 5800 11150 6450
Wire Notes Line
	11150 6450 7900 6450
Wire Notes Line
	7900 6450 7900 5800
Text Notes 9350 6100 0    50   ~ 0
01h
Text Notes 9125 6100 0    50   ~ 0
x
Text Notes 8425 6100 2    50   ~ 0
 2x8k
Text Notes 7950 6100 0    50   ~ 0
M033
Text Notes 10025 6100 0    50   ~ 0
x
Text Notes 10175 6100 0    50   ~ 0
x
Text Notes 8975 6100 0    50   ~ 0
x
Text Notes 10650 6200 0    50   ~ 0
2764
Wire Notes Line style solid
	7950 6000 11100 6000
Wire Notes Line style solid
	9800 5850 9800 6400
Text Notes 9850 5950 0    50   ~ 0
RB
Wire Wire Line
	7650 6450 7650 5650
Wire Wire Line
	7650 5650 8000 5650
Wire Wire Line
	7250 5500 7350 5500
Wire Wire Line
	7350 5500 7350 5250
Wire Wire Line
	7350 5250 7450 5250
Wire Wire Line
	7850 5350 7900 5350
Wire Wire Line
	7900 5350 7900 5450
Wire Wire Line
	8050 5450 7900 5450
Wire Wire Line
	7450 5450 7400 5450
Wire Wire Line
	7400 5450 7400 5700
$EndSCHEMATC
