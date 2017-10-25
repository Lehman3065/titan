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
Sheet 4 4
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
L Transformer_Flyback_2P_2S T2
U 1 1 59A444F6
P 6700 2300
F 0 "T2" H 6700 2800 50  0000 C CNN
F 1 "EF20 Core" H 6700 1800 50  0000 C CNN
F 2 "LehmanKiPatterns:Transformer_Core_EF20" H 6700 2300 50  0001 C CNN
F 3 "" H 6700 2300 50  0001 C CNN
	1    6700 2300
	1    0    0    -1  
$EndComp
$Comp
L D_Bridge_+-AA D12
U 1 1 59A446A6
P 3100 2200
F 0 "D12" V 3600 2250 50  0000 L CNN
F 1 "DB107S" V 3500 2050 50  0000 L CNN
F 2 "Diodes_SMD:Diode_Bridge_DFS" H 3100 2200 50  0001 C CNN
F 3 "" H 3100 2200 50  0001 C CNN
	1    3100 2200
	0    -1   -1   0   
$EndComp
$Comp
L Varistor RV2
U 1 1 59A4474F
P 3100 4500
F 0 "RV2" V 3225 4500 50  0000 C CNN
F 1 "471" V 2975 4500 50  0000 C CNN
F 2 "Varistors:RV_Disc_D7_W3.4_P5" V 3030 4500 50  0001 C CNN
F 3 "" H 3100 4500 50  0001 C CNN
	1    3100 4500
	0    1    1    0   
$EndComp
$Comp
L Thermistor_NTC TH1
U 1 1 59A447D4
P 2800 4850
F 0 "TH1" H 2550 4900 50  0000 C CNN
F 1 "MF72-60D5" H 2450 4800 50  0000 C CNN
F 2 "Varistors:RV_Disc_D7_W3.4_P5" H 2800 4900 50  0001 C CNN
F 3 "" H 2800 4900 50  0001 C CNN
	1    2800 4850
	1    0    0    -1  
$EndComp
$Comp
L EMI_Filter_LL FL1
U 1 1 59A44847
P 3100 3800
F 0 "FL1" V 3200 4300 50  0000 C CNN
F 1 "PLA10AN4330" V 3100 4400 50  0000 C CNN
F 2 "LehmanKiPatterns:PLA10AN" V 3100 3840 50  0001 C CNN
F 3 "" V 3100 3840 50  0000 C CNN
	1    3100 3800
	0    -1   -1   0   
$EndComp
$Comp
L Fuse F2
U 1 1 59A44955
P 3400 4850
F 0 "F2" H 3200 4900 50  0000 C CNN
F 1 "1A" H 3250 4800 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_inline_Type-I" V 3330 4850 50  0001 C CNN
F 3 "" H 3400 4850 50  0001 C CNN
	1    3400 4850
	1    0    0    -1  
$EndComp
$Comp
L C C26
U 1 1 59A449AE
P 3100 4250
F 0 "C26" V 3100 3700 50  0000 L CNN
F 1 "0,1uF 400V X2" V 3200 3300 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L16.5mm_W7.0mm_P15.00mm_MKT" H 3138 4100 50  0001 C CNN
F 3 "" H 3100 4250 50  0001 C CNN
	1    3100 4250
	0    1    1    0   
$EndComp
$Comp
L C C25
U 1 1 59A44A3B
P 3100 3350
F 0 "C25" V 3050 2800 50  0000 L CNN
F 1 "0,1uF 400V X2" V 3150 2350 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L16.5mm_W7.0mm_P15.00mm_MKT" H 3138 3200 50  0001 C CNN
F 3 "" H 3100 3350 50  0001 C CNN
	1    3100 3350
	0    1    1    0   
$EndComp
$Comp
L C_Small C30
U 1 1 59A44AED
P 3800 2550
F 0 "C30" V 3850 2250 50  0000 L CNN
F 1 "10n" V 3750 2200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3800 2550 50  0001 C CNN
F 3 "" H 3800 2550 50  0001 C CNN
	1    3800 2550
	0    -1   -1   0   
$EndComp
$Comp
L CP C28
U 1 1 59A44B52
P 3650 2100
F 0 "C28" H 3400 2200 50  0000 L CNN
F 1 "22uF 450V" H 3700 2200 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D18.0mm_P7.50mm" H 3688 1950 50  0001 C CNN
F 3 "" H 3650 2100 50  0001 C CNN
	1    3650 2100
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C32
U 1 1 59A44BF3
P 4150 2900
F 0 "C32" H 3900 2800 50  0000 L CNN
F 1 "33uF 35V" H 3650 2900 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P2.50mm" H 4150 2900 50  0001 C CNN
F 3 "" H 4150 2900 50  0001 C CNN
	1    4150 2900
	-1   0    0    1   
$EndComp
$Comp
L PC817 U15
U 1 1 59A44C7C
P 6700 4250
F 0 "U15" H 6500 4450 50  0000 L CNN
F 1 "PC817" H 6700 4450 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 6500 4050 50  0001 L CIN
F 3 "" H 6700 4250 50  0001 L CNN
	1    6700 4250
	-1   0    0    -1  
$EndComp
$Comp
L D_ALT D14
U 1 1 59A4565D
P 5150 2400
F 0 "D14" V 5150 2250 50  0000 C CNN
F 1 "STTH1L06A" V 5250 2100 50  0000 C CNN
F 2 "Diodes_SMD:D_SMA" H 5150 2400 50  0001 C CNN
F 3 "https://sds.compel.ru/item-pdf/25c30062a6d498ed6fd7c233e4c4aa9b/ps/st~stth1l06.pdf" H 5150 2400 50  0001 C CNN
	1    5150 2400
	0    1    1    0   
$EndComp
$Comp
L D_Small D15
U 1 1 59A45949
P 5750 2900
F 0 "D15" V 5850 3000 50  0000 L CNN
F 1 "1N5711" V 5500 2800 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-123" V 5750 2900 50  0001 C CNN
F 3 "http://diotec.com/tl_files/diotec/files/pdf/datasheets/bat46w" V 5750 2900 50  0001 C CNN
	1    5750 2900
	0    -1   -1   0   
$EndComp
$Comp
L D_Schottky_Small D16
U 1 1 59A45AB1
P 6050 2900
F 0 "D16" V 6150 3000 50  0000 L CNN
F 1 "1N4148W" H 5800 2800 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-123" V 6050 2900 50  0001 C CNN
F 3 "" V 6050 2900 50  0001 C CNN
	1    6050 2900
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R84
U 1 1 59A45B3A
P 4750 3050
F 0 "R84" V 4650 3000 50  0000 L CNN
F 1 "10R" V 4650 3200 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4750 3050 50  0001 C CNN
F 3 "" H 4750 3050 50  0001 C CNN
	1    4750 3050
	0    1    1    0   
$EndComp
$Comp
L R_Small R85
U 1 1 59A4602D
P 6050 3300
F 0 "R85" H 6080 3320 50  0000 L CNN
F 1 "75k" H 5800 3350 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6050 3300 50  0001 C CNN
F 3 "" H 6050 3300 50  0001 C CNN
	1    6050 3300
	-1   0    0    1   
$EndComp
$Comp
L R_Small R86
U 1 1 59A460CC
P 6050 3700
F 0 "R86" H 6080 3720 50  0000 L CNN
F 1 "18k" H 5850 3700 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6050 3700 50  0001 C CNN
F 3 "" H 6050 3700 50  0001 C CNN
	1    6050 3700
	-1   0    0    1   
$EndComp
$Comp
L C_Small C29
U 1 1 59A47B9D
P 3650 4100
F 0 "C29" H 3660 4170 50  0000 L CNN
F 1 "820" H 3500 4000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3650 4100 50  0001 C CNN
F 3 "" H 3650 4100 50  0001 C CNN
	1    3650 4100
	1    0    0    -1  
$EndComp
$Comp
L C_Small C31
U 1 1 59A47C73
P 3900 3900
F 0 "C31" H 3910 3970 50  0000 L CNN
F 1 "56n" H 3910 3820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3900 3900 50  0001 C CNN
F 3 "" H 3900 3900 50  0001 C CNN
	1    3900 3900
	1    0    0    -1  
$EndComp
$Comp
L R_Small R81
U 1 1 59A47CDB
P 3900 4200
F 0 "R81" H 3700 4200 50  0000 L CNN
F 1 "47k" H 3700 4300 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3900 4200 50  0001 C CNN
F 3 "" H 3900 4200 50  0001 C CNN
	1    3900 4200
	-1   0    0    1   
$EndComp
$Comp
L Viper37HD U14
U 1 1 59A487AD
P 4800 3500
F 0 "U14" H 4475 3850 50  0000 C CNN
F 1 "Viper37LD" H 5000 3850 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4850 3750 50  0001 C CNN
F 3 "" H 4800 3250 50  0001 C CNN
	1    4800 3500
	1    0    0    -1  
$EndComp
$Comp
L R_Small R82
U 1 1 59A48959
P 4150 2050
F 0 "R82" H 3900 2000 50  0000 L CNN
F 1 "1,87M" H 3850 2100 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 4150 2050 50  0001 C CNN
F 3 "" H 4150 2050 50  0001 C CNN
	1    4150 2050
	-1   0    0    1   
$EndComp
$Comp
L R_Small R83
U 1 1 59A48A2D
P 4150 2300
F 0 "R83" H 3900 2250 50  0000 L CNN
F 1 "1,96M" H 3850 2350 50  0000 L CNN
F 2 "Resistors_SMD:R_1206" H 4150 2300 50  0001 C CNN
F 3 "" H 4150 2300 50  0001 C CNN
	1    4150 2300
	-1   0    0    1   
$EndComp
$Comp
L R_Small R80
U 1 1 59A48BC5
P 3800 2400
F 0 "R80" V 4000 2350 50  0000 L CNN
F 1 "11,5k" V 3900 2300 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3800 2400 50  0001 C CNN
F 3 "" H 3800 2400 50  0001 C CNN
	1    3800 2400
	0    -1   -1   0   
$EndComp
$Comp
L D_Schottky_Small D18
U 1 1 59A4B44E
P 7250 1900
F 0 "D18" H 7300 1800 50  0000 L CNN
F 1 "STPS2150" H 6850 1800 50  0000 L CNN
F 2 "Diodes_SMD:D_SMB" V 7250 1900 50  0001 C CNN
F 3 "Diotec" V 7250 1900 50  0001 C CNN
	1    7250 1900
	-1   0    0    1   
$EndComp
$Comp
L CP_Small C35
U 1 1 59A4B5D5
P 7550 2050
F 0 "C35" H 7300 2000 50  0000 L CNN
F 1 "330uF 20% x 35V" H 7150 1800 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 7550 2050 50  0001 C CNN
F 3 "" H 7550 2050 50  0001 C CNN
	1    7550 2050
	1    0    0    -1  
$EndComp
$Comp
L L_Small L4
U 1 1 59A4B639
P 8100 1900
F 0 "L4" V 8200 1950 50  0000 L CNN
F 1 "2,7uH 2A" V 8200 1500 50  0000 L CNN
F 2 "Inductors_SMD:L_Vishay_IHLP-5050" H 8100 1900 50  0001 C CNN
F 3 "Wurth Elektronik - 7440430027" H 8100 1900 50  0001 C CNN
	1    8100 1900
	0    -1   -1   0   
$EndComp
$Comp
L CP_Small C37
U 1 1 59A4B727
P 8300 2050
F 0 "C37" H 8400 2000 50  0000 L CNN
F 1 "22uF 20% x 35V" H 8400 1900 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D7.5mm_P2.50mm" H 8300 2050 50  0001 C CNN
F 3 "" H 8300 2050 50  0001 C CNN
	1    8300 2050
	1    0    0    -1  
$EndComp
$Comp
L R_Small R87
U 1 1 59A4C43E
P 7300 3900
F 0 "R87" H 7100 3800 50  0000 L CNN
F 1 "8k2" H 7100 3900 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7300 3900 50  0001 C CNN
F 3 "" H 7300 3900 50  0001 C CNN
	1    7300 3900
	-1   0    0    1   
$EndComp
$Comp
L R_Small R88
U 1 1 59A4CD68
P 7300 4250
F 0 "R88" H 7100 4150 50  0000 L CNN
F 1 "910" H 7100 4250 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7300 4250 50  0001 C CNN
F 3 "" H 7300 4250 50  0001 C CNN
	1    7300 4250
	-1   0    0    1   
$EndComp
$Comp
L R_Small R90
U 1 1 59A4CE90
P 7900 3900
F 0 "R90" H 7700 3800 50  0000 L CNN
F 1 "39k" H 7700 3900 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7900 3900 50  0001 C CNN
F 3 "" H 7900 3900 50  0001 C CNN
	1    7900 3900
	-1   0    0    1   
$EndComp
$Comp
L R_Small R91
U 1 1 59A4CFA0
P 7900 4950
F 0 "R91" H 7700 4850 50  0000 L CNN
F 1 "4k7" H 7700 4950 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7900 4950 50  0001 C CNN
F 3 "" H 7900 4950 50  0001 C CNN
	1    7900 4950
	-1   0    0    1   
$EndComp
$Comp
L TLV431ASN1 U16
U 1 1 59A4D4B4
P 7300 4750
F 0 "U16" H 7150 4850 50  0000 C CNN
F 1 "TL431AC" H 7550 4625 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" V 7300 4750 50  0001 C CNN
F 3 "" V 7300 4750 50  0001 C CNN
	1    7300 4750
	1    0    0    -1  
$EndComp
$Comp
L R_Small R89
U 1 1 59A4DE4D
P 7500 4500
F 0 "R89" V 7400 4450 50  0000 L CNN
F 1 "300k" V 7600 4450 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 7500 4500 50  0001 C CNN
F 3 "" H 7500 4500 50  0001 C CNN
	1    7500 4500
	0    1    1    0   
$EndComp
$Comp
L C_Small C36
U 1 1 59A4E157
P 7750 4500
F 0 "C36" V 7600 4450 50  0000 L CNN
F 1 "18n" V 7850 4450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7750 4500 50  0001 C CNN
F 3 "" H 7750 4500 50  0001 C CNN
	1    7750 4500
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR068
U 1 1 59A52B5D
P 8300 5200
F 0 "#PWR068" H 8300 4950 50  0001 C CNN
F 1 "Earth" H 8300 5050 50  0001 C CNN
F 2 "" H 8300 5200 50  0001 C CNN
F 3 "" H 8300 5200 50  0001 C CNN
	1    8300 5200
	1    0    0    -1  
$EndComp
Text GLabel 2700 5150 0    60   Input ~ 0
N
Text GLabel 3500 5150 2    60   Input ~ 0
LPwrSup
$Comp
L C_Small C33
U 1 1 59A58483
P 6700 3050
F 0 "C33" V 6850 2900 50  0000 L CNN
F 1 "2n2 3kV Y2" V 6950 2900 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D10.5mm_W5.0mm_P10.00mm" H 6700 3050 50  0001 C CNN
F 3 "" H 6700 3050 50  0001 C CNN
	1    6700 3050
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR069
U 1 1 59A587F2
P 7000 3100
F 0 "#PWR069" H 7000 2850 50  0001 C CNN
F 1 "Earth" H 7000 2950 50  0001 C CNN
F 2 "" H 7000 3100 50  0001 C CNN
F 3 "" H 7000 3100 50  0001 C CNN
	1    7000 3100
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 59A5E559
P 2950 2900
F 0 "C24" V 2900 2400 50  0000 L CNN
F 1 "1nF 2kV Y2" V 3000 2250 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D10.5mm_W5.0mm_P10.00mm" H 2988 2750 50  0001 C CNN
F 3 "" H 2950 2900 50  0001 C CNN
	1    2950 2900
	0    1    1    0   
$EndComp
$Comp
L C C27
U 1 1 59A5EB17
P 3250 2900
F 0 "C27" V 3200 3100 50  0000 L CNN
F 1 "1nF 2kV Y2" V 3300 3100 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D10.5mm_W5.0mm_P10.00mm" H 3288 2750 50  0001 C CNN
F 3 "" H 3250 2900 50  0001 C CNN
	1    3250 2900
	0    1    1    0   
$EndComp
$Comp
L GNDPWR #PWR070
U 1 1 59A5FA0C
P 3100 3000
F 0 "#PWR070" H 3100 2800 50  0001 C CNN
F 1 "GNDPWR" H 3100 2870 50  0000 C CNN
F 2 "" H 3100 2950 50  0001 C CNN
F 3 "" H 3100 2950 50  0001 C CNN
	1    3100 3000
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR071
U 1 1 59A53856
P 8550 1800
F 0 "#PWR071" H 8550 1650 50  0001 C CNN
F 1 "+24V" H 8550 1940 50  0000 C CNN
F 2 "" H 8550 1800 50  0001 C CNN
F 3 "" H 8550 1800 50  0001 C CNN
	1    8550 1800
	1    0    0    -1  
$EndComp
NoConn ~ 7000 2400
NoConn ~ 7000 2700
$Comp
L D_Schottky_Small D13
U 1 1 59B37171
P 5150 2050
F 0 "D13" V 5200 1800 50  0000 L CNN
F 1 "1.5KE250A" V 5100 1550 50  0000 L CNN
F 2 "Diodes_THT:D_DO-201_P12.70mm_Horizontal" V 5150 2050 50  0001 C CNN
F 3 "" V 5150 2050 50  0001 C CNN
	1    5150 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 1900 6400 1900
Wire Wire Line
	3650 1900 3650 1950
Wire Wire Line
	3400 2200 3400 3500
Wire Wire Line
	3400 3500 3000 3500
Wire Wire Line
	2800 2200 2800 3550
Wire Wire Line
	2800 3550 3200 3550
Wire Wire Line
	3000 4000 3000 4050
Wire Wire Line
	3000 4050 2800 4050
Wire Wire Line
	3200 4000 3200 4050
Wire Wire Line
	3200 4050 3400 4050
Wire Wire Line
	3250 4250 3400 4250
Connection ~ 3400 4250
Wire Wire Line
	2950 4250 2800 4250
Connection ~ 2800 4250
Wire Wire Line
	2800 4500 2950 4500
Connection ~ 2800 4500
Wire Wire Line
	3400 4500 3250 4500
Connection ~ 3400 4500
Wire Wire Line
	2950 3350 2800 3350
Connection ~ 2800 3350
Wire Wire Line
	3250 3350 3400 3350
Connection ~ 3400 3350
Connection ~ 3650 1900
Wire Wire Line
	5150 2150 5150 2250
Wire Wire Line
	6400 2300 5450 2300
Wire Wire Line
	5450 2300 5450 3600
Wire Wire Line
	5450 2550 5150 2550
Wire Wire Line
	5450 3300 5400 3300
Connection ~ 5450 2550
Wire Wire Line
	3100 2700 6400 2700
Wire Wire Line
	5750 2400 6400 2400
Wire Wire Line
	5750 2400 5750 2800
Wire Wire Line
	6050 2800 6050 2400
Connection ~ 6050 2400
Wire Wire Line
	6050 3000 6050 3200
Wire Wire Line
	6050 3400 6050 3600
Wire Wire Line
	6050 3800 6050 3900
Wire Wire Line
	5400 3900 6350 3900
Wire Wire Line
	5750 3500 5750 3700
Wire Wire Line
	5750 3500 6050 3500
Connection ~ 6050 3500
Wire Wire Line
	4850 3050 5750 3050
Wire Wire Line
	5750 3050 5750 3000
Wire Wire Line
	4650 3050 4150 3050
Wire Wire Line
	4150 3000 4150 3300
Wire Wire Line
	4150 3300 4200 3300
Connection ~ 4150 3050
Wire Wire Line
	4150 2800 4150 2700
Connection ~ 4150 2700
Wire Wire Line
	6350 4350 6350 2700
Connection ~ 6350 2700
Connection ~ 6050 3900
Wire Wire Line
	3650 4350 6400 4350
Wire Wire Line
	3650 4350 3650 4200
Wire Wire Line
	3900 4300 3900 4350
Connection ~ 3900 4350
Wire Wire Line
	3900 4100 3900 4000
Wire Wire Line
	3650 3700 4200 3700
Wire Wire Line
	3650 3700 3650 4000
Wire Wire Line
	3900 3700 3900 3800
Connection ~ 3900 3700
Connection ~ 6350 4350
Connection ~ 6350 3900
Wire Wire Line
	6400 4150 4150 4150
Wire Wire Line
	4150 4150 4150 3700
Connection ~ 4150 3700
Wire Wire Line
	3650 2250 3650 2700
Wire Wire Line
	4150 1950 4150 1900
Connection ~ 4150 1900
Wire Wire Line
	4150 2150 4150 2200
Wire Wire Line
	3100 2700 3100 2500
Connection ~ 3650 2700
Wire Wire Line
	3900 2400 4150 2400
Wire Wire Line
	3700 2400 3650 2400
Connection ~ 3650 2400
Wire Wire Line
	3700 2550 3650 2550
Connection ~ 3650 2550
Wire Wire Line
	3900 2550 3950 2550
Wire Wire Line
	3950 2400 3950 3500
Connection ~ 3950 2400
Wire Wire Line
	3950 3500 4200 3500
Connection ~ 3950 2550
Wire Wire Line
	7350 1900 8000 1900
Wire Wire Line
	8300 1900 8300 1950
Wire Wire Line
	7550 1950 7550 1900
Connection ~ 7550 1900
Wire Wire Line
	8300 2150 8300 5200
Wire Wire Line
	7550 2150 7550 2200
Connection ~ 7550 2200
Connection ~ 8300 1900
Connection ~ 8300 2200
Wire Wire Line
	7300 3800 7300 3700
Wire Wire Line
	7300 4000 7300 4150
Wire Wire Line
	7300 4350 7300 4550
Wire Wire Line
	7300 4950 7300 5100
Wire Wire Line
	7300 5100 8300 5100
Wire Wire Line
	7900 5100 7900 5050
Wire Wire Line
	7900 4750 7500 4750
Wire Wire Line
	7900 4000 7900 4850
Connection ~ 7900 4750
Wire Wire Line
	7000 4150 7050 4150
Wire Wire Line
	7050 4150 7050 4100
Wire Wire Line
	7050 4100 7300 4100
Connection ~ 7300 4100
Wire Wire Line
	7000 4350 7050 4350
Wire Wire Line
	7050 4350 7050 4400
Wire Wire Line
	7050 4400 7300 4400
Connection ~ 7300 4400
Wire Wire Line
	7900 1900 7900 3800
Connection ~ 7900 3700
Wire Wire Line
	7400 4500 7300 4500
Connection ~ 7300 4500
Wire Wire Line
	7600 4500 7650 4500
Wire Wire Line
	7850 4500 7900 4500
Connection ~ 7900 4500
Connection ~ 7900 5100
Connection ~ 8300 5100
Wire Wire Line
	2800 5000 2800 5150
Wire Wire Line
	6600 3050 6350 3050
Connection ~ 6350 3050
Wire Wire Line
	6800 3050 7000 3050
Wire Wire Line
	7000 3050 7000 3100
Wire Wire Line
	2800 2900 2800 2900
Connection ~ 2800 2900
Wire Wire Line
	3100 2900 3100 2900
Wire Wire Line
	3400 2900 3400 2900
Connection ~ 3400 2900
Wire Wire Line
	3100 3000 3100 2900
Connection ~ 3100 2900
Wire Wire Line
	7000 2200 8300 2200
Wire Wire Line
	7150 1900 7000 1900
Wire Wire Line
	5150 1950 5150 1900
Connection ~ 5150 1900
Wire Wire Line
	8200 1900 8550 1900
Wire Wire Line
	8550 1900 8550 1800
Connection ~ 7900 1900
Wire Wire Line
	7300 3700 7900 3700
Wire Wire Line
	3200 3550 3200 3600
Wire Wire Line
	3000 3500 3000 3600
Wire Wire Line
	2800 4050 2800 4700
Wire Wire Line
	3400 4050 3400 4700
Wire Wire Line
	3400 5000 3400 5150
Wire Wire Line
	3400 5150 3500 5150
Wire Wire Line
	2800 5150 2700 5150
Wire Wire Line
	5750 3700 5400 3700
Wire Wire Line
	5400 3800 5450 3800
Wire Wire Line
	5450 3800 5450 3900
Connection ~ 5450 3900
Wire Wire Line
	5450 3600 5400 3600
Connection ~ 5450 3300
Wire Wire Line
	5450 3500 5400 3500
Connection ~ 5450 3500
Wire Wire Line
	5400 3400 5450 3400
Connection ~ 5450 3400
$EndSCHEMATC
