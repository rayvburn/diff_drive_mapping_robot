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
LIBS:xl4016
LIBS:mx1508
LIBS:hx-2s-01_5a
LIBS:stm32f103c8t6-module-china
LIBS:Robot_MGR-cache
EELAYER 25 0
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
$Comp
L XL4016 BuckConverter1
U 1 1 5A859A3E
P 2600 1750
F 0 "BuckConverter1" H 2600 1650 60  0000 C CNN
F 1 "XL4016" H 2600 1750 60  0000 C CNN
F 2 "XL4016:XL4016" H 2600 1750 60  0001 C CNN
F 3 "" H 2600 1750 60  0001 C CNN
	1    2600 1750
	1    0    0    -1  
$EndComp
Text GLabel 1700 1900 0    60   Input ~ 0
7,4V
Text GLabel 1700 1700 0    60   Input ~ 0
GND
Text GLabel 3550 1700 2    60   Input ~ 0
GND
Text GLabel 3550 1900 2    60   Input ~ 0
5V
$Comp
L Screw_Terminal_1x02 J2
U 1 1 5A859BB6
P 950 2550
F 0 "J2" H 950 2800 50  0000 C TNN
F 1 "ZasilanieRaspberry" V 800 2550 50  0000 C TNN
F 2 "TerminalBlock_Philmore:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 950 2325 50  0001 C CNN
F 3 "" H 925 2550 50  0001 C CNN
	1    950  2550
	1    0    0    -1  
$EndComp
Text GLabel 1150 2650 2    60   Input ~ 0
5V
Text GLabel 1150 2450 2    60   Input ~ 0
GND
Text GLabel 1300 250  2    60   Input ~ 0
5V
Text GLabel 50   100  2    60   Input ~ 0
GND
$Comp
L PWR_FLAG #FLG2
U 1 1 5A859CA4
P 1150 200
F 0 "#FLG2" H 1150 275 50  0001 C CNN
F 1 "PWR_FLAG" H 1150 350 50  0000 C CNN
F 2 "" H 1150 200 50  0001 C CNN
F 3 "" H 1150 200 50  0001 C CNN
	1    1150 200 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 5A859CBC
P -50 150
F 0 "#PWR1" H -50 -100 50  0001 C CNN
F 1 "GND" H -50 0   50  0000 C CNN
F 2 "" H -50 150 50  0001 C CNN
F 3 "" H -50 150 50  0001 C CNN
	1    -50  150 
	1    0    0    -1  
$EndComp
Wire Wire Line
	50   100  -50  100 
Wire Wire Line
	-50  100  -50  150 
Text GLabel 1850 250  2    60   Input ~ 0
7,4V_RAW
$Comp
L PWR_FLAG #FLG3
U 1 1 5A859DD7
P 1700 200
F 0 "#FLG3" H 1700 275 50  0001 C CNN
F 1 "PWR_FLAG" H 1700 350 50  0000 C CNN
F 2 "" H 1700 200 50  0001 C CNN
F 3 "" H 1700 200 50  0001 C CNN
	1    1700 200 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 200  1700 250 
Wire Wire Line
	1700 250  1850 250 
$Comp
L CONN_01X02_FEMALE J4
U 1 1 5A859E5A
P 1350 1000
F 0 "J4" H 1350 1200 50  0000 C CNN
F 1 "Akumulator" H 1425 800 50  0000 C CNN
F 2 "XT60:XT60" H 1350 1100 50  0001 C CNN
F 3 "" H 1350 1100 50  0001 C CNN
	1    1350 1000
	1    0    0    -1  
$EndComp
Text GLabel 1250 900  0    60   Input ~ 0
GND
Text GLabel 1250 1100 0    60   Input ~ 0
7,4V_RAW
$Comp
L MX1508 HBridge1
U 1 1 5A85A503
P 2100 3650
F 0 "HBridge1" H 2100 3700 60  0000 C CNN
F 1 "MX1508" H 2100 3800 60  0000 C CNN
F 2 "MX1508:MX1508" H 2100 3650 60  0001 C CNN
F 3 "" H 2100 3650 60  0001 C CNN
	1    2100 3650
	1    0    0    -1  
$EndComp
Text GLabel 1350 3550 0    60   Input ~ 0
GND
$Comp
L Screw_Terminal_1x02 J8
U 1 1 5A85A99E
P 3750 3550
F 0 "J8" H 3750 3800 50  0000 C TNN
F 1 "MotorA" V 3600 3550 50  0000 C TNN
F 2 "TerminalBlock_Philmore:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 3750 3325 50  0001 C CNN
F 3 "" H 3725 3550 50  0001 C CNN
	1    3750 3550
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_1x02 J9
U 1 1 5A85AAAC
P 3750 4050
F 0 "J9" H 3750 4300 50  0000 C TNN
F 1 "MotorB" V 3600 4050 50  0000 C TNN
F 2 "TerminalBlock_Philmore:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 3750 3825 50  0001 C CNN
F 3 "" H 3725 4050 50  0001 C CNN
	1    3750 4050
	1    0    0    -1  
$EndComp
Text GLabel 2850 3750 2    60   Input ~ 0
MotorA_1
Text GLabel 2850 3850 2    60   Input ~ 0
MotorA_2
Text GLabel 2850 3950 2    60   Input ~ 0
MotorB_1
Text GLabel 2850 4050 2    60   Input ~ 0
MotorB_2
Text GLabel 1350 3750 0    60   Input ~ 0
IN1_H_Bridge
Text GLabel 1350 3850 0    60   Input ~ 0
IN2_H_Bridge
Text GLabel 1350 3950 0    60   Input ~ 0
IN3_H_Bridge
Text GLabel 1350 4050 0    60   Input ~ 0
IN4_H_Bridge
$Comp
L HX-2S-01_5A BMS1
U 1 1 5A85B8DF
P 4950 1000
F 0 "BMS1" H 4950 900 60  0000 C CNN
F 1 "HX-2S-01_5A" H 4950 1000 60  0000 C CNN
F 2 "HX-2S-01_5A:HX-2S-01_5A" H 4950 1000 60  0001 C CNN
F 3 "" H 4950 1000 60  0001 C CNN
	1    4950 1000
	1    0    0    -1  
$EndComp
NoConn ~ 5400 650 
NoConn ~ 5450 1450
Text GLabel 1900 2350 0    60   Input ~ 0
5V
Text GLabel 1900 2750 0    60   Input ~ 0
GND
$Comp
L CP C1
U 1 1 5A85C7DB
P 2050 2550
F 0 "C1" H 2075 2650 50  0000 L CNN
F 1 "1000 uF / 25V" H 1700 2450 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 2088 2400 50  0001 C CNN
F 3 "" H 2050 2550 50  0001 C CNN
	1    2050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2350 2050 2400
Wire Wire Line
	2050 2750 2050 2700
$Comp
L C C4
U 1 1 5A86593B
P 4100 4050
F 0 "C4" H 4125 4150 50  0000 L CNN
F 1 "470 nF / 50V" H 4125 3950 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_Tantal_D5.0mm_P2.50mm" H 4138 3900 50  0001 C CNN
F 3 "" H 4100 4050 50  0001 C CNN
	1    4100 4050
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5A865AEE
P 4100 3550
F 0 "C3" H 4125 3650 50  0000 L CNN
F 1 "470 nF / 50V" H 4125 3450 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_Tantal_D5.0mm_P2.50mm" H 4138 3400 50  0001 C CNN
F 3 "" H 4100 3550 50  0001 C CNN
	1    4100 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3450 4000 3450
Wire Wire Line
	4000 3450 4000 3350
Wire Wire Line
	4000 3350 4400 3350
Wire Wire Line
	4100 3350 4100 3400
Wire Wire Line
	3950 3650 4000 3650
Wire Wire Line
	4000 3650 4000 3750
Wire Wire Line
	4000 3750 4400 3750
Wire Wire Line
	4100 3750 4100 3700
Wire Wire Line
	3950 3950 4000 3950
Wire Wire Line
	4000 3950 4000 3850
Wire Wire Line
	4000 3850 4400 3850
Wire Wire Line
	4100 3850 4100 3900
Wire Wire Line
	3950 4150 4000 4150
Wire Wire Line
	4000 4150 4000 4250
Wire Wire Line
	4000 4250 4400 4250
Wire Wire Line
	4100 4250 4100 4200
$Comp
L C C2
U 1 1 5A8660B6
P 2400 2550
F 0 "C2" H 2425 2650 50  0000 L CNN
F 1 "470 nF / 50V" H 2150 2300 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_Tantal_D5.0mm_P2.50mm" H 2438 2400 50  0001 C CNN
F 3 "" H 2400 2550 50  0001 C CNN
	1    2400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2350 2800 2350
Wire Wire Line
	2400 2350 2400 2400
Connection ~ 2050 2350
Wire Wire Line
	1900 2750 2800 2750
Wire Wire Line
	2400 2750 2400 2700
Connection ~ 2050 2750
$Comp
L Screw_Terminal_1x02 J11
U 1 1 5A8676EB
P 7050 1050
F 0 "J11" H 7050 1300 50  0000 C TNN
F 1 "WylacznikGlowny" V 6900 1050 50  0000 C TNN
F 2 "TerminalBlock_Philmore:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 7050 825 50  0001 C CNN
F 3 "" H 7025 1050 50  0001 C CNN
	1    7050 1050
	1    0    0    -1  
$EndComp
Text GLabel 7250 950  2    60   Input ~ 0
7,4V_RAW
Text GLabel 7250 1150 2    60   Input ~ 0
7,4V
$Comp
L CONN_01X03_MALE J6
U 1 1 5A868D3E
P 2000 1050
F 0 "J6" H 2000 1325 50  0000 C CNN
F 1 "Akumulator_BM" H 2025 775 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 2000 1250 50  0001 C CNN
F 3 "" H 2000 1250 50  0001 C CNN
	1    2000 1050
	1    0    0    -1  
$EndComp
Text GLabel 2300 1250 2    60   Input ~ 0
GND_JST
Text GLabel 2300 850  2    60   Input ~ 0
7,4V_RAW_JST
Text GLabel 2300 1050 2    60   Input ~ 0
3,7V_JST/BM
Text GLabel 6050 1050 2    60   Input ~ 0
3,7V_JST/BM
$Comp
L CONN_01X04_FEMALE J1
U 1 1 5A86EA8F
P 850 5350
F 0 "J1" H 850 5750 50  0000 C CNN
F 1 "DiodaRGB" H 950 4950 50  0000 C CNN
F 2 "Connectors_JST:JST_EH_B04B-EH-A_04x2.50mm_Straight" H 850 5650 50  0001 C CNN
F 3 "" H 850 5650 50  0001 C CNN
	1    850  5350
	-1   0    0    1   
$EndComp
Text GLabel 950  5450 2    60   Input ~ 0
WspolnaKatoda
Text GLabel 950  5650 2    60   Input ~ 0
DiodaR_Anoda
Text GLabel 950  5250 2    60   Input ~ 0
DiodaG_Anoda
Text GLabel 950  5050 2    60   Input ~ 0
DiodaB_Anoda
Text GLabel 1350 3450 0    60   Input ~ 0
7,4V
$Comp
L Q_NMOS_SGD Q1
U 1 1 5A986326
P 1550 7050
F 0 "Q1" H 1750 7100 50  0000 L CNN
F 1 "Q_NMOS_SGD" H 1150 6850 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 1750 7150 50  0001 C CNN
F 3 "" H 1550 7050 50  0001 C CNN
	1    1550 7050
	1    0    0    -1  
$EndComp
Text GLabel 1950 7050 2    60   Input ~ 0
DiodaB_Anoda
$Comp
L R R2
U 1 1 5A986549
P 1150 7050
F 0 "R2" V 1230 7050 50  0000 C CNN
F 1 "100R" V 1150 7050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1080 7050 50  0001 C CNN
F 3 "" H 1150 7050 50  0001 C CNN
	1    1150 7050
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5A9869BD
P 950 7200
F 0 "R1" V 1030 7200 50  0000 C CNN
F 1 "10k" V 950 7200 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 880 7200 50  0001 C CNN
F 3 "" H 950 7200 50  0001 C CNN
	1    950  7200
	-1   0    0    1   
$EndComp
$Comp
L Q_PNP_CBE Q2
U 1 1 5A9871D5
P 2050 6450
F 0 "Q2" H 2250 6500 50  0000 L CNN
F 1 "Q_PNP_CBE" H 2250 6400 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 2250 6550 50  0001 C CNN
F 3 "" H 2050 6450 50  0001 C CNN
	1    2050 6450
	-1   0    0    1   
$EndComp
Text GLabel 2000 6050 2    60   Input ~ 0
5V
$Comp
L R R5
U 1 1 5A9890B1
P 1950 6850
F 0 "R5" V 2030 6850 50  0000 C CNN
F 1 "???R" V 1950 6850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1880 6850 50  0001 C CNN
F 3 "" H 1950 6850 50  0001 C CNN
	1    1950 6850
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5A989C18
P 1650 6650
F 0 "R4" V 1730 6650 50  0000 C CNN
F 1 "1k" V 1650 6650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1580 6650 50  0001 C CNN
F 3 "" H 1650 6650 50  0001 C CNN
	1    1650 6650
	1    0    0    -1  
$EndComp
Text GLabel 1950 7250 2    60   Input ~ 0
WspolnaKatoda
Wire Wire Line
	1950 7000 1950 7050
Text GLabel 1950 7400 3    60   Input ~ 0
GND
Wire Wire Line
	1950 7250 1950 7400
Wire Wire Line
	1350 7050 1300 7050
Wire Wire Line
	750  7050 1000 7050
Wire Wire Line
	950  7350 1950 7350
Connection ~ 1950 7350
Wire Wire Line
	1650 7250 1650 7350
Connection ~ 1650 7350
Wire Wire Line
	1650 6850 1650 6800
Wire Wire Line
	1650 6400 1650 6500
Wire Wire Line
	1950 6050 1950 6250
$Comp
L CONN_01X01_MALE J3
U 1 1 5A98BEE9
P 750 6750
F 0 "J3" H 750 6825 50  0000 C CNN
F 1 "DiodaB_RPi" H 750 6650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 750 6750 50  0001 C CNN
F 3 "" H 750 6750 50  0001 C CNN
	1    750  6750
	0    1    1    0   
$EndComp
Connection ~ 950  7050
Wire Wire Line
	1950 6650 1950 6700
$Comp
L Q_NMOS_SGD Q4
U 1 1 5A98F2BA
P 3700 7050
F 0 "Q4" H 3900 7100 50  0000 L CNN
F 1 "Q_NMOS_SGD" H 3300 6850 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 3900 7150 50  0001 C CNN
F 3 "" H 3700 7050 50  0001 C CNN
	1    3700 7050
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5A98F2C1
P 3300 7050
F 0 "R9" V 3380 7050 50  0000 C CNN
F 1 "100R" V 3300 7050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3230 7050 50  0001 C CNN
F 3 "" H 3300 7050 50  0001 C CNN
	1    3300 7050
	0    -1   -1   0   
$EndComp
$Comp
L R R8
U 1 1 5A98F2C7
P 3100 7200
F 0 "R8" V 3180 7200 50  0000 C CNN
F 1 "10k" V 3100 7200 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3030 7200 50  0001 C CNN
F 3 "" H 3100 7200 50  0001 C CNN
	1    3100 7200
	-1   0    0    1   
$EndComp
$Comp
L Q_PNP_CBE Q5
U 1 1 5A98F2CD
P 4200 6450
F 0 "Q5" H 4400 6500 50  0000 L CNN
F 1 "Q_PNP_CBE" H 4400 6400 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 4400 6550 50  0001 C CNN
F 3 "" H 4200 6450 50  0001 C CNN
	1    4200 6450
	-1   0    0    1   
$EndComp
Text GLabel 4150 6050 2    60   Input ~ 0
5V
$Comp
L R R12
U 1 1 5A98F2D4
P 4100 6850
F 0 "R12" V 4180 6850 50  0000 C CNN
F 1 "???R" V 4100 6850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4030 6850 50  0001 C CNN
F 3 "" H 4100 6850 50  0001 C CNN
	1    4100 6850
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 5A98F2DA
P 3800 6650
F 0 "R11" V 3880 6650 50  0000 C CNN
F 1 "1k" V 3800 6650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3730 6650 50  0001 C CNN
F 3 "" H 3800 6650 50  0001 C CNN
	1    3800 6650
	1    0    0    -1  
$EndComp
Text GLabel 4100 7250 2    60   Input ~ 0
WspolnaKatoda
Wire Wire Line
	4100 7000 4100 7050
Text GLabel 4100 7400 3    60   Input ~ 0
GND
Wire Wire Line
	4100 7250 4100 7400
Wire Wire Line
	3500 7050 3450 7050
Wire Wire Line
	2900 7050 3150 7050
Wire Wire Line
	3100 7350 4100 7350
Connection ~ 4100 7350
Wire Wire Line
	3800 7250 3800 7350
Connection ~ 3800 7350
Wire Wire Line
	3800 6850 3800 6800
Wire Wire Line
	3800 6400 3800 6500
Wire Wire Line
	4100 6050 4100 6250
$Comp
L CONN_01X01_MALE J7
U 1 1 5A98F2EE
P 2900 6750
F 0 "J7" H 2900 6825 50  0000 C CNN
F 1 "DiodaG_RPi" H 2900 6650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 2900 6750 50  0001 C CNN
F 3 "" H 2900 6750 50  0001 C CNN
	1    2900 6750
	0    1    1    0   
$EndComp
Connection ~ 3100 7050
Wire Wire Line
	4100 6650 4100 6700
$Comp
L Q_NMOS_SGD Q6
U 1 1 5A990109
P 5750 6850
F 0 "Q6" H 5950 6900 50  0000 L CNN
F 1 "Q_NMOS_SGD" H 5350 6650 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 5950 6950 50  0001 C CNN
F 3 "" H 5750 6850 50  0001 C CNN
	1    5750 6850
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 5A990110
P 5350 6850
F 0 "R14" V 5430 6850 50  0000 C CNN
F 1 "100R" V 5350 6850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5280 6850 50  0001 C CNN
F 3 "" H 5350 6850 50  0001 C CNN
	1    5350 6850
	0    -1   -1   0   
$EndComp
$Comp
L R R13
U 1 1 5A990116
P 5150 7000
F 0 "R13" V 5230 7000 50  0000 C CNN
F 1 "10k" V 5150 7000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5080 7000 50  0001 C CNN
F 3 "" H 5150 7000 50  0001 C CNN
	1    5150 7000
	-1   0    0    1   
$EndComp
$Comp
L Q_PNP_CBE Q7
U 1 1 5A99011C
P 6250 6250
F 0 "Q7" H 6450 6300 50  0000 L CNN
F 1 "Q_PNP_CBE" H 6450 6200 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 6450 6350 50  0001 C CNN
F 3 "" H 6250 6250 50  0001 C CNN
	1    6250 6250
	-1   0    0    1   
$EndComp
Text GLabel 6250 5900 2    60   Input ~ 0
5V
$Comp
L R R17
U 1 1 5A990123
P 6150 6650
F 0 "R17" V 6230 6650 50  0000 C CNN
F 1 "???R" V 6150 6650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6080 6650 50  0001 C CNN
F 3 "" H 6150 6650 50  0001 C CNN
	1    6150 6650
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 5A990129
P 5850 6450
F 0 "R16" V 5930 6450 50  0000 C CNN
F 1 "1k" V 5850 6450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5780 6450 50  0001 C CNN
F 3 "" H 5850 6450 50  0001 C CNN
	1    5850 6450
	1    0    0    -1  
$EndComp
Text GLabel 6150 7050 2    60   Input ~ 0
WspolnaKatoda
Wire Wire Line
	6150 6800 6150 6900
Text GLabel 6150 7200 3    60   Input ~ 0
GND
Wire Wire Line
	6150 7050 6150 7200
Wire Wire Line
	5550 6850 5500 6850
Wire Wire Line
	4950 6850 5200 6850
Wire Wire Line
	5150 7150 6150 7150
Connection ~ 6150 7150
Wire Wire Line
	5850 7050 5850 7150
Connection ~ 5850 7150
Wire Wire Line
	5850 6650 5850 6600
Wire Wire Line
	5850 6200 5850 6300
Wire Wire Line
	6150 5900 6150 6050
$Comp
L CONN_01X01_MALE J10
U 1 1 5A99013D
P 4950 6550
F 0 "J10" H 4950 6625 50  0000 C CNN
F 1 "DiodaR_RPi" H 4950 6450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4950 6550 50  0001 C CNN
F 3 "" H 4950 6550 50  0001 C CNN
	1    4950 6550
	0    1    1    0   
$EndComp
Connection ~ 5150 6850
Wire Wire Line
	6150 6450 6150 6500
Text GLabel 4150 7050 2    60   Input ~ 0
DiodaG_Anoda
Text GLabel 6200 6900 2    60   Input ~ 0
DiodaR_Anoda
Wire Wire Line
	6150 6900 6200 6900
Wire Wire Line
	4100 7050 4150 7050
Wire Notes Line
	500  5850 6950 5850
Wire Notes Line
	500  5850 500  7750
Wire Notes Line
	500  7750 6950 7750
Wire Notes Line
	6950 7750 6950 5850
$Comp
L R R15
U 1 1 5A997C4B
P 5850 6050
F 0 "R15" V 5930 6050 50  0000 C CNN
F 1 "10k" V 5850 6050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5780 6050 50  0001 C CNN
F 3 "" H 5850 6050 50  0001 C CNN
	1    5850 6050
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5A997F09
P 3800 6250
F 0 "R10" V 3880 6250 50  0000 C CNN
F 1 "10k" V 3800 6250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3730 6250 50  0001 C CNN
F 3 "" H 3800 6250 50  0001 C CNN
	1    3800 6250
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A998CC0
P 1650 6250
F 0 "R3" V 1730 6250 50  0000 C CNN
F 1 "10k" V 1650 6250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1580 6250 50  0001 C CNN
F 3 "" H 1650 6250 50  0001 C CNN
	1    1650 6250
	1    0    0    -1  
$EndComp
Connection ~ 1650 6450
Wire Wire Line
	1650 6100 1650 6050
Wire Wire Line
	1650 6050 2000 6050
Connection ~ 1950 6050
Wire Wire Line
	4150 6050 3800 6050
Wire Wire Line
	3800 6050 3800 6100
Connection ~ 3800 6450
Connection ~ 4100 6050
Wire Wire Line
	5850 5900 6250 5900
Connection ~ 5850 6250
Connection ~ 6150 5900
$Comp
L CONN_01X04_MALE J13
U 1 1 5A9A3E40
P 8450 2450
F 0 "J13" H 8450 2825 50  0000 C CNN
F 1 "SonarRAW1" H 8450 2050 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B04B-XH-A_04x2.50mm_Straight" H 8450 2750 50  0001 C CNN
F 3 "" H 8450 2750 50  0001 C CNN
	1    8450 2450
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02_MALE J39
U 1 1 5A9AC4EB
P 9350 2450
F 0 "J39" H 9350 2625 50  0000 C CNN
F 1 "SonarRPi1" H 9350 2250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9350 2550 50  0001 C CNN
F 3 "" H 9350 2550 50  0001 C CNN
	1    9350 2450
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02_MALE J37
U 1 1 5A9AF5F8
P 9300 3900
F 0 "J37" H 9300 4075 50  0000 C CNN
F 1 "SonarRPi2" H 9300 3700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9300 4000 50  0001 C CNN
F 3 "" H 9300 4000 50  0001 C CNN
	1    9300 3900
	0    1    1    0   
$EndComp
$Comp
L CONN_01X04_MALE J35
U 1 1 5A9B0662
P 8450 3900
F 0 "J35" H 8450 4275 50  0000 C CNN
F 1 "SonarRAW2" H 8450 3500 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B04B-XH-A_04x2.50mm_Straight" H 8450 4200 50  0001 C CNN
F 3 "" H 8450 4200 50  0001 C CNN
	1    8450 3900
	0    1    1    0   
$EndComp
$Comp
L CONN_01X04_MALE J36
U 1 1 5A9B1ED8
P 8450 5400
F 0 "J36" H 8450 5775 50  0000 C CNN
F 1 "SonarRAW3" H 8450 5000 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B04B-XH-A_04x2.50mm_Straight" H 8450 5700 50  0001 C CNN
F 3 "" H 8450 5700 50  0001 C CNN
	1    8450 5400
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02_MALE J38
U 1 1 5A9B2007
P 9300 5400
F 0 "J38" H 9300 5575 50  0000 C CNN
F 1 "SonarRPi3" H 9300 5200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9300 5500 50  0001 C CNN
F 3 "" H 9300 5500 50  0001 C CNN
	1    9300 5400
	0    1    1    0   
$EndComp
Text GLabel 8750 2750 3    60   Input ~ 0
GND
Text GLabel 8550 2750 3    60   Input ~ 0
Echo1_RAW
Text GLabel 8550 4200 3    60   Input ~ 0
Echo2_RAW
Text GLabel 8550 5700 3    60   Input ~ 0
Echo3_RAW
Text GLabel 8750 4200 3    60   Input ~ 0
GND
Text GLabel 8750 5700 3    60   Input ~ 0
GND
Text GLabel 8350 2750 3    60   Input ~ 0
Trigger1_RAW
Text GLabel 8350 4200 3    60   Input ~ 0
Trigger2_RAW
Text GLabel 8350 5700 3    60   Input ~ 0
Trigger3_RAW
Text GLabel 9250 2750 3    60   Input ~ 0
Trigger1_RAW
Text GLabel 9200 4200 3    60   Input ~ 0
Trigger2_RAW
Text GLabel 9200 5700 3    60   Input ~ 0
Trigger3_RAW
Text GLabel 10300 5250 0    60   Input ~ 0
Echo3_RAW
Text GLabel 10300 4000 0    60   Input ~ 0
Echo2_RAW
Text GLabel 10300 2500 0    60   Input ~ 0
Echo1_RAW
Text GLabel 8150 2750 3    60   Input ~ 0
5V
Text GLabel 8150 4200 3    60   Input ~ 0
5V
Text GLabel 8150 5700 3    60   Input ~ 0
5V
$Comp
L CONN_01X04_MALE J28
U 1 1 5A9CA0AB
P -1000 3600
F 0 "J28" H -1000 3975 50  0000 C CNN
F 1 "HBridgeInputs" H -1000 3200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H -1000 3900 50  0001 C CNN
F 3 "" H -1000 3900 50  0001 C CNN
	1    -1000 3600
	1    0    0    -1  
$EndComp
Text GLabel -700 3300 2    60   Input ~ 0
IN1_H_Bridge
Text GLabel -700 3500 2    60   Input ~ 0
IN2_H_Bridge
Text GLabel -700 3700 2    60   Input ~ 0
IN3_H_Bridge
Text GLabel -700 3900 2    60   Input ~ 0
IN4_H_Bridge
$Comp
L R R26
U 1 1 5A9D4F2E
P 10350 2700
F 0 "R26" V 10430 2700 50  0000 C CNN
F 1 "1k" V 10350 2700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10280 2700 50  0001 C CNN
F 3 "" H 10350 2700 50  0001 C CNN
	1    10350 2700
	1    0    0    -1  
$EndComp
$Comp
L R R27
U 1 1 5A9D5C90
P 10350 3100
F 0 "R27" V 10430 3100 50  0000 C CNN
F 1 "2k" V 10350 3100 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10280 3100 50  0001 C CNN
F 3 "" H 10350 3100 50  0001 C CNN
	1    10350 3100
	1    0    0    -1  
$EndComp
Text GLabel 10350 3300 3    60   Input ~ 0
GND
Wire Wire Line
	10350 3300 10350 3250
Wire Wire Line
	10350 2850 10350 2950
Wire Wire Line
	10300 2500 10350 2500
Wire Wire Line
	10350 2500 10350 2550
Text GLabel 10550 2900 2    60   Input ~ 0
Echo1_RPi
Wire Wire Line
	10550 2900 10350 2900
Connection ~ 10350 2900
$Comp
L R R28
U 1 1 5A9B4F2B
P 10350 4200
F 0 "R28" V 10430 4200 50  0000 C CNN
F 1 "1k" V 10350 4200 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10280 4200 50  0001 C CNN
F 3 "" H 10350 4200 50  0001 C CNN
	1    10350 4200
	1    0    0    -1  
$EndComp
$Comp
L R R29
U 1 1 5A9B500D
P 10350 4600
F 0 "R29" V 10430 4600 50  0000 C CNN
F 1 "2k" V 10350 4600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10280 4600 50  0001 C CNN
F 3 "" H 10350 4600 50  0001 C CNN
	1    10350 4600
	1    0    0    -1  
$EndComp
Text GLabel 10350 4800 3    60   Input ~ 0
GND
Text GLabel 10450 4400 2    60   Input ~ 0
Echo2_RPi
Wire Wire Line
	10300 4000 10350 4000
Wire Wire Line
	10350 4000 10350 4050
Wire Wire Line
	10350 4350 10350 4450
Wire Wire Line
	10350 4400 10450 4400
Connection ~ 10350 4400
Wire Wire Line
	10350 4800 10350 4750
$Comp
L R R30
U 1 1 5A9B8265
P 10350 5500
F 0 "R30" V 10430 5500 50  0000 C CNN
F 1 "1k" V 10350 5500 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10280 5500 50  0001 C CNN
F 3 "" H 10350 5500 50  0001 C CNN
	1    10350 5500
	1    0    0    -1  
$EndComp
$Comp
L R R31
U 1 1 5A9B834B
P 10350 5900
F 0 "R31" V 10430 5900 50  0000 C CNN
F 1 "2k" V 10350 5900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10280 5900 50  0001 C CNN
F 3 "" H 10350 5900 50  0001 C CNN
	1    10350 5900
	1    0    0    -1  
$EndComp
Text GLabel 10350 6150 3    60   Input ~ 0
GND
Text GLabel 10400 5700 2    60   Input ~ 0
Echo3_RPi
Wire Wire Line
	10300 5250 10350 5250
Wire Wire Line
	10350 5250 10350 5350
Wire Wire Line
	10350 5650 10350 5750
Wire Wire Line
	10400 5700 10350 5700
Connection ~ 10350 5700
Wire Wire Line
	10350 6150 10350 6050
Text GLabel 9400 4200 3    60   Input ~ 0
Echo2_RPi
Text GLabel 9450 2750 3    60   Input ~ 0
Echo1_RPi
Text GLabel 9400 5700 3    60   Input ~ 0
Echo3_RPi
$Comp
L CONN_01X04_MALE J33
U 1 1 5A9C6F28
P 7300 3550
F 0 "J33" H 7300 3925 50  0000 C CNN
F 1 "IR1" H 7300 3150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 7300 3850 50  0001 C CNN
F 3 "" H 7300 3850 50  0001 C CNN
	1    7300 3550
	0    1    1    0   
$EndComp
$Comp
L CONN_01X04_MALE J34
U 1 1 5A9CA702
P 7300 4950
F 0 "J34" H 7300 5325 50  0000 C CNN
F 1 "IR2" H 7300 4550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 7300 5250 50  0001 C CNN
F 3 "" H 7300 5250 50  0001 C CNN
	1    7300 4950
	0    1    1    0   
$EndComp
Text GLabel 4600 1800 0    60   Input ~ 0
5V
Text GLabel 5350 2300 3    60   Input ~ 0
GND
$Comp
L LD1117S33TR U1
U 1 1 5A9CF555
P 5350 1850
F 0 "U1" H 5350 2100 50  0000 C CNN
F 1 "LD1117S33TR" H 5350 2050 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5350 1950 50  0001 C CNN
F 3 "" H 5350 1850 50  0001 C CNN
	1    5350 1850
	1    0    0    -1  
$EndComp
Text GLabel 6100 1800 2    60   Input ~ 0
3,3V
Text GLabel 7000 3850 3    60   Input ~ 0
3,3V
Text GLabel 7000 5250 3    60   Input ~ 0
3,3V
Text GLabel 7200 3850 3    60   Input ~ 0
GND
Text GLabel 7200 5250 3    60   Input ~ 0
GND
NoConn ~ 7600 5250
NoConn ~ 7600 3850
Text GLabel 7400 3850 3    60   Input ~ 0
IR1_Out
Text GLabel 7400 5250 3    60   Input ~ 0
IR2_Out
Text GLabel 6600 3850 3    60   Input ~ 0
IR1_Out
Text GLabel 6600 5250 3    60   Input ~ 0
IR2_Out
$Comp
L CONN_01X01_MALE J31
U 1 1 5A9D5724
P 6600 3550
F 0 "J31" H 6600 3625 50  0000 C CNN
F 1 "IR1_Out_RPi" H 6600 3450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 6600 3550 50  0001 C CNN
F 3 "" H 6600 3550 50  0001 C CNN
	1    6600 3550
	0    1    1    0   
$EndComp
$Comp
L CONN_01X01_MALE J32
U 1 1 5A9D6226
P 6600 4950
F 0 "J32" H 6600 5025 50  0000 C CNN
F 1 "IR2_Out_RPi" H 6600 4850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 6600 4950 50  0001 C CNN
F 3 "" H 6600 4950 50  0001 C CNN
	1    6600 4950
	0    1    1    0   
$EndComp
$Comp
L CP C12
U 1 1 5A9D885F
P 4900 2050
F 0 "C12" H 4925 2150 50  0000 L CNN
F 1 "33uF / 63V" H 4800 1950 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D6.3mm_P2.50mm" H 4938 1900 50  0001 C CNN
F 3 "" H 4900 2050 50  0001 C CNN
	1    4900 2050
	1    0    0    -1  
$EndComp
$Comp
L CP C9
U 1 1 5A9D9C6B
P 950 1750
F 0 "C9" H 975 1850 50  0000 L CNN
F 1 "1000 uF / 25V" H 600 1650 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 988 1600 50  0001 C CNN
F 3 "" H 950 1750 50  0001 C CNN
	1    950  1750
	1    0    0    -1  
$EndComp
Text GLabel 900  1550 0    60   Input ~ 0
7,4V
Text GLabel 900  1950 0    60   Input ~ 0
GND
Wire Wire Line
	900  1550 950  1550
Wire Wire Line
	950  1550 950  1600
Wire Wire Line
	900  1950 950  1950
Wire Wire Line
	950  1950 950  1900
$Comp
L CP C10
U 1 1 5A9E0CFF
P 2800 2550
F 0 "C10" H 2825 2650 50  0000 L CNN
F 1 "1000 uF / 25V" H 2700 2450 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 2838 2400 50  0001 C CNN
F 3 "" H 2800 2550 50  0001 C CNN
	1    2800 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2350 2800 2400
Connection ~ 2400 2350
Wire Wire Line
	2800 2750 2800 2700
Connection ~ 2400 2750
$Comp
L C C11
U 1 1 5A9E804A
P 4650 2050
F 0 "C11" H 4675 2150 50  0000 L CNN
F 1 "100nF / 50V" H 4150 2150 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4688 1900 50  0001 C CNN
F 3 "" H 4650 2050 50  0001 C CNN
	1    4650 2050
	1    0    0    -1  
$EndComp
$Comp
L C C14
U 1 1 5A9E8242
P 6050 2050
F 0 "C14" H 6075 2150 50  0000 L CNN
F 1 "100nF / 50V" H 6150 2050 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6088 1900 50  0001 C CNN
F 3 "" H 6050 2050 50  0001 C CNN
	1    6050 2050
	1    0    0    -1  
$EndComp
$Comp
L CP C13
U 1 1 5A9EB2C3
P 5800 2050
F 0 "C13" H 5825 2150 50  0000 L CNN
F 1 "33uF / 63V" H 5450 1950 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D6.3mm_P2.50mm" H 5838 1900 50  0001 C CNN
F 3 "" H 5800 2050 50  0001 C CNN
	1    5800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1800 4600 1800
Wire Wire Line
	4650 1900 4650 1800
Connection ~ 4650 1800
Wire Wire Line
	4900 1900 4900 1800
Connection ~ 4900 1800
Wire Wire Line
	4650 2200 4650 2250
Wire Wire Line
	4650 2250 6050 2250
Wire Wire Line
	5350 2100 5350 2300
Wire Wire Line
	4900 2200 4900 2250
Connection ~ 4900 2250
Connection ~ 5350 2250
Wire Wire Line
	5800 2250 5800 2200
Wire Wire Line
	6050 2250 6050 2200
Connection ~ 5800 2250
Wire Wire Line
	6050 1900 6050 1800
Wire Wire Line
	5750 1800 6100 1800
Wire Wire Line
	5800 1900 5800 1800
Connection ~ 6050 1800
Connection ~ 5800 1800
$Comp
L CONN_01X04_FEMALE J25
U 1 1 5AA21634
P -1350 4750
F 0 "J25" H -1350 5150 50  0000 C CNN
F 1 "Enkoder1" H -1250 4350 50  0000 C CNN
F 2 "Connectors_JST:JST_EH_B04B-EH-A_04x2.50mm_Straight" H -1350 5050 50  0001 C CNN
F 3 "" H -1350 5050 50  0001 C CNN
	1    -1350 4750
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X04_FEMALE J14
U 1 1 5AA23CE2
P -4900 4800
F 0 "J14" H -4900 5200 50  0000 C CNN
F 1 "Enkoder2" H -4800 4400 50  0000 C CNN
F 2 "Connectors_JST:JST_EH_B04B-EH-A_04x2.50mm_Straight" H -4900 5100 50  0001 C CNN
F 3 "" H -4900 5100 50  0001 C CNN
	1    -4900 4800
	-1   0    0    1   
$EndComp
Text GLabel -1250 5050 2    60   Input ~ 0
3,3V
Text GLabel -1250 4450 2    60   Input ~ 0
GND
Text GLabel -1250 4650 2    60   Input ~ 0
EnkoderA1_RAW
Text GLabel -1250 4850 2    60   Input ~ 0
EnkoderB1_RAW
Text GLabel -4800 4700 2    60   Input ~ 0
EnkoderA2_RAW
Text GLabel -4800 4900 2    60   Input ~ 0
EnkoderB2_RAW
Text GLabel -4800 4500 2    60   Input ~ 0
GND
Text GLabel -4800 5100 2    60   Input ~ 0
3,3V
$Comp
L R R6
U 1 1 5AA2AC76
P -5050 5650
F 0 "R6" V -4970 5650 50  0000 C CNN
F 1 "2,2k" V -5050 5650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V -5120 5650 50  0001 C CNN
F 3 "" H -5050 5650 50  0001 C CNN
	1    -5050 5650
	1    0    0    -1  
$EndComp
Text GLabel -5100 5450 0    60   Input ~ 0
3,3V
Text GLabel -5100 5900 0    60   Input ~ 0
EnkoderA2_RAW
$Comp
L R R18
U 1 1 5AA2BF2F
P -4650 5900
F 0 "R18" V -4570 5900 50  0000 C CNN
F 1 "1k" V -4650 5900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V -4720 5900 50  0001 C CNN
F 3 "" H -4650 5900 50  0001 C CNN
	1    -4650 5900
	0    1    1    0   
$EndComp
$Comp
L C C5
U 1 1 5AA2CAC1
P -4350 6500
F 0 "C5" H -4325 6600 50  0000 L CNN
F 1 "20 nF" H -4325 6400 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_Tantal_D5.0mm_P2.50mm" H -4312 6350 50  0001 C CNN
F 3 "" H -4350 6500 50  0001 C CNN
	1    -4350 6500
	1    0    0    -1  
$EndComp
Text GLabel -4400 6750 0    60   Input ~ 0
GND
Wire Wire Line
	-5100 5450 -5050 5450
Wire Wire Line
	-5050 5450 -5050 5500
Wire Wire Line
	-4350 6650 -4350 6750
Wire Wire Line
	-4350 6750 -4400 6750
Text GLabel -4250 5900 2    60   Input ~ 0
EnkoderA2
Text GLabel -5150 6450 0    60   Input ~ 0
EnkoderA2
$Comp
L CONN_01X01_MALE J5
U 1 1 5AA32D2C
P -5450 6650
F 0 "J5" H -5450 6725 50  0000 C CNN
F 1 "EnkoderA2_RPi" H -5450 6550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H -5450 6650 50  0001 C CNN
F 3 "" H -5450 6650 50  0001 C CNN
	1    -5450 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	-5150 6650 -5100 6650
Wire Wire Line
	-5100 6650 -5100 6450
Wire Wire Line
	-5100 6450 -5150 6450
Text GLabel 4400 3350 2    60   Input ~ 0
MotorA_1
Text GLabel 4400 3750 2    60   Input ~ 0
MotorA_2
Text GLabel 4400 3850 2    60   Input ~ 0
MotorB_1
Text GLabel 4400 4250 2    60   Input ~ 0
MotorB_2
Connection ~ 4100 3850
Connection ~ 4100 4250
Connection ~ 4100 3750
Connection ~ 4100 3350
$Comp
L CONN_01X02 J19
U 1 1 5AA5C444
P -4150 6200
F 0 "J19" H -4150 6350 50  0000 C CNN
F 1 "Zworka" V -4050 6200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -4150 6200 50  0001 C CNN
F 3 "" H -4150 6200 50  0001 C CNN
	1    -4150 6200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 J15
U 1 1 5AA696A2
P -4900 6100
F 0 "J15" H -4900 6250 50  0000 C CNN
F 1 "Zworka" V -4800 6100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -4900 6100 50  0001 C CNN
F 3 "" H -4900 6100 50  0001 C CNN
	1    -4900 6100
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 J17
U 1 1 5AA6C9D2
P -4600 5550
F 0 "J17" H -4600 5700 50  0000 C CNN
F 1 "Zworka" V -4500 5550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -4600 5550 50  0001 C CNN
F 3 "" H -4600 5550 50  0001 C CNN
	1    -4600 5550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-5100 5900 -4950 5900
Wire Wire Line
	-5050 5800 -5050 5900
Connection ~ -5050 5900
Wire Wire Line
	-4850 5900 -4800 5900
Wire Wire Line
	-4500 5900 -4250 5900
Wire Wire Line
	-4550 5750 -4450 5750
Wire Wire Line
	-4450 5750 -4450 5900
Connection ~ -4450 5900
Wire Wire Line
	-4650 5750 -4950 5750
Wire Wire Line
	-4950 5750 -4950 5850
Wire Wire Line
	-4950 5850 -5000 5850
Wire Wire Line
	-5000 5850 -5000 5900
Connection ~ -5000 5900
Wire Wire Line
	-4350 6250 -4350 6350
Wire Wire Line
	-4350 6150 -4350 5900
Connection ~ -4350 5900
Wire Notes Line
	-6100 5250 -3600 5250
Wire Notes Line
	-3600 5250 -3600 6950
Wire Notes Line
	-3600 6950 -6100 6950
Wire Notes Line
	-6100 6950 -6100 5250
$Comp
L R R7
U 1 1 5AA7BA46
P -5050 7500
F 0 "R7" V -4970 7500 50  0000 C CNN
F 1 "2,2k" V -5050 7500 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V -5120 7500 50  0001 C CNN
F 3 "" H -5050 7500 50  0001 C CNN
	1    -5050 7500
	1    0    0    -1  
$EndComp
Text GLabel -5100 7300 0    60   Input ~ 0
3,3V
Text GLabel -5100 7750 0    60   Input ~ 0
EnkoderB2_RAW
$Comp
L R R19
U 1 1 5AA7BA4E
P -4650 7750
F 0 "R19" V -4570 7750 50  0000 C CNN
F 1 "1k" V -4650 7750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V -4720 7750 50  0001 C CNN
F 3 "" H -4650 7750 50  0001 C CNN
	1    -4650 7750
	0    1    1    0   
$EndComp
$Comp
L C C6
U 1 1 5AA7BA54
P -4350 8350
F 0 "C6" H -4325 8450 50  0000 L CNN
F 1 "20 nF" H -4325 8250 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_Tantal_D5.0mm_P2.50mm" H -4312 8200 50  0001 C CNN
F 3 "" H -4350 8350 50  0001 C CNN
	1    -4350 8350
	1    0    0    -1  
$EndComp
Text GLabel -4400 8600 0    60   Input ~ 0
GND
Wire Wire Line
	-5100 7300 -5050 7300
Wire Wire Line
	-5050 7300 -5050 7350
Wire Wire Line
	-4350 8500 -4350 8600
Wire Wire Line
	-4350 8600 -4400 8600
Text GLabel -4250 7750 2    60   Input ~ 0
EnkoderB2
Text GLabel -5150 8300 0    60   Input ~ 0
EnkoderB2
$Comp
L CONN_01X01_MALE J12
U 1 1 5AA7BA61
P -5450 8500
F 0 "J12" H -5450 8575 50  0000 C CNN
F 1 "EnkoderB2_RPi" H -5450 8400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H -5450 8500 50  0001 C CNN
F 3 "" H -5450 8500 50  0001 C CNN
	1    -5450 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-5150 8500 -5100 8500
Wire Wire Line
	-5100 8500 -5100 8300
Wire Wire Line
	-5100 8300 -5150 8300
$Comp
L CONN_01X02 J20
U 1 1 5AA7BA6A
P -4150 8050
F 0 "J20" H -4150 8200 50  0000 C CNN
F 1 "Zworka" V -4050 8050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -4150 8050 50  0001 C CNN
F 3 "" H -4150 8050 50  0001 C CNN
	1    -4150 8050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 J16
U 1 1 5AA7BA70
P -4900 7950
F 0 "J16" H -4900 8100 50  0000 C CNN
F 1 "Zworka" V -4800 7950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -4900 7950 50  0001 C CNN
F 3 "" H -4900 7950 50  0001 C CNN
	1    -4900 7950
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 J18
U 1 1 5AA7BA76
P -4600 7400
F 0 "J18" H -4600 7550 50  0000 C CNN
F 1 "Zworka" V -4500 7400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -4600 7400 50  0001 C CNN
F 3 "" H -4600 7400 50  0001 C CNN
	1    -4600 7400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-5100 7750 -4950 7750
Wire Wire Line
	-5050 7650 -5050 7750
Connection ~ -5050 7750
Wire Wire Line
	-4850 7750 -4800 7750
Wire Wire Line
	-4500 7750 -4250 7750
Wire Wire Line
	-4550 7600 -4450 7600
Wire Wire Line
	-4450 7600 -4450 7750
Connection ~ -4450 7750
Wire Wire Line
	-4650 7600 -4950 7600
Wire Wire Line
	-4950 7600 -4950 7700
Wire Wire Line
	-4950 7700 -5000 7700
Wire Wire Line
	-5000 7700 -5000 7750
Connection ~ -5000 7750
Wire Wire Line
	-4350 8100 -4350 8200
Wire Wire Line
	-4350 8000 -4350 7750
Connection ~ -4350 7750
Wire Notes Line
	-6100 7100 -3600 7100
Wire Notes Line
	-3600 7100 -3600 8800
Wire Notes Line
	-3600 8800 -6100 8800
Wire Notes Line
	-6100 8800 -6100 7100
$Comp
L R R20
U 1 1 5AA80255
P -1550 5650
F 0 "R20" V -1470 5650 50  0000 C CNN
F 1 "2,2k" V -1550 5650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V -1620 5650 50  0001 C CNN
F 3 "" H -1550 5650 50  0001 C CNN
	1    -1550 5650
	1    0    0    -1  
$EndComp
Text GLabel -1600 5450 0    60   Input ~ 0
3,3V
Text GLabel -1600 5900 0    60   Input ~ 0
EnkoderA1_RAW
$Comp
L R R22
U 1 1 5AA8025D
P -1150 5900
F 0 "R22" V -1070 5900 50  0000 C CNN
F 1 "1k" V -1150 5900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V -1220 5900 50  0001 C CNN
F 3 "" H -1150 5900 50  0001 C CNN
	1    -1150 5900
	0    1    1    0   
$EndComp
$Comp
L C C7
U 1 1 5AA80263
P -850 6500
F 0 "C7" H -825 6600 50  0000 L CNN
F 1 "20 nF" H -825 6400 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_Tantal_D5.0mm_P2.50mm" H -812 6350 50  0001 C CNN
F 3 "" H -850 6500 50  0001 C CNN
	1    -850 6500
	1    0    0    -1  
$EndComp
Text GLabel -900 6750 0    60   Input ~ 0
GND
Wire Wire Line
	-1600 5450 -1550 5450
Wire Wire Line
	-1550 5450 -1550 5500
Wire Wire Line
	-850 6650 -850 6750
Wire Wire Line
	-850 6750 -900 6750
Text GLabel -750 5900 2    60   Input ~ 0
EnkoderA1
Text GLabel -1650 6450 0    60   Input ~ 0
EnkoderA1
$Comp
L CONN_01X01_MALE J21
U 1 1 5AA80270
P -1950 6650
F 0 "J21" H -1950 6725 50  0000 C CNN
F 1 "EnkoderA1_RPi" H -1950 6550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H -1950 6650 50  0001 C CNN
F 3 "" H -1950 6650 50  0001 C CNN
	1    -1950 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 6650 -1600 6650
Wire Wire Line
	-1600 6650 -1600 6450
Wire Wire Line
	-1600 6450 -1650 6450
$Comp
L CONN_01X02 J29
U 1 1 5AA80279
P -650 6200
F 0 "J29" H -650 6350 50  0000 C CNN
F 1 "Zworka" V -550 6200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -650 6200 50  0001 C CNN
F 3 "" H -650 6200 50  0001 C CNN
	1    -650 6200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 J23
U 1 1 5AA8027F
P -1400 6100
F 0 "J23" H -1400 6250 50  0000 C CNN
F 1 "Zworka" V -1300 6100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -1400 6100 50  0001 C CNN
F 3 "" H -1400 6100 50  0001 C CNN
	1    -1400 6100
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 J26
U 1 1 5AA80285
P -1100 5550
F 0 "J26" H -1100 5700 50  0000 C CNN
F 1 "Zworka" V -1000 5550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -1100 5550 50  0001 C CNN
F 3 "" H -1100 5550 50  0001 C CNN
	1    -1100 5550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-1600 5900 -1450 5900
Wire Wire Line
	-1550 5800 -1550 5900
Connection ~ -1550 5900
Wire Wire Line
	-1350 5900 -1300 5900
Wire Wire Line
	-1000 5900 -750 5900
Wire Wire Line
	-1050 5750 -950 5750
Wire Wire Line
	-950 5750 -950 5900
Connection ~ -950 5900
Wire Wire Line
	-1150 5750 -1450 5750
Wire Wire Line
	-1450 5750 -1450 5850
Wire Wire Line
	-1450 5850 -1500 5850
Wire Wire Line
	-1500 5850 -1500 5900
Connection ~ -1500 5900
Wire Wire Line
	-850 6250 -850 6350
Wire Wire Line
	-850 6150 -850 5900
Connection ~ -850 5900
Wire Notes Line
	-2600 5250 -100 5250
Wire Notes Line
	-100 5250 -100 6950
Wire Notes Line
	-100 6950 -2600 6950
Wire Notes Line
	-2600 6950 -2600 5250
$Comp
L R R21
U 1 1 5AA884D7
P -1550 7500
F 0 "R21" V -1470 7500 50  0000 C CNN
F 1 "2,2k" V -1550 7500 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V -1620 7500 50  0001 C CNN
F 3 "" H -1550 7500 50  0001 C CNN
	1    -1550 7500
	1    0    0    -1  
$EndComp
Text GLabel -1600 7300 0    60   Input ~ 0
3,3V
Text GLabel -1600 7750 0    60   Input ~ 0
EnkoderB1_RAW
$Comp
L R R23
U 1 1 5AA884DF
P -1150 7750
F 0 "R23" V -1070 7750 50  0000 C CNN
F 1 "1k" V -1150 7750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V -1220 7750 50  0001 C CNN
F 3 "" H -1150 7750 50  0001 C CNN
	1    -1150 7750
	0    1    1    0   
$EndComp
$Comp
L C C8
U 1 1 5AA884E5
P -850 8350
F 0 "C8" H -825 8450 50  0000 L CNN
F 1 "20 nF" H -825 8250 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_Tantal_D5.0mm_P2.50mm" H -812 8200 50  0001 C CNN
F 3 "" H -850 8350 50  0001 C CNN
	1    -850 8350
	1    0    0    -1  
$EndComp
Text GLabel -900 8600 0    60   Input ~ 0
GND
Wire Wire Line
	-1600 7300 -1550 7300
Wire Wire Line
	-1550 7300 -1550 7350
Wire Wire Line
	-850 8500 -850 8600
Wire Wire Line
	-850 8600 -900 8600
Text GLabel -750 7750 2    60   Input ~ 0
EnkoderB1
Text GLabel -1650 8300 0    60   Input ~ 0
EnkoderB1
$Comp
L CONN_01X01_MALE J22
U 1 1 5AA884F2
P -1950 8500
F 0 "J22" H -1950 8575 50  0000 C CNN
F 1 "EnkoderB1_RPi" H -1950 8400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H -1950 8500 50  0001 C CNN
F 3 "" H -1950 8500 50  0001 C CNN
	1    -1950 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 8500 -1600 8500
Wire Wire Line
	-1600 8500 -1600 8300
Wire Wire Line
	-1600 8300 -1650 8300
$Comp
L CONN_01X02 J30
U 1 1 5AA884FB
P -650 8050
F 0 "J30" H -650 8200 50  0000 C CNN
F 1 "Zworka" V -550 8050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -650 8050 50  0001 C CNN
F 3 "" H -650 8050 50  0001 C CNN
	1    -650 8050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 J24
U 1 1 5AA88501
P -1400 7950
F 0 "J24" H -1400 8100 50  0000 C CNN
F 1 "Zworka" V -1300 7950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -1400 7950 50  0001 C CNN
F 3 "" H -1400 7950 50  0001 C CNN
	1    -1400 7950
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 J27
U 1 1 5AA88507
P -1100 7400
F 0 "J27" H -1100 7550 50  0000 C CNN
F 1 "Zworka" V -1000 7400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -1100 7400 50  0001 C CNN
F 3 "" H -1100 7400 50  0001 C CNN
	1    -1100 7400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-1600 7750 -1450 7750
Wire Wire Line
	-1550 7650 -1550 7750
Connection ~ -1550 7750
Wire Wire Line
	-1350 7750 -1300 7750
Wire Wire Line
	-1000 7750 -750 7750
Wire Wire Line
	-1050 7600 -950 7600
Wire Wire Line
	-950 7600 -950 7750
Connection ~ -950 7750
Wire Wire Line
	-1150 7600 -1450 7600
Wire Wire Line
	-1450 7600 -1450 7700
Wire Wire Line
	-1450 7700 -1500 7700
Wire Wire Line
	-1500 7700 -1500 7750
Connection ~ -1500 7750
Wire Wire Line
	-850 8100 -850 8200
Wire Wire Line
	-850 8000 -850 7750
Connection ~ -850 7750
Wire Notes Line
	-2600 7100 -100 7100
Wire Notes Line
	-100 7100 -100 8800
Wire Notes Line
	-100 8800 -2600 8800
Wire Notes Line
	-2600 8800 -2600 7100
Text GLabel 3900 950  0    60   Input ~ 0
GND_JST
Text GLabel 3900 1150 0    60   Input ~ 0
7,4V_RAW_JST
Text GLabel 700  250  2    60   Input ~ 0
3,3V
$Comp
L PWR_FLAG #FLG1
U 1 1 5AABFAA3
P 600 200
F 0 "#FLG1" H 600 275 50  0001 C CNN
F 1 "PWR_FLAG" H 600 350 50  0000 C CNN
F 2 "" H 600 200 50  0001 C CNN
F 3 "" H 600 200 50  0001 C CNN
	1    600  200 
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  250  600  250 
Wire Wire Line
	600  250  600  200 
Wire Wire Line
	1300 250  1150 250 
Wire Wire Line
	1150 250  1150 200 
Text GLabel 8450 750  0    60   Input ~ 0
7,4V
$Comp
L R R25
U 1 1 5AAE2CD6
P 8550 1400
F 0 "R25" V 8630 1400 50  0000 C CNN
F 1 "1k" V 8550 1400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8480 1400 50  0001 C CNN
F 3 "" H 8550 1400 50  0001 C CNN
	1    8550 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 750  8550 750 
Wire Wire Line
	8550 750  8550 850 
$Comp
L R R24
U 1 1 5AAE500C
P 8550 1000
F 0 "R24" V 8630 1000 50  0000 C CNN
F 1 "2k" V 8550 1000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8480 1000 50  0001 C CNN
F 3 "" H 8550 1000 50  0001 C CNN
	1    8550 1000
	1    0    0    -1  
$EndComp
Text GLabel 8500 1650 0    60   Input ~ 0
GND
Wire Wire Line
	8500 1650 8550 1650
Wire Wire Line
	8550 1650 8550 1550
Wire Wire Line
	8550 1250 8550 1150
Text GLabel 8650 1200 2    60   Input ~ 0
NapiecieAkumulatora
Wire Wire Line
	8650 1200 8550 1200
Connection ~ 8550 1200
Text GLabel 9750 1350 0    60   Input ~ 0
NapiecieAkumulatora
$Comp
L CONN_01X01_MALE J40
U 1 1 5AAE9B7C
P 9500 1550
F 0 "J40" H 9500 1625 50  0000 C CNN
F 1 "NapiecieAkumulatora_RPi" H 9500 1450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 9500 1550 50  0001 C CNN
F 3 "" H 9500 1550 50  0001 C CNN
	1    9500 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1550 9850 1550
Wire Wire Line
	9850 1550 9850 1350
Wire Wire Line
	9850 1350 9750 1350
Wire Wire Line
	6450 6250 6450 6400
Wire Wire Line
	6450 6400 6050 6400
Wire Wire Line
	6050 6400 6050 6250
Wire Wire Line
	6050 6250 5850 6250
Wire Wire Line
	4400 6450 4400 6600
Wire Wire Line
	4400 6600 4000 6600
Wire Wire Line
	4000 6600 4000 6450
Wire Wire Line
	4000 6450 3800 6450
Wire Wire Line
	2250 6450 2250 6600
Wire Wire Line
	2250 6600 1850 6600
Wire Wire Line
	1850 6600 1850 6450
Wire Wire Line
	1850 6450 1650 6450
$EndSCHEMATC
