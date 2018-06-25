EESchema Schematic File Version 2
LIBS:Titan67j60-rescue
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
LIBS:Titan67j60-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L CONN_01X03 J20
U 1 1 5966FBBF
P 1400 2250
F 0 "J20" H 1400 2450 50  0000 C CNN
F 1 "CONN_01X03" H 1200 2550 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MSTBVA-G_03x5.08mm_Vertical" H 1400 2250 50  0001 C CNN
F 3 "" H 1400 2250 50  0001 C CNN
	1    1400 2250
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 J21
U 1 1 596644C6
P 1400 2700
F 0 "J21" H 1400 2900 50  0000 C CNN
F 1 "CONN_01X03" H 1200 2450 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MSTBVA-G_03x5.08mm_Vertical" H 1400 2700 50  0001 C CNN
F 3 "" H 1400 2700 50  0001 C CNN
	1    1400 2700
	-1   0    0    -1  
$EndComp
$Comp
L ATTINY20-SSU U12
U 1 1 59660BAB
P 6550 2300
F 0 "U12" H 5600 3050 50  0000 C CNN
F 1 "ATTINY20-SSU" H 7350 1550 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-14_3.9x8.7mm_Pitch1.27mm" H 6550 2400 50  0001 C CIN
F 3 "" H 6550 2300 50  0001 C CNN
	1    6550 2300
	-1   0    0    -1  
$EndComp
$Comp
L Fuse_Small F1
U 1 1 59660D94
P 1800 1200
F 0 "F1" H 1800 1350 50  0000 C CNN
F 1 "5A" H 1800 1260 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_inline_Type-I" H 1800 1200 50  0001 C CNN
F 3 "" H 1800 1200 50  0001 C CNN
	1    1800 1200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 J19
U 1 1 59660F69
P 1400 1300
F 0 "J19" H 1400 1500 50  0000 C CNN
F 1 "CONN_01X03" V 1500 1300 50  0000 C CNN
F 2 "Connectors_Phoenix:PhoenixContact_MSTBVA-G_03x5.08mm_Vertical" H 1400 1300 50  0001 C CNN
F 3 "" H 1400 1300 50  0001 C CNN
	1    1400 1300
	-1   0    0    -1  
$EndComp
$Comp
L R_Small R56
U 1 1 5966179E
P 2500 1900
F 0 "R56" V 2300 1750 50  0000 L CNN
F 1 "91k" V 2400 1750 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 2500 1900 50  0001 C CNN
F 3 "" H 2500 1900 50  0001 C CNN
	1    2500 1900
	0    1    1    0   
$EndComp
$Comp
L C_Small C21
U 1 1 596617B2
P 8750 2300
F 0 "C21" H 8760 2370 50  0000 L CNN
F 1 "22,0" H 8760 2220 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8750 2300 50  0001 C CNN
F 3 "" H 8750 2300 50  0001 C CNN
	1    8750 2300
	1    0    0    -1  
$EndComp
$Comp
L R_Small R60
U 1 1 59661C31
P 2800 1900
F 0 "R60" V 2600 1750 50  0000 L CNN
F 1 "91k" V 2700 1750 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 2800 1900 50  0001 C CNN
F 3 "" H 2800 1900 50  0001 C CNN
	1    2800 1900
	0    1    1    0   
$EndComp
$Comp
L R_Small R57
U 1 1 59661C6B
P 2500 2250
F 0 "R57" V 2300 2100 50  0000 L CNN
F 1 "1M1%" V 2400 2100 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 2500 2250 50  0001 C CNN
F 3 "" H 2500 2250 50  0001 C CNN
	1    2500 2250
	0    1    1    0   
$EndComp
$Comp
L R_Small R61
U 1 1 59661D18
P 2800 2250
F 0 "R61" V 2600 2100 50  0000 L CNN
F 1 "1M1%" V 2700 2100 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 2800 2250 50  0001 C CNN
F 3 "" H 2800 2250 50  0001 C CNN
	1    2800 2250
	0    1    1    0   
$EndComp
$Comp
L R_Small R58
U 1 1 59661FD0
P 2500 2600
F 0 "R58" V 2300 2450 50  0000 L CNN
F 1 "160k" V 2400 2450 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 2500 2600 50  0001 C CNN
F 3 "" H 2500 2600 50  0001 C CNN
	1    2500 2600
	0    1    1    0   
$EndComp
$Comp
L R_Small R62
U 1 1 59662042
P 2800 2600
F 0 "R62" V 2600 2450 50  0000 L CNN
F 1 "160k" V 2700 2450 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 2800 2600 50  0001 C CNN
F 3 "" H 2800 2600 50  0001 C CNN
	1    2800 2600
	0    1    1    0   
$EndComp
Text GLabel 5200 900  2    60   Input ~ 0
FaultOpt1
$Comp
L CONN_01X04 J22
U 1 1 59661C64
P 3600 3850
F 0 "J22" H 3600 4100 50  0000 C CNN
F 1 "CONN_01X04" V 3700 3850 50  0000 C CNN
F 2 "LehmanKiPatterns:Connector_04x3.96mm" H 3600 3850 50  0001 C CNN
F 3 "" H 3600 3850 50  0001 C CNN
	1    3600 3850
	1    0    0    -1  
$EndComp
$Comp
L R_Small R55
U 1 1 5966222A
P 2500 1600
F 0 "R55" V 2300 1450 50  0000 L CNN
F 1 "1M1%" V 2400 1450 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 2500 1600 50  0001 C CNN
F 3 "" H 2500 1600 50  0001 C CNN
	1    2500 1600
	0    1    1    0   
$EndComp
$Comp
L R_Small R59
U 1 1 5966228F
P 2800 1600
F 0 "R59" V 2600 1450 50  0000 L CNN
F 1 "1M1%" V 2700 1450 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 2800 1600 50  0001 C CNN
F 3 "" H 2800 1600 50  0001 C CNN
	1    2800 1600
	0    1    1    0   
$EndComp
$Comp
L GNDPWR #PWR059
U 1 1 596622DD
P 1650 1650
F 0 "#PWR059" H 1650 1450 50  0001 C CNN
F 1 "GNDPWR" H 1650 1520 50  0000 C CNN
F 2 "" H 1650 1600 50  0001 C CNN
F 3 "" H 1650 1600 50  0001 C CNN
	1    1650 1650
	1    0    0    -1  
$EndComp
Text GLabel 2900 2850 0    60   Input ~ 0
FaultOpt2
$Comp
L CONN_01X03 J23
U 1 1 596634CB
P 3600 5400
F 0 "J23" H 3600 5600 50  0000 C CNN
F 1 "CONN_01X03" V 3700 5400 50  0000 C CNN
F 2 "LehmanKiPatterns:Connector_03x3.96mm" H 3600 5400 50  0001 C CNN
F 3 "" H 3600 5400 50  0001 C CNN
	1    3600 5400
	1    0    0    -1  
$EndComp
Text GLabel 5200 1050 2    60   Input ~ 0
N
$Comp
L GNDPWR #PWR060
U 1 1 59664D3E
P 3300 7200
F 0 "#PWR060" H 3300 7000 50  0001 C CNN
F 1 "GNDPWR" H 3300 7070 50  0000 C CNN
F 2 "" H 3300 7150 50  0001 C CNN
F 3 "" H 3300 7150 50  0001 C CNN
	1    3300 7200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 J24
U 1 1 59665175
P 3600 6200
F 0 "J24" H 3600 6400 50  0000 C CNN
F 1 "CONN_01X03" V 3700 6200 50  0000 C CNN
F 2 "LehmanKiPatterns:Connector_03x3.96mm" H 3600 6200 50  0001 C CNN
F 3 "" H 3600 6200 50  0001 C CNN
	1    3600 6200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 J25
U 1 1 596651FA
P 3600 7000
F 0 "J25" H 3600 7200 50  0000 C CNN
F 1 "CONN_01X03" V 3700 7000 50  0000 C CNN
F 2 "LehmanKiPatterns:Connector_03x3.96mm" H 3600 7000 50  0001 C CNN
F 3 "" H 3600 7000 50  0001 C CNN
	1    3600 7000
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR061
U 1 1 59665CEB
P 2200 3150
F 0 "#PWR061" H 2200 3000 50  0001 C CNN
F 1 "+24V" H 2200 3290 50  0000 C CNN
F 2 "" H 2200 3150 50  0001 C CNN
F 3 "" H 2200 3150 50  0001 C CNN
	1    2200 3150
	1    0    0    -1  
$EndComp
Text GLabel 1850 3500 0    60   Input ~ 0
RelayEV1
Text GLabel 1850 4300 0    60   Input ~ 0
RelayEV2
Text GLabel 1850 5100 0    60   Input ~ 0
RelayMotor1
Text GLabel 1850 5900 0    60   Input ~ 0
RelayMotor2
Text GLabel 1850 6700 0    60   Input ~ 0
RelayMotor3
$Comp
L CONN_01X03 J27
U 1 1 596671EB
P 4400 6200
F 0 "J27" H 4400 6400 50  0000 C CNN
F 1 "CONN_01X03" V 4500 6200 50  0000 C CNN
F 2 "LehmanKiPatterns:Connector_03x3.96mm" H 4400 6200 50  0001 C CNN
F 3 "" H 4400 6200 50  0001 C CNN
	1    4400 6200
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 J28
U 1 1 596675F8
P 4400 7000
F 0 "J28" H 4400 7200 50  0000 C CNN
F 1 "CONN_01X03" V 4500 7000 50  0000 C CNN
F 2 "LehmanKiPatterns:Connector_03x3.96mm" H 4400 7000 50  0001 C CNN
F 3 "" H 4400 7000 50  0001 C CNN
	1    4400 7000
	-1   0    0    -1  
$EndComp
$Comp
L +24V #PWR062
U 1 1 59667AF6
P 5900 5600
F 0 "#PWR062" H 5900 5450 50  0001 C CNN
F 1 "+24V" H 6000 5750 50  0000 C CNN
F 2 "" H 5900 5600 50  0001 C CNN
F 3 "" H 5900 5600 50  0001 C CNN
	1    5900 5600
	1    0    0    -1  
$EndComp
Text GLabel 6000 5900 2    60   Input ~ 0
RelayMotor4
Text GLabel 6000 6700 2    60   Input ~ 0
RelayMotor5
$Comp
L TLV733P U13
U 1 1 59668E65
P 8750 3600
F 0 "U13" H 8750 4025 50  0000 C CNN
F 1 "TLV73333PDBV" H 8750 3950 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 8750 4100 50  0001 C CNN
F 3 "" H 8700 3900 50  0001 C CNN
	1    8750 3600
	1    0    0    -1  
$EndComp
$Comp
L D_x2_Serial_AKC D11
U 1 1 59669703
P 9350 2250
F 0 "D11" V 9650 2350 50  0000 C CNN
F 1 "BAV99" V 9100 2050 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9350 2250 50  0001 C CNN
F 3 "" H 9350 2250 50  0001 C CNN
	1    9350 2250
	0    -1   -1   0   
$EndComp
$Comp
L D_Schottky_x2_Serial_AKC D7
U 1 1 59669AB6
P 7800 2250
F 0 "D7" V 7600 2100 50  0000 C CNN
F 1 "BAT54S" V 7500 2050 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 7800 2250 50  0001 C CNN
F 3 "" H 7800 2250 50  0001 C CNN
	1    7800 2250
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C20
U 1 1 59669D1A
P 8500 2300
F 0 "C20" H 8510 2370 50  0000 L CNN
F 1 "0,1" H 8510 2220 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 8500 2300 50  0001 C CNN
F 3 "" H 8500 2300 50  0001 C CNN
	1    8500 2300
	1    0    0    -1  
$EndComp
$Comp
L D_Zener D10
U 1 1 5966A15D
P 9050 2250
F 0 "D10" V 8900 2150 50  0000 C CNN
F 1 "BZX84-C5V6" H 9350 2350 50  0000 C CNN
F 2 "Diodes_SMD:D_SOT-23_ANK" H 9050 2250 50  0001 C CNN
F 3 "" H 9050 2250 50  0001 C CNN
	1    9050 2250
	0    1    1    0   
$EndComp
NoConn ~ 9150 3800
$Comp
L R_Small R64
U 1 1 5966DDE6
P 3800 1650
F 0 "R64" V 3700 1400 50  0000 L CNN
F 1 "20k1%" V 3700 1550 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 3800 1650 50  0001 C CNN
F 3 "" H 3800 1650 50  0001 C CNN
	1    3800 1650
	1    0    0    -1  
$EndComp
$Comp
L R_Small R63
U 1 1 5966E1B6
P 3600 1650
F 0 "R63" V 3500 1400 50  0000 L CNN
F 1 "20k1%" V 3500 1550 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 3600 1650 50  0001 C CNN
F 3 "" H 3600 1650 50  0001 C CNN
	1    3600 1650
	1    0    0    -1  
$EndComp
$Comp
L Transformer_1P_1S T1
U 1 1 5966E908
P 9700 4750
F 0 "T1" H 9700 5000 50  0000 C CNN
F 1 "Transformer_spark_1" H 9700 4450 50  0000 C CNN
F 2 "LehmanKiPatterns:Transformer_spark_1" H 9700 4750 50  0001 C CNN
F 3 "" H 9700 4750 50  0001 C CNN
	1    9700 4750
	1    0    0    -1  
$EndComp
$Comp
L R_Small R66
U 1 1 5966EF81
P 4100 2700
F 0 "R66" V 4300 2600 50  0000 L CNN
F 1 "1k" V 4200 2650 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 4100 2700 50  0001 C CNN
F 3 "" H 4100 2700 50  0001 C CNN
	1    4100 2700
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R65
U 1 1 5966F22F
P 4000 1650
F 0 "R65" H 4050 1700 50  0000 L CNN
F 1 "1k" H 4100 1600 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 4000 1650 50  0001 C CNN
F 3 "" H 4000 1650 50  0001 C CNN
	1    4000 1650
	1    0    0    -1  
$EndComp
Text GLabel 3900 2500 0    60   Input ~ 0
ComOpto+
Text GLabel 7800 3250 0    60   Input ~ 0
ComOpto-
Text GLabel 3900 2700 0    60   Input ~ 0
DataOpto1
Text GLabel 7800 3450 0    60   Input ~ 0
DataOpto2
$Comp
L Varistor RV1
U 1 1 59673B90
P 2500 1050
F 0 "RV1" V 2625 1050 50  0000 C CNN
F 1 "Varistor" V 2375 1050 50  0000 C CNN
F 2 "" V 2430 1050 50  0001 C CNN
F 3 "" H 2500 1050 50  0001 C CNN
	1    2500 1050
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R68
U 1 1 59674812
P 4900 5150
F 0 "R68" V 4700 5000 50  0000 L CNN
F 1 "1M1%" V 4800 5000 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 4900 5150 50  0001 C CNN
F 3 "" H 4900 5150 50  0001 C CNN
	1    4900 5150
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R70
U 1 1 59674938
P 5200 5150
F 0 "R70" V 5000 5000 50  0000 L CNN
F 1 "1M1%" V 5100 5000 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 5200 5150 50  0001 C CNN
F 3 "" H 5200 5150 50  0001 C CNN
	1    5200 5150
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C18
U 1 1 59674C93
P 5550 5150
F 0 "C18" V 5800 5100 50  0000 L CNN
F 1 "2200x2kV" V 5700 4850 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D10.5mm_W5.0mm_P10.00mm" H 5550 5150 50  0001 C CNN
F 3 "" H 5550 5150 50  0001 C CNN
	1    5550 5150
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C17
U 1 1 596753D7
P 4450 1700
F 0 "C17" H 4250 1800 50  0000 L CNN
F 1 "0,1" H 4300 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4450 1700 50  0001 C CNN
F 3 "" H 4450 1700 50  0001 C CNN
	1    4450 1700
	1    0    0    -1  
$EndComp
$Comp
L R_Small R69
U 1 1 596756AA
P 5200 4850
F 0 "R69" V 5000 4700 50  0000 L CNN
F 1 "5M1" V 5100 4700 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 5200 4850 50  0001 C CNN
F 3 "" H 5200 4850 50  0001 C CNN
	1    5200 4850
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R67
U 1 1 59675746
P 4900 4850
F 0 "R67" V 4700 4700 50  0000 L CNN
F 1 "5M1" V 4800 4700 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 4900 4850 50  0001 C CNN
F 3 "" H 4900 4850 50  0001 C CNN
	1    4900 4850
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 J26
U 1 1 596757BE
P 4400 4850
F 0 "J26" H 4400 4950 50  0000 C CNN
F 1 "CONN_01X01" H 4400 4750 50  0000 C CNN
F 2 "Connectors:1pin" H 4400 4850 50  0001 C CNN
F 3 "" H 4400 4850 50  0001 C CNN
	1    4400 4850
	-1   0    0    1   
$EndComp
$Comp
L C_Small C23
U 1 1 59678F65
P 9350 1500
F 0 "C23" H 9100 1500 50  0000 L CNN
F 1 "0,047" H 9050 1400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 9350 1500 50  0001 C CNN
F 3 "" H 9350 1500 50  0001 C CNN
	1    9350 1500
	1    0    0    -1  
$EndComp
$Comp
L D D6
U 1 1 5969359B
P 7750 4250
F 0 "D6" H 7750 4150 50  0000 C CNN
F 1 "S1M" H 7750 4400 50  0000 C CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 7750 4250 50  0001 C CNN
F 3 "" H 7750 4250 50  0001 C CNN
	1    7750 4250
	-1   0    0    1   
$EndComp
$Comp
L R_Small R73
U 1 1 596936A4
P 7900 5450
F 0 "R73" H 8000 5400 50  0000 L CNN
F 1 "100k" H 8000 5500 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 7900 5450 50  0001 C CNN
F 3 "" H 7900 5450 50  0001 C CNN
	1    7900 5450
	-1   0    0    1   
$EndComp
$Comp
L R_Small R74
U 1 1 59693C53
P 8000 4550
F 0 "R74" H 8150 4550 50  0000 L CNN
F 1 "100k" H 8100 4650 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 8000 4550 50  0001 C CNN
F 3 "" H 8000 4550 50  0001 C CNN
	1    8000 4550
	-1   0    0    1   
$EndComp
$Comp
L C_Small C19
U 1 1 59693D09
P 8000 4900
F 0 "C19" H 8100 4900 50  0000 L CNN
F 1 "0,01" H 8100 4800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 8000 4900 50  0001 C CNN
F 3 "" H 8000 4900 50  0001 C CNN
	1    8000 4900
	1    0    0    -1  
$EndComp
$Comp
L BC857 Q17
U 1 1 59693EEA
P 8300 5600
F 0 "Q17" H 8150 5450 50  0000 L CNN
F 1 "BC857" H 8500 5500 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 8500 5525 50  0001 L CIN
F 3 "" H 8300 5600 50  0001 L CNN
	1    8300 5600
	1    0    0    1   
$EndComp
$Comp
L R_Small R75
U 1 1 59694000
P 7850 4900
F 0 "R75" H 7650 4950 50  0000 L CNN
F 1 "24k" H 7650 4850 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7850 4900 50  0001 C CNN
F 3 "" H 7850 4900 50  0001 C CNN
	1    7850 4900
	1    0    0    -1  
$EndComp
$Comp
L R_Small R77
U 1 1 5969413A
P 8050 5800
F 0 "R77" H 7800 5850 50  0000 L CNN
F 1 "200k" H 7800 5750 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 8050 5800 50  0001 C CNN
F 3 "" H 8050 5800 50  0001 C CNN
	1    8050 5800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R79
U 1 1 596942F8
P 8400 4900
F 0 "R79" H 8250 4800 50  0000 L CNN
F 1 "3k6" H 8200 4900 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 8400 4900 50  0001 C CNN
F 3 "" H 8400 4900 50  0001 C CNN
	1    8400 4900
	-1   0    0    1   
$EndComp
$Comp
L R_Small R78
U 1 1 596943D4
P 8050 4250
F 0 "R78" V 8150 4300 50  0000 L CNN
F 1 "1k5" V 8150 4150 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 8050 4250 50  0001 C CNN
F 3 "" H 8050 4250 50  0001 C CNN
	1    8050 4250
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R71
U 1 1 5969463E
P 8700 5950
F 0 "R71" H 8300 5950 50  0000 L CNN
F 1 "10k" H 8500 5900 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 8700 5950 50  0001 C CNN
F 3 "" H 8700 5950 50  0001 C CNN
	1    8700 5950
	1    0    0    -1  
$EndComp
$Comp
L R_Small R72
U 1 1 5969472F
P 8550 5800
F 0 "R72" V 8350 5750 50  0000 L CNN
F 1 "15k" V 8450 5750 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 8550 5800 50  0001 C CNN
F 3 "" H 8550 5800 50  0001 C CNN
	1    8550 5800
	0    1    1    0   
$EndComp
$Comp
L Q_Thyristor_KAG D8
U 1 1 59694959
P 8600 4600
F 0 "D8" H 8650 4850 50  0000 L CNN
F 1 "BT150S-600R" V 8750 4250 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TO-252-3_TabPin2" V 8600 4600 50  0001 C CNN
F 3 "" V 8600 4600 50  0001 C CNN
	1    8600 4600
	1    0    0    -1  
$EndComp
$Comp
L D D9
U 1 1 59694C0B
P 8900 4700
F 0 "D9" V 8950 4850 50  0000 C CNN
F 1 "BA158" V 9050 4850 50  0000 C CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 8900 4700 50  0001 C CNN
F 3 "" H 8900 4700 50  0001 C CNN
	1    8900 4700
	0    1    1    0   
$EndComp
$Comp
L C_Small C22
U 1 1 5969502D
P 9100 4400
F 0 "C22" V 8850 4350 50  0000 L CNN
F 1 "1uFx400V" V 8950 4350 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L24.0mm_W10.1mm_P22.50mm_MKT" H 9100 4400 50  0001 C CNN
F 3 "" H 9100 4400 50  0001 C CNN
	1    9100 4400
	0    1    1    0   
$EndComp
$Comp
L GNDPWR #PWR063
U 1 1 59698629
P 10200 5250
F 0 "#PWR063" H 10200 5050 50  0001 C CNN
F 1 "GNDPWR" H 10200 5120 50  0000 C CNN
F 2 "" H 10200 5200 50  0001 C CNN
F 3 "" H 10200 5200 50  0001 C CNN
	1    10200 5250
	1    0    0    -1  
$EndComp
Text GLabel 8400 6100 0    60   Input ~ 0
N
$Comp
L PWR_FLAG #FLG064
U 1 1 59AAA2C6
P 10200 4900
F 0 "#FLG064" H 10200 4975 50  0001 C CNN
F 1 "PWR_FLAG" H 10200 5050 50  0000 C CNN
F 2 "" H 10200 4900 50  0001 C CNN
F 3 "" H 10200 4900 50  0001 C CNN
	1    10200 4900
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG065
U 1 1 59AAABF7
P 8900 1550
F 0 "#FLG065" H 8900 1625 50  0001 C CNN
F 1 "PWR_FLAG" H 8900 1700 50  0000 C CNN
F 2 "" H 8900 1550 50  0001 C CNN
F 3 "" H 8900 1550 50  0001 C CNN
	1    8900 1550
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG066
U 1 1 59AAACC9
P 9750 2800
F 0 "#FLG066" H 9750 2875 50  0001 C CNN
F 1 "PWR_FLAG" H 9750 2950 50  0000 C CNN
F 2 "" H 9750 2800 50  0001 C CNN
F 3 "" H 9750 2800 50  0001 C CNN
	1    9750 2800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 J31
U 1 1 59AAC3A3
P 3600 3200
F 0 "J31" H 3600 3500 50  0000 C CNN
F 1 "CONN_01X05" V 3700 3200 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-05_05x2.54mm_Straight" H 3600 3200 50  0001 C CNN
F 3 "" H 3600 3200 50  0001 C CNN
	1    3600 3200
	-1   0    0    -1  
$EndComp
Text Label 8200 1400 0    60   ~ 0
ATplus
Text Label 3850 3100 0    60   ~ 0
ATplus
Text Label 3850 3300 0    60   ~ 0
ATreset
Text Label 5000 2900 0    60   ~ 0
ATreset
Text Label 5000 2600 0    60   ~ 0
ATtpiC
Text Label 3850 3000 0    60   ~ 0
ATtpiC
Text Label 5000 2700 0    60   ~ 0
ATtpiD
Text Label 3850 3200 0    60   ~ 0
ATtpiD
Text GLabel 2250 750  2    60   Input ~ 0
LPwrSup
$Comp
L DIAC D17
U 1 1 59B26019
P 8200 4700
F 0 "D17" H 8200 4450 50  0000 C CNN
F 1 "DB3" H 8200 4550 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P10.16mm_Horizontal" H 8200 4700 50  0001 C CNN
F 3 "" H 8200 4700 50  0001 C CNN
	1    8200 4700
	-1   0    0    1   
$EndComp
$Comp
L R_Small R96
U 1 1 59B2AC49
P 8900 5350
F 0 "R96" H 8750 5250 50  0000 L CNN
F 1 "1k5" H 8700 5350 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 8900 5350 50  0001 C CNN
F 3 "" H 8900 5350 50  0001 C CNN
	1    8900 5350
	-1   0    0    1   
$EndComp
$Comp
L Q_Thyristor_KAG D19
U 1 1 59B2AD76
P 8900 5700
F 0 "D19" H 9050 5600 50  0000 L CNN
F 1 "BT149G" H 8950 5500 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Wide_Oval_Reverse" V 8900 5700 50  0001 C CNN
F 3 "" V 8900 5700 50  0001 C CNN
	1    8900 5700
	1    0    0    -1  
$EndComp
NoConn ~ 10100 4550
NoConn ~ 10100 4950
Text Label 1400 3150 0    60   ~ 0
ThermOk
Text Label 7250 4250 0    60   ~ 0
ThermOk
$Comp
L D D5
U 1 1 59B34194
P 4100 5300
F 0 "D5" V 4150 5450 50  0000 C CNN
F 1 "P6KE350CA" V 4250 5600 50  0000 C CNN
F 2 "Diodes_THT:D_DO-15_P12.70mm_Horizontal" H 4100 5300 50  0001 C CNN
F 3 "" H 4100 5300 50  0001 C CNN
	1    4100 5300
	0    1    1    0   
$EndComp
$Comp
L GNDPWR #PWR067
U 1 1 59B34324
P 4100 5500
F 0 "#PWR067" H 4100 5300 50  0001 C CNN
F 1 "GNDPWR" H 4100 5370 50  0000 C CNN
F 2 "" H 4100 5450 50  0001 C CNN
F 3 "" H 4100 5450 50  0001 C CNN
	1    4100 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1200 1700 1200
Wire Wire Line
	1900 1200 1950 1200
Wire Wire Line
	1950 1050 1950 7450
Wire Wire Line
	1950 2350 1600 2350
Wire Wire Line
	1600 2250 2400 2250
Wire Wire Line
	1850 2250 1850 2800
Wire Wire Line
	1850 2800 1600 2800
Wire Wire Line
	1600 2700 2050 2700
Wire Wire Line
	1600 1300 9650 1300
Wire Wire Line
	1600 2600 2400 2600
Wire Wire Line
	1750 2600 1750 2150
Wire Wire Line
	1750 2150 1600 2150
Connection ~ 1850 2250
Wire Wire Line
	2400 1900 1950 1900
Connection ~ 1950 1900
Wire Wire Line
	2600 1900 2700 1900
Wire Wire Line
	2600 2250 2700 2250
Connection ~ 1750 2600
Wire Wire Line
	2600 2600 2700 2600
Wire Wire Line
	5050 900  5050 1300
Wire Wire Line
	5050 900  5200 900 
Wire Wire Line
	2050 2700 2050 4400
Wire Wire Line
	2050 3600 2300 3600
Wire Wire Line
	2050 4400 2300 4400
Connection ~ 2050 3600
Wire Wire Line
	3200 1300 3200 7000
Wire Wire Line
	3200 3800 3400 3800
Wire Wire Line
	3000 3700 3400 3700
Wire Wire Line
	3000 4500 3100 4500
Wire Wire Line
	3100 4500 3100 3900
Wire Wire Line
	3100 3900 3400 3900
Wire Wire Line
	1600 1400 1650 1400
Wire Wire Line
	1650 1400 1650 1650
Wire Wire Line
	2400 1600 1650 1600
Connection ~ 1650 1600
Wire Wire Line
	2600 1600 2700 1600
Wire Wire Line
	2900 2600 3000 2600
Wire Wire Line
	3000 2600 3000 2850
Wire Wire Line
	3000 2850 2900 2850
Wire Wire Line
	5200 1050 5050 1050
Connection ~ 5050 1050
Connection ~ 1950 1200
Wire Wire Line
	1950 5200 2300 5200
Connection ~ 1950 2350
Wire Wire Line
	1950 6800 2300 6800
Connection ~ 1950 5200
Wire Wire Line
	2300 6000 1950 6000
Connection ~ 1950 6000
Wire Wire Line
	3200 5400 3400 5400
Connection ~ 3200 3800
Wire Wire Line
	3400 4000 3300 4000
Wire Wire Line
	3300 4000 3300 7200
Wire Wire Line
	3300 5500 3400 5500
Wire Wire Line
	3000 5300 3400 5300
Wire Wire Line
	3000 6100 3400 6100
Wire Wire Line
	3000 6900 3400 6900
Wire Wire Line
	3300 7100 3400 7100
Connection ~ 3300 5500
Wire Wire Line
	3400 6300 3300 6300
Connection ~ 3300 6300
Wire Wire Line
	3200 7000 3400 7000
Connection ~ 3200 5400
Wire Wire Line
	3400 6200 3200 6200
Connection ~ 3200 6200
Connection ~ 3300 7100
Wire Wire Line
	2150 3250 2300 3250
Wire Wire Line
	2150 3250 2150 6450
Wire Wire Line
	2150 6450 2300 6450
Wire Wire Line
	2300 5650 2150 5650
Connection ~ 2150 5650
Wire Wire Line
	2300 4850 2150 4850
Connection ~ 2150 4850
Wire Wire Line
	2300 4050 2150 4050
Connection ~ 2150 4050
Wire Wire Line
	2200 3150 2200 3250
Connection ~ 2200 3250
Wire Wire Line
	2300 3500 1850 3500
Wire Wire Line
	2300 4300 1850 4300
Wire Wire Line
	1850 5100 2300 5100
Wire Wire Line
	1850 5900 2300 5900
Wire Wire Line
	1850 6700 2300 6700
Wire Wire Line
	5000 6100 4600 6100
Wire Wire Line
	5000 6900 4600 6900
Wire Wire Line
	4800 7000 4600 7000
Wire Wire Line
	4800 5700 4800 7000
Wire Wire Line
	4800 5700 3200 5700
Connection ~ 3200 5700
Wire Wire Line
	4700 7100 4600 7100
Wire Wire Line
	4700 5800 4700 7100
Wire Wire Line
	4700 5800 3300 5800
Connection ~ 3300 5800
Wire Wire Line
	4600 6300 4700 6300
Connection ~ 4700 6300
Wire Wire Line
	4600 6200 4800 6200
Connection ~ 4800 6200
Wire Wire Line
	1950 7450 5800 7450
Wire Wire Line
	5800 7450 5800 5150
Wire Wire Line
	5800 6000 5700 6000
Connection ~ 1950 6800
Wire Wire Line
	5700 6800 5800 6800
Connection ~ 5800 6800
Wire Wire Line
	5700 5650 5900 5650
Wire Wire Line
	5900 5600 5900 6450
Wire Wire Line
	5900 6450 5700 6450
Connection ~ 5900 5650
Wire Wire Line
	5700 5900 6000 5900
Wire Wire Line
	5700 6700 6000 6700
Wire Wire Line
	7700 1700 9350 1700
Wire Wire Line
	9350 1600 9350 1950
Wire Wire Line
	8750 2200 8750 1700
Connection ~ 8750 1700
Wire Wire Line
	8500 2200 8500 1700
Connection ~ 8500 1700
Wire Wire Line
	9350 2900 9350 2550
Wire Wire Line
	7700 2900 9750 2900
Wire Wire Line
	8750 2400 8750 2900
Connection ~ 8750 2900
Wire Wire Line
	8500 2400 8500 2900
Connection ~ 8500 2900
Wire Wire Line
	9050 2100 9050 1700
Connection ~ 9050 1700
Wire Wire Line
	9050 2400 9050 2900
Connection ~ 9050 2900
Wire Wire Line
	9650 1300 9650 2250
Wire Wire Line
	9650 2250 9550 2250
Connection ~ 3200 1300
Wire Wire Line
	7800 1950 7800 1700
Connection ~ 7800 1700
Wire Wire Line
	7800 2550 7800 2900
Connection ~ 7800 2900
Wire Wire Line
	3050 1900 2900 1900
Wire Wire Line
	8000 2250 8050 2250
Wire Wire Line
	8050 2250 8050 1500
Wire Wire Line
	8050 1500 3050 1500
Wire Wire Line
	4200 3600 8350 3600
Wire Wire Line
	7900 2900 7900 3600
Connection ~ 7900 2900
Wire Wire Line
	8250 3400 8350 3400
Connection ~ 8250 1700
Connection ~ 8250 3400
Wire Wire Line
	9150 3400 9200 3400
Wire Wire Line
	9200 3400 9200 3100
Wire Wire Line
	9200 3100 4850 3100
Wire Wire Line
	4850 1800 5400 1800
Wire Wire Line
	2900 1600 3400 1600
Wire Wire Line
	3400 1600 3400 1900
Wire Wire Line
	3400 1900 5400 1900
Wire Wire Line
	3400 2000 5400 2000
Wire Wire Line
	4850 3100 4850 1800
Wire Wire Line
	7900 1400 7900 1700
Wire Wire Line
	3600 1400 8500 1400
Connection ~ 7900 1700
Wire Wire Line
	3050 1500 3050 1900
Wire Wire Line
	3400 2000 3400 2250
Wire Wire Line
	3400 2250 2900 2250
Wire Wire Line
	3600 1400 3600 1550
Wire Wire Line
	3800 1550 3800 1400
Connection ~ 3800 1400
Wire Wire Line
	4000 1550 4000 1400
Connection ~ 4000 1400
Wire Wire Line
	3600 1750 3600 1900
Connection ~ 3600 1900
Wire Wire Line
	3800 1750 3800 2000
Connection ~ 3800 2000
Wire Wire Line
	4000 1750 4000 2500
Wire Wire Line
	4000 2500 3900 2500
Wire Wire Line
	7800 3250 7900 3250
Connection ~ 7900 3250
Wire Wire Line
	7800 3450 7900 3450
Connection ~ 7900 3450
Connection ~ 5050 1300
Wire Wire Line
	2350 1050 1950 1050
Wire Wire Line
	2650 1050 3050 1050
Wire Wire Line
	3050 1050 3050 1300
Connection ~ 3050 1300
Wire Wire Line
	4450 1600 4450 1400
Connection ~ 4450 1400
Wire Wire Line
	4450 1800 4450 4600
Wire Wire Line
	4650 5150 4800 5150
Wire Wire Line
	4600 4850 4800 4850
Wire Wire Line
	4700 4850 4700 5150
Connection ~ 4700 4850
Wire Wire Line
	5000 5150 5100 5150
Wire Wire Line
	5000 4850 5100 4850
Wire Wire Line
	5300 5150 5450 5150
Wire Wire Line
	5800 5150 5650 5150
Connection ~ 5800 6000
Wire Wire Line
	4450 4600 5400 4600
Wire Wire Line
	5400 4600 5400 4850
Wire Wire Line
	5400 4850 5300 4850
Wire Wire Line
	9350 1400 9350 1300
Connection ~ 9350 1300
Connection ~ 9350 1700
Wire Wire Line
	7250 4250 7600 4250
Wire Wire Line
	9200 4400 9250 4400
Wire Wire Line
	9250 4400 9250 4550
Wire Wire Line
	9250 4550 9300 4550
Wire Wire Line
	8900 4950 9300 4950
Wire Wire Line
	9250 4950 9250 5150
Wire Wire Line
	10200 4900 10200 5250
Wire Wire Line
	8600 4400 8600 4450
Wire Wire Line
	8000 4400 9000 4400
Connection ~ 8600 4400
Wire Wire Line
	8900 4550 8900 4400
Connection ~ 8900 4400
Connection ~ 7900 3600
Wire Wire Line
	6850 6000 6850 3200
Wire Wire Line
	6850 3200 4650 3200
Wire Wire Line
	9750 2900 9750 2800
Connection ~ 9350 2900
Wire Wire Line
	8900 1550 8900 1700
Connection ~ 8900 1700
Wire Wire Line
	4650 2700 5400 2700
Wire Wire Line
	5400 2900 5000 2900
Connection ~ 7900 1400
Wire Wire Line
	3800 3000 4200 3000
Wire Wire Line
	3800 3100 4200 3100
Wire Wire Line
	3800 3200 4200 3200
Wire Wire Line
	3800 3300 4200 3300
Wire Wire Line
	3800 3400 4200 3400
Wire Wire Line
	4200 3400 4200 3600
Wire Wire Line
	2250 750  1650 750 
Wire Wire Line
	1650 750  1650 1200
Connection ~ 1650 1200
Wire Wire Line
	9250 5150 9600 5150
Wire Wire Line
	9800 5150 10200 5150
Connection ~ 10200 5150
Wire Wire Line
	2050 3150 1400 3150
Connection ~ 2050 3150
Wire Wire Line
	7900 4250 7950 4250
Wire Wire Line
	8000 4400 8000 4450
Wire Wire Line
	8000 4650 8000 4800
Wire Wire Line
	8050 4700 8000 4700
Connection ~ 8000 4700
Wire Wire Line
	8350 4700 8450 4700
Wire Wire Line
	8400 4800 8400 4700
Connection ~ 8400 4700
Wire Wire Line
	8900 4850 8900 5250
Wire Wire Line
	7850 5000 7850 5050
Wire Wire Line
	7850 5050 8900 5050
Connection ~ 8900 5050
Wire Wire Line
	7850 4800 7850 4750
Wire Wire Line
	7850 4750 8000 4750
Connection ~ 8000 4750
Wire Wire Line
	8000 5000 8000 5050
Connection ~ 8000 5050
Wire Wire Line
	8400 5000 8400 5050
Connection ~ 8400 5050
Wire Wire Line
	8900 5450 8900 5550
Wire Wire Line
	8400 5250 8400 5400
Wire Wire Line
	7050 5250 8400 5250
Wire Wire Line
	7900 5350 7900 5250
Connection ~ 7900 5250
Wire Wire Line
	7900 5600 8100 5600
Wire Wire Line
	8050 5700 8050 5600
Connection ~ 8050 5600
Wire Wire Line
	8400 5800 8450 5800
Wire Wire Line
	8650 5800 8750 5800
Wire Wire Line
	8700 5850 8700 5800
Connection ~ 8700 5800
Wire Wire Line
	8900 6100 8900 5850
Wire Wire Line
	8400 6100 8900 6100
Wire Wire Line
	8700 6100 8700 6050
Connection ~ 8700 6100
Wire Wire Line
	8050 5900 8050 6000
Wire Wire Line
	8050 6000 6850 6000
Connection ~ 8900 4950
Connection ~ 9250 4950
Wire Wire Line
	8600 4750 8600 5050
Connection ~ 8600 5050
Wire Wire Line
	4100 5450 4100 5500
$Comp
L CONN_02X01 J29
U 1 1 59B36419
P 4400 5150
F 0 "J29" H 4400 5250 50  0000 C CNN
F 1 "Jamper" H 4400 5050 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-02_02x2.54mm_Straight" H 4400 3950 50  0001 C CNN
F 3 "" H 4400 3950 50  0001 C CNN
	1    4400 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5150 4100 5150
Connection ~ 4700 5150
$Comp
L R_Small R76
U 1 1 59B3A7A1
P 8300 4250
F 0 "R76" V 8400 4250 50  0000 L CNN
F 1 "1k5" V 8400 4100 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 8300 4250 50  0001 C CNN
F 3 "" H 8300 4250 50  0001 C CNN
	1    8300 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8150 4250 8200 4250
Wire Wire Line
	8400 4250 8500 4250
Wire Wire Line
	8500 4250 8500 4400
Connection ~ 8500 4400
$Comp
L C_Small C42
U 1 1 59B3B8B7
P 9700 5150
F 0 "C42" V 9550 5400 50  0000 L CNN
F 1 "1nF 2kV Y2" V 9550 4900 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D10.5mm_W5.0mm_P10.00mm" H 9700 5150 50  0001 C CNN
F 3 "" H 9700 5150 50  0001 C CNN
	1    9700 5150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 3200 4650 2700
Wire Wire Line
	4650 2600 5400 2600
Wire Wire Line
	4650 2600 4650 1500
Connection ~ 4650 1500
Wire Wire Line
	5400 2200 4450 2200
Connection ~ 4450 2200
Wire Wire Line
	4000 2700 3900 2700
Wire Wire Line
	4200 2700 4250 2700
Wire Wire Line
	4250 2700 4250 2800
Wire Wire Line
	4250 2800 5400 2800
NoConn ~ 5400 2300
Wire Wire Line
	7900 5550 7900 5600
$Comp
L Relay_A Q13
U 1 1 59C25C86
P 2650 5900
F 0 "Q13" H 2475 6300 50  0000 C CNN
F 1 "Relay_A" H 2675 5575 50  0000 C CNN
F 2 "LehmanKiPatterns:TRD_A" H 2800 5700 50  0001 C CNN
F 3 "" H 2800 5700 50  0001 C CNN
	1    2650 5900
	1    0    0    -1  
$EndComp
$Comp
L Relay_A Q14
U 1 1 59C27082
P 2650 6700
F 0 "Q14" H 2475 7100 50  0000 C CNN
F 1 "Relay_A" H 2675 6375 50  0000 C CNN
F 2 "LehmanKiPatterns:TRD_A" H 2800 6500 50  0001 C CNN
F 3 "" H 2800 6500 50  0001 C CNN
	1    2650 6700
	1    0    0    -1  
$EndComp
$Comp
L Relay_A Q12
U 1 1 59C274C0
P 2650 5100
F 0 "Q12" H 2475 5500 50  0000 C CNN
F 1 "Relay_A" H 2675 4775 50  0000 C CNN
F 2 "LehmanKiPatterns:TRD_A" H 2800 4900 50  0001 C CNN
F 3 "" H 2800 4900 50  0001 C CNN
	1    2650 5100
	1    0    0    -1  
$EndComp
$Comp
L Relay_A Q11
U 1 1 59C27B92
P 2650 4300
F 0 "Q11" H 2475 4700 50  0000 C CNN
F 1 "Relay_A" H 2675 3975 50  0000 C CNN
F 2 "LehmanKiPatterns:TRD_A" H 2800 4100 50  0001 C CNN
F 3 "" H 2800 4100 50  0001 C CNN
	1    2650 4300
	1    0    0    -1  
$EndComp
$Comp
L Relay_A Q10
U 1 1 59C27DE5
P 2650 3500
F 0 "Q10" H 2475 3900 50  0000 C CNN
F 1 "Relay_A" H 2675 3175 50  0000 C CNN
F 2 "LehmanKiPatterns:TRD_A" H 2800 3300 50  0001 C CNN
F 3 "" H 2800 3300 50  0001 C CNN
	1    2650 3500
	1    0    0    -1  
$EndComp
$Comp
L Relay_A Q15
U 1 1 59C2808D
P 5350 5900
F 0 "Q15" H 5175 6300 50  0000 C CNN
F 1 "Relay_A" H 5375 5575 50  0000 C CNN
F 2 "LehmanKiPatterns:TRD_A" H 5500 5700 50  0001 C CNN
F 3 "" H 5500 5700 50  0001 C CNN
	1    5350 5900
	-1   0    0    -1  
$EndComp
$Comp
L Relay_A Q16
U 1 1 59C285D3
P 5350 6700
F 0 "Q16" H 5175 7100 50  0000 C CNN
F 1 "Relay_A" H 5375 6375 50  0000 C CNN
F 2 "LehmanKiPatterns:TRD_A" H 5500 6500 50  0001 C CNN
F 3 "" H 5500 6500 50  0001 C CNN
	1    5350 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5400 2400 4000 2400
Connection ~ 4000 2400
Wire Wire Line
	8250 1700 8250 4000
Wire Wire Line
	8250 4000 7050 4000
Wire Wire Line
	7050 4000 7050 5250
Wire Wire Line
	5400 1700 4750 1700
Wire Wire Line
	4750 1700 4750 3800
Wire Wire Line
	4750 3800 8350 3800
NoConn ~ 5400 2100
$EndSCHEMATC
