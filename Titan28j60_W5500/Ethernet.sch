EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:LehmanKiCad
LIBS:TitanPanel-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RJ45-TRANSFO J202
U 1 1 58E4EBFF
P 7500 4900
F 0 "J202" H 7600 5500 50  0000 L CNN
F 1 "RJ45-TRANSFO" H 7450 5500 50  0000 R CNN
F 2 "LehmanKiPatterns:RJ45_TRANS_J0011D21BNL" H 7500 4900 50  0001 C CNN
F 3 "" H 7500 4900 50  0001 C CNN
	1    7500 4900
	1    0    0    -1  
$EndComp
$Comp
L W5500 U202
U 1 1 58E5178D
P 4150 6000
F 0 "U202" H 3700 7725 50  0000 L BNN
F 1 "W5500" H 4200 7400 50  0000 R BNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" V 4100 6825 50  0001 R TNN
F 3 "" H 12100 5900 50  0001 C CNN
	1    4150 6000
	1    0    0    -1  
$EndComp
$Comp
L R R210
U 1 1 58E51A47
P 5000 6300
F 0 "R210" V 5080 6300 50  0000 C CNN
F 1 "12k4 1%" V 5150 6300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4930 6300 50  0001 C CNN
F 3 "" H 5000 6300 50  0001 C CNN
	1    5000 6300
	0    1    1    0   
$EndComp
$Comp
L Crystal Y202
U 1 1 58E51DB6
P 3000 5300
F 0 "Y202" H 3000 5450 50  0000 C CNN
F 1 "25MHz" H 3000 5150 50  0000 C CNN
F 2 "Crystals:Crystal_SMD_HC49-SD" H 3000 5300 50  0001 C CNN
F 3 "" H 3000 5300 50  0001 C CNN
	1    3000 5300
	0    -1   -1   0   
$EndComp
$Comp
L C C210
U 1 1 58E52002
P 2800 5500
F 0 "C210" H 2825 5600 50  0000 L CNN
F 1 "18p" V 2700 5300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2838 5350 50  0001 C CNN
F 3 "" H 2800 5500 50  0001 C CNN
	1    2800 5500
	0    -1   -1   0   
$EndComp
$Comp
L C C209
U 1 1 58E520B5
P 2800 5100
F 0 "C209" H 2825 5200 50  0000 L CNN
F 1 "18p" V 2950 4950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2838 4950 50  0001 C CNN
F 3 "" H 2800 5100 50  0001 C CNN
	1    2800 5100
	0    -1   -1   0   
$EndComp
$Comp
L R R201
U 1 1 58E5254E
P 3250 5300
F 0 "R201" V 3330 5300 50  0000 C CNN
F 1 "1M" V 3250 5300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3180 5300 50  0001 C CNN
F 3 "" H 3250 5300 50  0001 C CNN
	1    3250 5300
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR01
U 1 1 58E527FC
P 4050 7350
F 0 "#PWR01" H 4050 7100 50  0001 C CNN
F 1 "Earth" H 4050 7200 50  0001 C CNN
F 2 "" H 4050 7350 50  0001 C CNN
F 3 "" H 4050 7350 50  0001 C CNN
	1    4050 7350
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR02
U 1 1 58E5281E
P 2600 5550
F 0 "#PWR02" H 2600 5300 50  0001 C CNN
F 1 "Earth" H 2600 5400 50  0001 C CNN
F 2 "" H 2600 5550 50  0001 C CNN
F 3 "" H 2600 5550 50  0001 C CNN
	1    2600 5550
	1    0    0    -1  
$EndComp
$Comp
L R R204
U 1 1 58E5303D
P 4850 4150
F 0 "R204" V 4930 4150 50  0000 C CNN
F 1 "50R 1%" V 4850 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4780 4150 50  0001 C CNN
F 3 "" H 4850 4150 50  0001 C CNN
	1    4850 4150
	1    0    0    -1  
$EndComp
$Comp
L R R212
U 1 1 58E530F4
P 5100 4150
F 0 "R212" V 5180 4150 50  0000 C CNN
F 1 "50R 1%" V 5100 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5030 4150 50  0001 C CNN
F 3 "" H 5100 4150 50  0001 C CNN
	1    5100 4150
	1    0    0    -1  
$EndComp
$Comp
L R R215
U 1 1 58E53185
P 5350 4150
F 0 "R215" V 5430 4150 50  0000 C CNN
F 1 "10R" V 5350 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5280 4150 50  0001 C CNN
F 3 "" H 5350 4150 50  0001 C CNN
	1    5350 4150
	1    0    0    -1  
$EndComp
$Comp
L C C222
U 1 1 58E5388A
P 5850 4200
F 0 "C222" H 5875 4300 50  0000 L CNN
F 1 "22n" H 5875 4100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5888 4050 50  0001 C CNN
F 3 "" H 5850 4200 50  0001 C CNN
	1    5850 4200
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR03
U 1 1 58E54687
P 6200 4000
F 0 "#PWR03" H 6200 3750 50  0001 C CNN
F 1 "Earth" H 6200 3850 50  0001 C CNN
F 2 "" H 6200 4000 50  0001 C CNN
F 3 "" H 6200 4000 50  0001 C CNN
	1    6200 4000
	1    0    0    -1  
$EndComp
$Comp
L C C219
U 1 1 58E54937
P 5300 4900
F 0 "C219" H 5325 5000 50  0000 L CNN
F 1 "6n8" H 5325 4800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5338 4750 50  0001 C CNN
F 3 "" H 5300 4900 50  0001 C CNN
	1    5300 4900
	0    -1   -1   0   
$EndComp
$Comp
L C C218
U 1 1 58E549AA
P 5300 4700
F 0 "C218" H 5325 4800 50  0000 L CNN
F 1 "6n8" H 5325 4600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5338 4550 50  0001 C CNN
F 3 "" H 5300 4700 50  0001 C CNN
	1    5300 4700
	0    -1   -1   0   
$EndComp
$Comp
L R R205
U 1 1 58E54BAF
P 4850 5100
F 0 "R205" V 4930 5100 50  0000 C CNN
F 1 "50R 1%" V 4850 5100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4780 5100 50  0001 C CNN
F 3 "" H 4850 5100 50  0001 C CNN
	1    4850 5100
	1    0    0    -1  
$EndComp
$Comp
L R R213
U 1 1 58E54C5A
P 5100 5100
F 0 "R213" V 5180 5100 50  0000 C CNN
F 1 "50R 1%" V 5100 5100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5030 5100 50  0001 C CNN
F 3 "" H 5100 5100 50  0001 C CNN
	1    5100 5100
	1    0    0    -1  
$EndComp
$Comp
L C C220
U 1 1 58E54CD3
P 5350 5400
F 0 "C220" H 5375 5500 50  0000 L CNN
F 1 "10n" H 5375 5300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5388 5250 50  0001 C CNN
F 3 "" H 5350 5400 50  0001 C CNN
	1    5350 5400
	1    0    0    -1  
$EndComp
$Comp
L C C215
U 1 1 58E556D1
P 4900 5400
F 0 "C215" H 4925 5500 50  0000 L CNN
F 1 "10n" V 4950 5200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4938 5250 50  0001 C CNN
F 3 "" H 4900 5400 50  0001 C CNN
	1    4900 5400
	0    -1   -1   0   
$EndComp
$Comp
L C C216
U 1 1 58E55BB6
P 4900 5600
F 0 "C216" H 4925 5700 50  0000 L CNN
F 1 "4,7uF" V 5050 5450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4938 5450 50  0001 C CNN
F 3 "" H 4900 5600 50  0001 C CNN
	1    4900 5600
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR04
U 1 1 58E58311
P 5000 7050
F 0 "#PWR04" H 5000 6800 50  0001 C CNN
F 1 "Earth" H 5000 6900 50  0001 C CNN
F 2 "" H 5000 7050 50  0001 C CNN
F 3 "" H 5000 7050 50  0001 C CNN
	1    5000 7050
	1    0    0    -1  
$EndComp
$Comp
L R R209
U 1 1 58E595A8
P 5000 6100
F 0 "R209" V 5080 6100 50  0000 C CNN
F 1 "470" V 5000 6100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4930 6100 50  0001 C CNN
F 3 "" H 5000 6100 50  0001 C CNN
	1    5000 6100
	0    1    1    0   
$EndComp
$Comp
L R R208
U 1 1 58E59683
P 5000 5900
F 0 "R208" V 5080 5900 50  0000 C CNN
F 1 "470" V 5000 5900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4930 5900 50  0001 C CNN
F 3 "" H 5000 5900 50  0001 C CNN
	1    5000 5900
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR05
U 1 1 58E5A04B
P 6500 5700
F 0 "#PWR05" H 6500 5550 50  0001 C CNN
F 1 "+3.3V" H 6500 5840 50  0000 C CNN
F 2 "" H 6500 5700 50  0001 C CNN
F 3 "" H 6500 5700 50  0001 C CNN
	1    6500 5700
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR06
U 1 1 58E5A0F6
P 8150 5400
F 0 "#PWR06" H 8150 5200 50  0001 C CNN
F 1 "GNDPWR" H 8150 5270 50  0000 C CNN
F 2 "" H 8150 5350 50  0001 C CNN
F 3 "" H 8150 5350 50  0001 C CNN
	1    8150 5400
	1    0    0    -1  
$EndComp
$Comp
L C C223
U 1 1 58E5A311
P 6550 3850
F 0 "C223" H 6575 3950 50  0000 L CNN
F 1 "1nF 2kV" H 6575 3750 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 6588 3700 50  0001 C CNN
F 3 "" H 6550 3850 50  0001 C CNN
	1    6550 3850
	0    1    1    0   
$EndComp
$Comp
L Ferrite_Bead L201
U 1 1 58E5A6F0
P 4300 4050
F 0 "L201" V 3900 4050 50  0000 C CNN
F 1 "600 ohm ±25% 500 мА" V 4000 4400 50  0000 C CNN
F 2 "Inductors_SMD:L_0603" V 4230 4050 50  0001 C CNN
F 3 "" H 4300 4050 50  0001 C CNN
	1    4300 4050
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 58E5AE4B
P 4050 3800
F 0 "#PWR07" H 4050 3650 50  0001 C CNN
F 1 "+3.3V" H 4050 3940 50  0000 C CNN
F 2 "" H 4050 3800 50  0001 C CNN
F 3 "" H 4050 3800 50  0001 C CNN
	1    4050 3800
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR08
U 1 1 58E5B462
P 3000 7100
F 0 "#PWR08" H 3000 6850 50  0001 C CNN
F 1 "Earth" H 3000 6950 50  0001 C CNN
F 2 "" H 3000 7100 50  0001 C CNN
F 3 "" H 3000 7100 50  0001 C CNN
	1    3000 7100
	1    0    0    -1  
$EndComp
$Comp
L R R202
U 1 1 58E5B7A4
P 3300 7000
F 0 "R202" V 3380 7000 50  0000 C CNN
F 1 "0R" V 3300 7000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3230 7000 50  0001 C CNN
F 3 "" H 3300 7000 50  0001 C CNN
	1    3300 7000
	0    -1   -1   0   
$EndComp
Text GLabel 3350 5800 0    60   Input ~ 0
CS_W5500
Text GLabel 3350 5900 0    60   Input ~ 0
ETH_SCLK
Text GLabel 3350 6000 0    60   Input ~ 0
ETH_MISO
Text GLabel 3350 6100 0    60   Input ~ 0
ETH_MOSI
Text GLabel 3350 6700 0    60   Input ~ 0
INT_W5500
Text GLabel 3350 6800 0    60   Input ~ 0
RST_W5500
$Comp
L ENC28J60-I/SO U201
U 1 1 58E6222C
P 3450 2050
F 0 "U201" H 2900 3000 50  0000 L CNN
F 1 "ENC28J60-I/SO" H 3600 3050 50  0000 L CNN
F 2 "SMD_Packages:SOIC-28" H 3450 2050 50  0001 C CIN
F 3 "" H 3450 2050 50  0001 C CNN
	1    3450 2050
	1    0    0    -1  
$EndComp
$Comp
L RJ45-TRANSFO J201
U 1 1 58E6301C
P 7500 2050
F 0 "J201" H 7600 2650 50  0000 L CNN
F 1 "RJ45-TRANSFO" H 7450 2650 50  0000 R CNN
F 2 "LehmanKiPatterns:RJ45_TRANS_J0011D21BNL" H 7500 2050 50  0001 C CNN
F 3 "" H 7500 2050 50  0001 C CNN
	1    7500 2050
	1    0    0    -1  
$EndComp
Text GLabel 2050 1650 0    60   Input ~ 0
ETH_SCLK
Text GLabel 2050 1550 0    60   Input ~ 0
ETH_MISO
Text GLabel 2050 1450 0    60   Input ~ 0
ETH_MOSI
Text GLabel 2050 1750 0    60   Input ~ 0
CS_ENC28
Text GLabel 2050 1950 0    60   Input ~ 0
INT_ENC28
Text GLabel 2050 1250 0    60   Input ~ 0
RST_ENC28
$Comp
L Crystal Y201
U 1 1 58E645DA
P 2350 2450
F 0 "Y201" H 2350 2600 50  0000 C CNN
F 1 "25MHz" V 2050 2450 50  0000 C CNN
F 2 "Crystals:Crystal_SMD_HC49-SD" H 2350 2450 50  0001 C CNN
F 3 "" H 2350 2450 50  0001 C CNN
	1    2350 2450
	0    1    1    0   
$EndComp
$Comp
L C C205
U 1 1 58E64C27
P 2100 2250
F 0 "C205" H 2125 2350 50  0000 L CNN
F 1 "18p" H 2125 2150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2138 2100 50  0001 C CNN
F 3 "" H 2100 2250 50  0001 C CNN
	1    2100 2250
	0    1    1    0   
$EndComp
$Comp
L C C206
U 1 1 58E64D14
P 2100 2650
F 0 "C206" H 2125 2750 50  0000 L CNN
F 1 "18p" H 2125 2550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2138 2500 50  0001 C CNN
F 3 "" H 2100 2650 50  0001 C CNN
	1    2100 2650
	0    1    1    0   
$EndComp
$Comp
L R R203
U 1 1 58E6525D
P 4500 2650
F 0 "R203" V 4580 2650 50  0000 C CNN
F 1 "2k 1%" V 4500 2650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4430 2650 50  0001 C CNN
F 3 "" H 4500 2650 50  0001 C CNN
	1    4500 2650
	0    1    1    0   
$EndComp
$Comp
L C C214
U 1 1 58E6533C
P 4500 2850
F 0 "C214" H 4525 2950 50  0000 L CNN
F 1 "10uF" H 4525 2750 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 4538 2700 50  0001 C CNN
F 3 "" H 4500 2850 50  0001 C CNN
	1    4500 2850
	0    1    1    0   
$EndComp
$Comp
L R R206
U 1 1 58E66FD9
P 4900 1000
F 0 "R206" V 4980 1000 50  0000 C CNN
F 1 "50R 1%" V 4900 1000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4830 1000 50  0001 C CNN
F 3 "" H 4900 1000 50  0001 C CNN
	1    4900 1000
	-1   0    0    1   
$EndComp
$Comp
L R R211
U 1 1 58E671FC
P 5100 1000
F 0 "R211" V 5180 1000 50  0000 C CNN
F 1 "50R 1%" V 5100 1000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5030 1000 50  0001 C CNN
F 3 "" H 5100 1000 50  0001 C CNN
	1    5100 1000
	-1   0    0    1   
$EndComp
$Comp
L C C221
U 1 1 58E6744E
P 5400 1350
F 0 "C221" H 5425 1450 50  0000 L CNN
F 1 "10n" H 5425 1250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5438 1200 50  0001 C CNN
F 3 "" H 5400 1350 50  0001 C CNN
	1    5400 1350
	0    -1   -1   0   
$EndComp
$Comp
L Ferrite_Bead L202
U 1 1 58E68B92
P 5600 1000
F 0 "L202" V 5550 850 50  0000 C CNN
F 1 "600 ohm ±25% 500 мА" H 5050 1150 50  0000 C CNN
F 2 "Inductors_SMD:L_0603" V 5530 1000 50  0001 C CNN
F 3 "" H 5600 1000 50  0001 C CNN
	1    5600 1000
	-1   0    0    1   
$EndComp
$Comp
L R R207
U 1 1 58E6A479
P 4950 2550
F 0 "R207" V 5030 2550 50  0000 C CNN
F 1 "50R 1%" V 4950 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4880 2550 50  0001 C CNN
F 3 "" H 4950 2550 50  0001 C CNN
	1    4950 2550
	-1   0    0    1   
$EndComp
$Comp
L R R214
U 1 1 58E6A554
P 5150 2550
F 0 "R214" V 5230 2550 50  0000 C CNN
F 1 "50R 1%" V 5150 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5080 2550 50  0001 C CNN
F 3 "" H 5150 2550 50  0001 C CNN
	1    5150 2550
	-1   0    0    1   
$EndComp
$Comp
L C C217
U 1 1 58E6A7C6
P 5050 2950
F 0 "C217" H 5075 3050 50  0000 L CNN
F 1 "10n" H 5075 2850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5088 2800 50  0001 C CNN
F 3 "" H 5050 2950 50  0001 C CNN
	1    5050 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 5500 2650 5500
Wire Wire Line
	2600 5100 2600 5500
Wire Wire Line
	2600 5500 2600 5550
Wire Wire Line
	2650 5100 2600 5100
Connection ~ 3000 5500
Wire Wire Line
	3000 5500 3000 5450
Connection ~ 3250 5500
Wire Wire Line
	3250 5500 3250 5450
Wire Wire Line
	2950 5500 3000 5500
Wire Wire Line
	3000 5500 3250 5500
Wire Wire Line
	3250 5500 3550 5500
Connection ~ 3250 5100
Wire Wire Line
	3250 5100 3250 5150
Connection ~ 3000 5100
Wire Wire Line
	3000 5150 3000 5100
Connection ~ 4750 7000
Connection ~ 4750 6600
Wire Wire Line
	4650 6600 4750 6600
Connection ~ 4750 6700
Wire Wire Line
	4750 6700 4650 6700
Connection ~ 4750 6800
Wire Wire Line
	4750 6800 4650 6800
Connection ~ 4750 6900
Wire Wire Line
	4750 6900 4650 6900
Wire Wire Line
	5350 7000 5000 7000
Wire Wire Line
	5000 7000 4750 7000
Wire Wire Line
	4750 7000 4650 7000
Wire Wire Line
	4750 6500 4750 6600
Wire Wire Line
	4750 6600 4750 6700
Wire Wire Line
	4750 6700 4750 6800
Wire Wire Line
	4750 6800 4750 6900
Wire Wire Line
	4750 6900 4750 7000
Wire Wire Line
	4650 6500 4750 6500
Connection ~ 2600 5500
Wire Wire Line
	4050 7300 4050 7350
Wire Wire Line
	4650 4400 4850 4400
Wire Wire Line
	4850 4400 6200 4400
Wire Wire Line
	4650 4600 5100 4600
Wire Wire Line
	5100 4600 6200 4600
Wire Wire Line
	4850 4300 4850 4400
Connection ~ 4850 4400
Wire Wire Line
	5100 4300 5100 4600
Connection ~ 5100 4600
Wire Wire Line
	5350 4300 5350 4500
Wire Wire Line
	5350 4500 5850 4500
Wire Wire Line
	5850 4500 6200 4500
Wire Wire Line
	3450 3850 3450 4400
Wire Wire Line
	3450 4400 3450 4500
Wire Wire Line
	3450 4500 3450 4600
Wire Wire Line
	3450 4600 3450 4700
Wire Wire Line
	3450 4700 3450 4800
Wire Wire Line
	3450 4800 3450 4900
Wire Wire Line
	5350 3850 5350 4000
Wire Wire Line
	5100 3850 5100 4000
Wire Wire Line
	4850 3850 4850 4000
Wire Wire Line
	5850 4350 5850 4500
Connection ~ 5850 4500
Wire Wire Line
	5850 3850 5850 4050
Wire Wire Line
	6200 3850 6200 4000
Wire Wire Line
	5550 4800 6200 4800
Wire Wire Line
	4850 5250 5100 5250
Wire Wire Line
	5100 5250 5350 5250
Wire Wire Line
	5350 5250 5550 5250
Connection ~ 5350 5250
Connection ~ 5100 5250
Wire Wire Line
	4650 4700 4850 4700
Wire Wire Line
	4850 4700 5150 4700
Wire Wire Line
	4650 4900 5100 4900
Wire Wire Line
	5100 4900 5150 4900
Wire Wire Line
	4850 4950 4850 4700
Connection ~ 4850 4700
Wire Wire Line
	5100 4950 5100 4900
Connection ~ 5100 4900
Wire Wire Line
	5450 4700 6200 4700
Wire Wire Line
	5450 4900 6200 4900
Wire Wire Line
	5550 5250 5550 4800
Wire Wire Line
	4750 5400 4650 5400
Wire Wire Line
	4750 5600 4650 5600
Wire Wire Line
	5050 5400 5100 5400
Wire Wire Line
	5100 5400 5100 5600
Wire Wire Line
	5050 5600 5100 5600
Wire Wire Line
	5100 5600 5350 5600
Wire Wire Line
	5350 5550 5350 5600
Wire Wire Line
	5350 5600 5350 6300
Wire Wire Line
	5350 6300 5350 7000
Connection ~ 5100 5600
Connection ~ 5350 5600
Wire Wire Line
	4850 6300 4650 6300
Wire Wire Line
	5150 6300 5350 6300
Connection ~ 5350 6300
Wire Wire Line
	5000 7050 5000 7000
Connection ~ 5000 7000
Wire Wire Line
	4850 5900 4650 5900
Wire Wire Line
	4850 6100 4650 6100
Wire Wire Line
	6200 5200 5750 5200
Wire Wire Line
	5750 5200 5750 5900
Wire Wire Line
	5750 5900 5150 5900
Wire Wire Line
	6200 5400 5950 5400
Wire Wire Line
	5950 5400 5950 6100
Wire Wire Line
	5950 6100 5150 6100
Wire Wire Line
	6200 5100 6150 5100
Wire Wire Line
	6150 5100 6150 5300
Wire Wire Line
	6150 5300 6150 5750
Wire Wire Line
	6150 5300 6200 5300
Wire Wire Line
	6150 5750 6500 5750
Wire Wire Line
	6500 5750 6500 5700
Connection ~ 6150 5300
Wire Wire Line
	8150 5300 8100 5300
Wire Wire Line
	8150 1250 8150 2450
Wire Wire Line
	8150 2450 8150 4200
Wire Wire Line
	8150 4200 8150 5300
Wire Wire Line
	8150 5300 8150 5400
Wire Wire Line
	6200 5000 6150 5000
Wire Wire Line
	6150 5000 6150 4200
Wire Wire Line
	6150 4200 6800 4200
Wire Wire Line
	6800 4200 8150 4200
Connection ~ 8150 5300
Wire Wire Line
	6800 3850 6800 4200
Connection ~ 6800 4200
Wire Wire Line
	4550 4050 4450 4050
Wire Wire Line
	4550 3850 4550 4050
Wire Wire Line
	4150 4050 4050 4050
Wire Wire Line
	4050 3800 4050 4050
Wire Wire Line
	4050 4050 4050 4200
Wire Wire Line
	3550 4500 3450 4500
Connection ~ 3450 4500
Wire Wire Line
	3550 4600 3450 4600
Connection ~ 3450 4600
Wire Wire Line
	3550 4700 3450 4700
Connection ~ 3450 4700
Wire Wire Line
	3550 4800 3450 4800
Connection ~ 3450 4800
Wire Wire Line
	3300 4900 3450 4900
Wire Wire Line
	3450 4900 3550 4900
Connection ~ 4050 4050
Wire Wire Line
	3150 7000 3000 7000
Wire Wire Line
	3000 7000 3000 7100
Wire Wire Line
	3450 7000 3550 7000
Wire Wire Line
	5850 3850 6200 3850
Wire Wire Line
	6200 3850 6400 3850
Connection ~ 6200 3850
Wire Wire Line
	6800 3850 6700 3850
Wire Wire Line
	2700 3850 2950 3850
Wire Wire Line
	2950 3850 3200 3850
Wire Wire Line
	3200 3850 3450 3850
Wire Wire Line
	3450 3850 4550 3850
Wire Wire Line
	4550 3850 4850 3850
Wire Wire Line
	4850 3850 5100 3850
Wire Wire Line
	5100 3850 5350 3850
Connection ~ 4550 3850
Connection ~ 4850 3850
Connection ~ 5100 3850
Wire Wire Line
	2950 5100 3000 5100
Wire Wire Line
	3000 5100 3250 5100
Wire Wire Line
	3250 5100 3550 5100
Wire Wire Line
	3550 5800 3350 5800
Wire Wire Line
	3550 5900 3350 5900
Wire Wire Line
	3350 6000 3550 6000
Wire Wire Line
	3350 6100 3550 6100
Wire Wire Line
	3350 6700 3550 6700
Wire Wire Line
	3350 6800 3550 6800
Wire Wire Line
	2050 1250 2150 1250
Wire Wire Line
	2150 1250 2750 1250
Wire Wire Line
	2050 1450 2750 1450
Wire Wire Line
	2050 1550 2750 1550
Wire Wire Line
	2050 1650 2750 1650
Wire Wire Line
	2050 1750 2150 1750
Wire Wire Line
	2150 1750 2750 1750
Wire Wire Line
	2750 2350 2550 2350
Wire Wire Line
	2550 2350 2550 2250
Wire Wire Line
	2550 2250 2350 2250
Wire Wire Line
	2350 2250 2250 2250
Wire Wire Line
	2750 2550 2550 2550
Wire Wire Line
	2550 2550 2550 2650
Wire Wire Line
	2550 2650 2350 2650
Wire Wire Line
	2350 2650 2250 2650
Wire Wire Line
	2350 2600 2350 2650
Connection ~ 2350 2650
Wire Wire Line
	2350 2300 2350 2250
Connection ~ 2350 2250
Wire Wire Line
	1950 2250 1900 2250
Wire Wire Line
	1900 2250 1900 2650
Wire Wire Line
	1900 2650 1900 2800
Wire Wire Line
	1900 2800 1900 3300
Wire Wire Line
	1900 2650 1950 2650
Wire Wire Line
	2750 2650 2650 2650
Wire Wire Line
	2650 2650 2650 2800
Connection ~ 1900 2650
Wire Wire Line
	4150 2650 4350 2650
Wire Wire Line
	4350 2850 4150 2850
Wire Wire Line
	4750 2650 4650 2650
Wire Wire Line
	4750 2850 4650 2850
Wire Wire Line
	2650 2800 1900 2800
Wire Wire Line
	2650 2250 2750 2250
Wire Wire Line
	2650 700  2650 1000
Wire Wire Line
	2650 1000 2650 1150
Wire Wire Line
	2650 1150 2650 1850
Wire Wire Line
	2650 1850 2650 2250
Wire Wire Line
	2650 700  3350 700 
Wire Wire Line
	3350 700  3550 700 
Wire Wire Line
	3550 700  4250 700 
Wire Wire Line
	4250 700  4900 700 
Wire Wire Line
	4900 700  5100 700 
Wire Wire Line
	5100 700  5600 700 
Wire Wire Line
	3350 700  3350 1000
Wire Wire Line
	4900 1650 4150 1650
Wire Wire Line
	4900 1150 4900 1550
Wire Wire Line
	4900 1550 4900 1650
Wire Wire Line
	4150 1750 5100 1750
Wire Wire Line
	5100 1750 6200 1750
Wire Wire Line
	5100 1750 5100 1150
Connection ~ 5100 1750
Wire Wire Line
	6200 1550 4900 1550
Connection ~ 4900 1550
Wire Wire Line
	6200 1650 5900 1650
Wire Wire Line
	4900 700  4900 850 
Wire Wire Line
	5100 700  5100 850 
Wire Wire Line
	4250 1550 4150 1550
Wire Wire Line
	4250 700  4250 1550
Wire Wire Line
	4250 1550 4250 2050
Wire Wire Line
	5600 700  5600 850 
Connection ~ 4900 700 
Connection ~ 5100 700 
Wire Wire Line
	5600 1150 5600 1350
Wire Wire Line
	5900 1650 5900 1350
Wire Wire Line
	5900 1350 5600 1350
Wire Wire Line
	5600 1350 5550 1350
Connection ~ 5600 1350
Wire Wire Line
	1900 3300 3350 3300
Wire Wire Line
	3350 3300 3550 3300
Wire Wire Line
	3550 3300 4100 3300
Wire Wire Line
	4100 3300 4750 3300
Wire Wire Line
	4750 3300 5050 3300
Wire Wire Line
	5050 3300 6100 3300
Connection ~ 4750 2850
Connection ~ 1900 2800
Wire Wire Line
	3550 3100 3550 3300
Connection ~ 3550 3300
Wire Wire Line
	3350 3100 3350 3300
Connection ~ 3350 3300
Wire Wire Line
	3550 700  3550 1000
Connection ~ 4250 700 
Wire Wire Line
	4150 2150 4950 2150
Wire Wire Line
	4950 1850 4950 2150
Wire Wire Line
	4950 2150 4950 2400
Wire Wire Line
	4950 1850 6200 1850
Wire Wire Line
	4150 2250 5150 2250
Connection ~ 4750 3300
Wire Wire Line
	4950 2700 4950 2750
Wire Wire Line
	4950 2750 5050 2750
Wire Wire Line
	5050 2750 5150 2750
Wire Wire Line
	5150 2750 5150 2700
Wire Wire Line
	5050 2800 5050 2750
Connection ~ 5050 2750
Connection ~ 4950 2150
Connection ~ 5150 2250
Wire Wire Line
	4750 2350 4150 2350
Connection ~ 4750 2650
Wire Wire Line
	4250 2050 4150 2050
Connection ~ 4250 1550
$Comp
L Earth #PWR09
U 1 1 58E6B427
P 4100 3400
F 0 "#PWR09" H 4100 3150 50  0001 C CNN
F 1 "Earth" H 4100 3250 50  0001 C CNN
F 2 "" H 4100 3400 50  0001 C CNN
F 3 "" H 4100 3400 50  0001 C CNN
	1    4100 3400
	1    0    0    -1  
$EndComp
Connection ~ 5050 3300
Connection ~ 3350 700 
Connection ~ 3550 700 
Wire Wire Line
	4600 1950 4600 1250
Wire Wire Line
	4600 1250 4150 1250
Wire Wire Line
	4450 1350 4450 2050
Wire Wire Line
	4450 1350 4150 1350
Wire Wire Line
	6200 2350 6100 2350
Wire Wire Line
	6100 2350 6100 2550
Wire Wire Line
	6100 2550 6100 3300
Wire Wire Line
	6100 2550 6200 2550
Connection ~ 6100 2550
Wire Wire Line
	5050 3100 5050 3300
Wire Wire Line
	4100 3400 4100 3300
Connection ~ 4100 3300
Wire Wire Line
	8100 2450 8150 2450
Wire Wire Line
	8150 1250 6100 1250
Wire Wire Line
	6100 1250 6100 2150
Wire Wire Line
	6100 2150 6200 2150
Connection ~ 8150 2450
Connection ~ 8150 4200
$Comp
L +3.3V #PWR010
U 1 1 58E7175C
P 2400 950
F 0 "#PWR010" H 2400 800 50  0001 C CNN
F 1 "+3.3V" H 2400 1090 50  0000 C CNN
F 2 "" H 2400 950 50  0001 C CNN
F 3 "" H 2400 950 50  0001 C CNN
	1    2400 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 950  2400 1000
Wire Wire Line
	2400 1000 2650 1000
Connection ~ 2650 1000
Wire Wire Line
	4750 1350 4750 1850
Wire Wire Line
	4750 1850 4750 2350
Wire Wire Line
	4750 2350 4750 2650
Wire Wire Line
	4750 2650 4750 2850
Wire Wire Line
	4750 2850 4750 3300
$Comp
L R R216
U 1 1 58E73005
P 5800 2250
F 0 "R216" V 5880 2250 50  0000 C CNN
F 1 "470" V 5800 2250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5730 2250 50  0001 C CNN
F 3 "" H 5800 2250 50  0001 C CNN
	1    5800 2250
	0    1    1    0   
$EndComp
$Comp
L R R217
U 1 1 58E730C9
P 5800 2450
F 0 "R217" V 5880 2450 50  0000 C CNN
F 1 "470" V 5800 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5730 2450 50  0001 C CNN
F 3 "" H 5800 2450 50  0001 C CNN
	1    5800 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 2250 5950 2250
Wire Wire Line
	6200 2450 5950 2450
Wire Wire Line
	5150 2150 5150 2250
Wire Wire Line
	5150 2250 5150 2400
Wire Wire Line
	6200 2050 5900 2050
Wire Wire Line
	5900 2050 5900 2150
Wire Wire Line
	5900 2150 5150 2150
Wire Wire Line
	4600 1950 5450 1950
Wire Wire Line
	5450 1950 5450 2250
Wire Wire Line
	5450 2250 5650 2250
Wire Wire Line
	4450 2050 5300 2050
Wire Wire Line
	5300 2050 5300 2450
Wire Wire Line
	5300 2450 5650 2450
Wire Wire Line
	4150 1850 4750 1850
Connection ~ 4750 2350
Wire Wire Line
	5250 1350 4750 1350
Connection ~ 4750 1850
Wire Wire Line
	3550 4400 3450 4400
Connection ~ 3450 4400
$Comp
L C C213
U 1 1 58E762C7
P 3200 4250
F 0 "C213" H 3225 4350 50  0000 L CNN
F 1 "0,1uF" H 3225 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3238 4100 50  0001 C CNN
F 3 "" H 3200 4250 50  0001 C CNN
	1    3200 4250
	1    0    0    -1  
$EndComp
$Comp
L C C211
U 1 1 58E765D1
P 2950 4250
F 0 "C211" H 2975 4350 50  0000 L CNN
F 1 "0,1uF" H 2975 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2988 4100 50  0001 C CNN
F 3 "" H 2950 4250 50  0001 C CNN
	1    2950 4250
	1    0    0    -1  
$EndComp
$Comp
L C C208
U 1 1 58E76662
P 2700 4250
F 0 "C208" H 2725 4350 50  0000 L CNN
F 1 "0,1uF" H 2725 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2738 4100 50  0001 C CNN
F 3 "" H 2700 4250 50  0001 C CNN
	1    2700 4250
	1    0    0    -1  
$EndComp
$Comp
L C C207
U 1 1 58E766FA
P 2300 4250
F 0 "C207" H 2325 4350 50  0000 L CNN
F 1 "0,1uF" H 2325 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2338 4100 50  0001 C CNN
F 3 "" H 2300 4250 50  0001 C CNN
	1    2300 4250
	1    0    0    -1  
$EndComp
$Comp
L C C204
U 1 1 58E76797
P 2050 4250
F 0 "C204" H 2075 4350 50  0000 L CNN
F 1 "0,1uF" H 2075 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2088 4100 50  0001 C CNN
F 3 "" H 2050 4250 50  0001 C CNN
	1    2050 4250
	1    0    0    -1  
$EndComp
$Comp
L C C203
U 1 1 58E76831
P 1800 4250
F 0 "C203" H 1825 4350 50  0000 L CNN
F 1 "0,1uF" H 1825 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1838 4100 50  0001 C CNN
F 3 "" H 1800 4250 50  0001 C CNN
	1    1800 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4100 2700 3850
Connection ~ 3450 3850
Wire Wire Line
	2950 3850 2950 4100
Connection ~ 2950 3850
Wire Wire Line
	3200 4100 3200 3850
Connection ~ 3200 3850
Wire Wire Line
	3200 4500 3200 4400
Wire Wire Line
	1300 4500 1550 4500
Wire Wire Line
	1550 4500 1800 4500
Wire Wire Line
	1800 4500 2050 4500
Wire Wire Line
	2050 4500 2300 4500
Wire Wire Line
	2300 4500 2500 4500
Wire Wire Line
	2500 4500 2700 4500
Wire Wire Line
	2700 4500 2850 4500
Wire Wire Line
	2850 4500 2950 4500
Wire Wire Line
	2950 4500 3200 4500
Wire Wire Line
	2950 4500 2950 4400
Wire Wire Line
	2700 4500 2700 4400
Connection ~ 2950 4500
Wire Wire Line
	2300 4500 2300 4400
Connection ~ 2700 4500
Wire Wire Line
	2050 4500 2050 4400
Connection ~ 2300 4500
Wire Wire Line
	1800 4500 1800 4400
Connection ~ 2050 4500
Wire Wire Line
	2300 3900 2300 4100
Wire Wire Line
	1300 3900 1550 3900
Wire Wire Line
	1550 3900 1800 3900
Wire Wire Line
	1800 3900 2050 3900
Wire Wire Line
	2050 3900 2200 3900
Wire Wire Line
	2200 3900 2300 3900
Wire Wire Line
	2050 3900 2050 4100
Wire Wire Line
	1800 3900 1800 4100
Connection ~ 2050 3900
$Comp
L +3.3V #PWR011
U 1 1 58E7745F
P 2200 3800
F 0 "#PWR011" H 2200 3650 50  0001 C CNN
F 1 "+3.3V" H 2200 3940 50  0000 C CNN
F 2 "" H 2200 3800 50  0001 C CNN
F 3 "" H 2200 3800 50  0001 C CNN
	1    2200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3800 2200 3900
Connection ~ 2200 3900
$Comp
L Earth #PWR012
U 1 1 58E77625
P 2500 4600
F 0 "#PWR012" H 2500 4350 50  0001 C CNN
F 1 "Earth" H 2500 4450 50  0001 C CNN
F 2 "" H 2500 4600 50  0001 C CNN
F 3 "" H 2500 4600 50  0001 C CNN
	1    2500 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4600 2500 4500
Connection ~ 2500 4500
$Comp
L C C202
U 1 1 58E778BA
P 1550 4250
F 0 "C202" H 1575 4350 50  0000 L CNN
F 1 "0,1uF" H 1575 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1588 4100 50  0001 C CNN
F 3 "" H 1550 4250 50  0001 C CNN
	1    1550 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3900 1550 4100
Connection ~ 1800 3900
Wire Wire Line
	1550 4500 1550 4400
Connection ~ 1800 4500
$Comp
L CP C212
U 1 1 58E781DF
P 3150 4900
F 0 "C212" V 2900 4850 50  0000 L CNN
F 1 "10uF" V 3000 4850 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3188 4750 50  0001 C CNN
F 3 "" H 3150 4900 50  0001 C CNN
	1    3150 4900
	0    1    1    0   
$EndComp
Connection ~ 3450 4900
Wire Wire Line
	3000 4900 2850 4900
Wire Wire Line
	2850 4900 2850 4500
Connection ~ 2850 4500
$Comp
L CP C201
U 1 1 58E785F3
P 1300 4250
F 0 "C201" H 1325 4350 50  0000 L CNN
F 1 "10uF" H 1325 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 1338 4100 50  0001 C CNN
F 3 "" H 1300 4250 50  0001 C CNN
	1    1300 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3900 1300 4100
Connection ~ 1550 3900
Wire Wire Line
	1300 4500 1300 4400
Connection ~ 1550 4500
NoConn ~ 2750 2050
NoConn ~ 2750 2850
NoConn ~ 6200 1950
NoConn ~ 4650 5100
NoConn ~ 4650 5200
NoConn ~ 4650 5800
NoConn ~ 3550 6300
NoConn ~ 3550 6400
NoConn ~ 3550 6500
Wire Wire Line
	2050 1950 2750 1950
NoConn ~ 4650 6000
$Comp
L R R?
U 1 1 58EBF88E
P 2400 1150
F 0 "R?" V 2480 1150 50  0000 C CNN
F 1 "10k" V 2400 1150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2330 1150 50  0001 C CNN
F 3 "" H 2400 1150 50  0001 C CNN
	1    2400 1150
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58EBF9E7
P 2400 1850
F 0 "R?" V 2480 1850 50  0000 C CNN
F 1 "10k" V 2400 1850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2330 1850 50  0001 C CNN
F 3 "" H 2400 1850 50  0001 C CNN
	1    2400 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 1850 2650 1850
Connection ~ 2650 1850
Wire Wire Line
	2550 1150 2650 1150
Connection ~ 2650 1150
Wire Wire Line
	2250 1150 2150 1150
Wire Wire Line
	2150 1150 2150 1250
Connection ~ 2150 1250
Wire Wire Line
	2250 1850 2150 1850
Wire Wire Line
	2150 1850 2150 1750
Connection ~ 2150 1750
$EndSCHEMATC
