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
$Comp
L clock-module-v2-rescue:LM555-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U1
U 1 1 5B52B53B
P 2000 2100
F 0 "U1" H 2250 2450 50  0000 L CNN
F 1 "LM555" H 1875 2100 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 2000 2100 50  0001 C CNN
F 3 "" H 2000 2100 50  0001 C CNN
	1    2000 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5B52B5B5
P 2600 1650
F 0 "R1" V 2680 1650 50  0000 C CNN
F 1 "1K" V 2600 1650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2530 1650 50  0001 C CNN
F 3 "" H 2600 1650 50  0001 C CNN
	1    2600 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5B52B5E8
P 4200 1650
F 0 "R3" V 4280 1650 50  0000 C CNN
F 1 "1K" V 4200 1650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4130 1650 50  0001 C CNN
F 3 "" H 4200 1650 50  0001 C CNN
	1    4200 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5B52B608
P 7350 1650
F 0 "R6" V 7430 1650 50  0000 C CNN
F 1 "1K" V 7350 1650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7280 1650 50  0001 C CNN
F 3 "" H 7350 1650 50  0001 C CNN
	1    7350 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5B52B629
P 7100 1650
F 0 "R5" V 7180 1650 50  0000 C CNN
F 1 "1K" V 7100 1650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7030 1650 50  0001 C CNN
F 3 "" H 7100 1650 50  0001 C CNN
	1    7100 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5B52B6A4
P 5500 1650
F 0 "R4" V 5580 1650 50  0000 C CNN
F 1 "1M" V 5500 1650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5430 1650 50  0001 C CNN
F 3 "" H 5500 1650 50  0001 C CNN
	1    5500 1650
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:POT-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue RV1
U 1 1 5B52B6D7
P 3150 2200
F 0 "RV1" V 2975 2200 50  0000 C CNN
F 1 "1M" V 3050 2200 50  0000 C CNN
F 2 "8bit-custom-footprints:Potentiometer-5.5mm" H 3150 2200 50  0001 C CNN
F 3 "" H 3150 2200 50  0001 C CNN
	1    3150 2200
	-1   0    0    1   
$EndComp
$Comp
L Device:C C5
U 1 1 5B52B714
P 1200 2800
F 0 "C5" H 1225 2900 50  0000 L CNN
F 1 "0.01µF" H 1225 2700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1238 2650 50  0001 C CNN
F 3 "" H 1200 2800 50  0001 C CNN
	1    1200 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5B52B758
P 4150 2550
F 0 "C2" H 4175 2650 50  0000 L CNN
F 1 "0.01µF" H 4175 2450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4188 2400 50  0001 C CNN
F 3 "" H 4150 2550 50  0001 C CNN
	1    4150 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5B52B78B
P 7400 2600
F 0 "C4" H 7425 2700 50  0000 L CNN
F 1 "0.01µF" H 7425 2500 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 7438 2450 50  0001 C CNN
F 3 "" H 7400 2600 50  0001 C CNN
	1    7400 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5B52B7C1
P 5500 2550
F 0 "C3" H 5525 2650 50  0000 L CNN
F 1 "0.1µF" H 5525 2450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 5538 2400 50  0001 C CNN
F 3 "" H 5500 2550 50  0001 C CNN
	1    5500 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C6
U 1 1 5B52B85D
P 1550 2800
F 0 "C6" H 1575 2900 50  0000 L CNN
F 1 "1µF" H 1575 2700 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 1550 2800 50  0001 C CNN
F 3 "" H 1550 2800 50  0001 C CNN
	1    1550 2800
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS04-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U4
U 1 1 5B52B95A
P 3000 4900
F 0 "U4" H 3195 5015 50  0000 C CNN
F 1 "74LS04" H 3190 4775 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3000 4900 50  0001 C CNN
F 3 "" H 3000 4900 50  0001 C CNN
	1    3000 4900
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS08-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U5
U 1 1 5B52B9AD
P 4200 4200
F 0 "U5" H 4200 4250 50  0000 C CNN
F 1 "74LS08" H 4200 4150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4200 4200 50  0001 C CNN
F 3 "" H 4200 4200 50  0001 C CNN
	1    4200 4200
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS32-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U6
U 1 1 5B52B9E8
P 5600 4600
F 0 "U6" H 5600 4650 50  0000 C CNN
F 1 "74LS32" H 5600 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5600 4600 50  0001 C CNN
F 3 "" H 5600 4600 50  0001 C CNN
	1    5600 4600
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:SW_SPDT-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue SW2
U 1 1 5B52BA7F
P 6850 2200
F 0 "SW2" H 6850 2370 50  0000 C CNN
F 1 "SW_SPDT" H 6850 2000 50  0000 C CNN
F 2 "8bit-custom-footprints:DPDT-pushbutton" H 6850 2200 50  0001 C CNN
F 3 "" H 6850 2200 50  0001 C CNN
	1    6850 2200
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:SW_Push-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue SW1
U 1 1 5B52BB68
P 3950 1900
F 0 "SW1" H 4000 2000 50  0000 L CNN
F 1 "SW_Push" H 3950 1840 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H5mm" H 3950 2100 50  0001 C CNN
F 3 "" H 3950 2100 50  0001 C CNN
	1    3950 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D1
U 1 1 5B52BC0F
P 7900 5050
F 0 "D1" H 7900 5150 50  0000 C CNN
F 1 "BLUE" H 7900 4950 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 7900 5050 50  0001 C CNN
F 3 "" H 7900 5050 50  0001 C CNN
	1    7900 5050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5B52BC5D
P 7900 5500
F 0 "R7" V 7980 5500 50  0000 C CNN
F 1 "220" V 7900 5500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7830 5500 50  0001 C CNN
F 3 "" H 7900 5500 50  0001 C CNN
	1    7900 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1900 1300 1900
Wire Wire Line
	2550 2300 2500 2300
Wire Wire Line
	1500 2300 1400 2300
Wire Wire Line
	1400 2300 1400 1600
Wire Wire Line
	1400 1600 2000 1600
Wire Wire Line
	2000 1300 2000 1450
Connection ~ 2000 1600
Wire Wire Line
	1500 2100 1200 2100
Wire Wire Line
	1200 2100 1200 2650
Wire Wire Line
	1200 2950 1200 3050
Wire Wire Line
	1200 3050 1550 3050
Wire Wire Line
	2000 3050 2000 2500
Wire Wire Line
	1550 2950 1550 3050
Connection ~ 1550 3050
Wire Wire Line
	2550 2600 2550 2300
Wire Wire Line
	1300 1900 1300 2600
Wire Wire Line
	1300 2600 1550 2600
Wire Wire Line
	1550 2600 1550 2650
Connection ~ 1550 2600
Wire Wire Line
	2500 2100 2600 2100
Wire Wire Line
	2600 1800 2600 2100
Connection ~ 2600 2100
Wire Wire Line
	3150 2600 3150 2350
Connection ~ 2550 2600
$Comp
L power:GND #PWR05
U 1 1 5B52C72E
P 1550 3200
F 0 "#PWR05" H 1550 2950 50  0001 C CNN
F 1 "GND" H 1550 3050 50  0000 C CNN
F 2 "" H 1550 3200 50  0001 C CNN
F 3 "" H 1550 3200 50  0001 C CNN
	1    1550 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1500 2600 1450
Wire Wire Line
	2600 1450 2000 1450
Connection ~ 2000 1450
NoConn ~ 3150 2050
Wire Wire Line
	4150 1900 4200 1900
Wire Wire Line
	4200 1800 4200 1900
Connection ~ 4200 1900
Wire Wire Line
	4200 1450 4350 1450
Wire Wire Line
	4200 1450 4200 1500
Connection ~ 4900 1450
Wire Wire Line
	4350 2300 4350 1450
Connection ~ 4350 1450
Wire Wire Line
	4350 2300 4400 2300
Wire Wire Line
	4400 2100 4150 2100
Wire Wire Line
	4150 2100 4150 2400
Wire Wire Line
	3750 1900 3650 1900
Wire Wire Line
	3650 1900 3650 2800
Wire Wire Line
	3650 2800 4150 2800
Wire Wire Line
	4900 2800 4900 2500
Connection ~ 4150 2800
$Comp
L power:GND #PWR06
U 1 1 5B52D35E
P 4150 2900
F 0 "#PWR06" H 4150 2650 50  0001 C CNN
F 1 "GND" H 4150 2750 50  0000 C CNN
F 2 "" H 4150 2900 50  0001 C CNN
F 3 "" H 4150 2900 50  0001 C CNN
	1    4150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2300 5400 2300
Wire Wire Line
	5500 1800 5500 2100
Wire Wire Line
	5500 2800 5500 2700
Connection ~ 4900 2800
Wire Wire Line
	5400 2100 5500 2100
Connection ~ 5500 2300
Connection ~ 5500 2100
Wire Wire Line
	5500 1450 5500 1500
Wire Wire Line
	7050 2300 7350 2300
Wire Wire Line
	7450 2100 7400 2100
Wire Wire Line
	7400 2100 7400 2450
Wire Wire Line
	6650 2200 6550 2200
Wire Wire Line
	6550 2200 6550 2850
Wire Wire Line
	6550 2850 7400 2850
Wire Wire Line
	7400 2750 7400 2850
Connection ~ 7400 2850
Wire Wire Line
	8550 2850 8550 2300
Wire Wire Line
	8550 2300 8450 2300
Connection ~ 7950 2850
$Comp
L power:GND #PWR07
U 1 1 5B52DF7F
P 7950 2950
F 0 "#PWR07" H 7950 2700 50  0001 C CNN
F 1 "GND" H 7950 2800 50  0000 C CNN
F 2 "" H 7950 2950 50  0001 C CNN
F 3 "" H 7950 2950 50  0001 C CNN
	1    7950 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1800 7350 2300
Connection ~ 7350 2300
Wire Wire Line
	7100 2100 7050 2100
Wire Wire Line
	7100 1800 7100 1900
Wire Wire Line
	7100 1900 7450 1900
Connection ~ 7100 1900
Wire Wire Line
	7100 1500 7100 1450
Wire Wire Line
	7100 1450 7350 1450
Wire Wire Line
	7350 1500 7350 1450
Connection ~ 7350 1450
Connection ~ 7950 1450
NoConn ~ 8450 2100
$Comp
L clock-module-v2-rescue:74LS08-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U5
U 2 1 5B52E719
P 4200 5000
F 0 "U5" H 4200 5050 50  0000 C CNN
F 1 "74LS08" H 4200 4950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4200 5000 50  0001 C CNN
F 3 "" H 4200 5000 50  0001 C CNN
	2    4200 5000
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS08-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U5
U 3 1 5B52E764
P 7000 4700
F 0 "U5" H 7000 4750 50  0000 C CNN
F 1 "74LS08" H 7000 4650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7000 4700 50  0001 C CNN
F 3 "" H 7000 4700 50  0001 C CNN
	3    7000 4700
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS04-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U4
U 4 1 5B52E7BF
P 8800 4250
F 0 "U4" H 8995 4365 50  0000 C CNN
F 1 "74LS04" H 8990 4125 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8800 4250 50  0001 C CNN
F 3 "" H 8800 4250 50  0001 C CNN
	4    8800 4250
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS04-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U4
U 6 1 5B52E82B
P 2250 6000
F 0 "U4" H 2445 6115 50  0000 C CNN
F 1 "74LS04" H 2440 5875 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2250 6000 50  0001 C CNN
F 3 "" H 2250 6000 50  0001 C CNN
	6    2250 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4900 3600 4900
Wire Wire Line
	4800 4200 4900 4200
Wire Wire Line
	4900 4200 4900 4500
Wire Wire Line
	4900 4500 5000 4500
Wire Wire Line
	5000 4700 4900 4700
Wire Wire Line
	4900 4700 4900 5000
Wire Wire Line
	4900 5000 4800 5000
Wire Wire Line
	6200 4600 6400 4600
Wire Wire Line
	6300 4800 6400 4800
Wire Wire Line
	2400 4900 2550 4900
Wire Wire Line
	2400 3700 2400 4300
Wire Wire Line
	2400 4300 3600 4300
Wire Wire Line
	2500 1900 3450 1900
Wire Wire Line
	3450 4100 3600 4100
Wire Wire Line
	5400 1900 5800 1900
Wire Wire Line
	5800 1900 5800 3550
Wire Wire Line
	5800 3550 2150 3550
Wire Wire Line
	2150 3550 2150 5100
Wire Wire Line
	2150 5100 3600 5100
Wire Wire Line
	3450 1900 3450 4100
Wire Wire Line
	2400 3700 8700 3700
Wire Wire Line
	8700 3700 8700 1900
Wire Wire Line
	8700 1900 8450 1900
Connection ~ 2400 4300
Text HLabel 1450 5800 0    60   Input ~ 0
HLT
Wire Wire Line
	1450 5800 2550 5800
Wire Wire Line
	7900 5200 7900 5350
$Comp
L power:GND #PWR08
U 1 1 5B52F95E
P 7900 5800
F 0 "#PWR08" H 7900 5550 50  0001 C CNN
F 1 "GND" H 7900 5650 50  0000 C CNN
F 2 "" H 7900 5800 50  0001 C CNN
F 3 "" H 7900 5800 50  0001 C CNN
	1    7900 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5800 7900 5650
Text HLabel 9700 4700 2    60   Output ~ 0
CLK
Text HLabel 9700 4250 2    60   Output ~ 0
~CLK
Wire Wire Line
	9700 4250 9250 4250
Wire Wire Line
	7600 4700 7900 4700
Wire Wire Line
	7900 4250 7900 4700
Connection ~ 7900 4700
Wire Wire Line
	7900 4250 8350 4250
$Comp
L Device:C C1
U 1 1 5B52B80F
P 9900 1600
F 0 "C1" H 9925 1700 50  0000 L CNN
F 1 "0.1µF" H 9925 1500 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 9938 1450 50  0001 C CNN
F 3 "" H 9900 1600 50  0001 C CNN
	1    9900 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5B52FF03
P 9750 1950
F 0 "#PWR09" H 9750 1700 50  0001 C CNN
F 1 "GND" H 9750 1800 50  0000 C CNN
F 2 "" H 9750 1950 50  0001 C CNN
F 3 "" H 9750 1950 50  0001 C CNN
	1    9750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1750 9900 1850
$Comp
L clock-module-v2-rescue:74LS04-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U4
U 2 1 5B5304B0
P 1700 6650
F 0 "U4" H 1895 6765 50  0000 C CNN
F 1 "74LS04" H 1890 6525 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1700 6650 50  0001 C CNN
F 3 "" H 1700 6650 50  0001 C CNN
	2    1700 6650
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS04-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U4
U 3 1 5B5304FB
P 1700 7050
F 0 "U4" H 1895 7165 50  0000 C CNN
F 1 "74LS04" H 1890 6925 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1700 7050 50  0001 C CNN
F 3 "" H 1700 7050 50  0001 C CNN
	3    1700 7050
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS04-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U4
U 5 1 5B53108F
P 3000 5800
F 0 "U4" H 3195 5915 50  0000 C CNN
F 1 "74LS04" H 3190 5675 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3000 5800 50  0001 C CNN
F 3 "" H 3000 5800 50  0001 C CNN
	5    3000 5800
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS08-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U5
U 4 1 5B53125C
P 4250 5900
F 0 "U5" H 4250 5950 50  0000 C CNN
F 1 "74LS08" H 4250 5850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4250 5900 50  0001 C CNN
F 3 "" H 4250 5900 50  0001 C CNN
	4    4250 5900
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS32-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U6
U 2 1 5B5312F6
P 3000 7400
F 0 "U6" H 3000 7450 50  0000 C CNN
F 1 "74LS32" H 3000 7350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3000 7400 50  0001 C CNN
F 3 "" H 3000 7400 50  0001 C CNN
	2    3000 7400
	1    0    0    -1  
$EndComp
$Comp
L clock-module-v2-rescue:74LS32-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U6
U 3 1 5B5313CF
P 4350 6800
F 0 "U6" H 4350 6850 50  0000 C CNN
F 1 "74LS32" H 4350 6750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4350 6800 50  0001 C CNN
F 3 "" H 4350 6800 50  0001 C CNN
	3    4350 6800
	1    0    0    -1  
$EndComp
NoConn ~ 2150 6650
NoConn ~ 1250 6650
NoConn ~ 1250 7050
NoConn ~ 2150 7050
NoConn ~ 3600 7400
NoConn ~ 2400 7300
NoConn ~ 2400 7500
NoConn ~ 3750 6700
NoConn ~ 3750 6900
NoConn ~ 4950 6800
Wire Wire Line
	7950 2500 7950 2850
Wire Wire Line
	4150 2700 4150 2800
Wire Wire Line
	7950 1300 7950 1450
Wire Wire Line
	4900 1300 4900 1450
$Comp
L power:VCC #PWR010
U 1 1 5B5327A9
P 2000 1300
F 0 "#PWR010" H 2000 1150 50  0001 C CNN
F 1 "VCC" H 2000 1450 50  0000 C CNN
F 2 "" H 2000 1300 50  0001 C CNN
F 3 "" H 2000 1300 50  0001 C CNN
	1    2000 1300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR011
U 1 1 5B532913
P 4900 1300
F 0 "#PWR011" H 4900 1150 50  0001 C CNN
F 1 "VCC" H 4900 1450 50  0000 C CNN
F 2 "" H 4900 1300 50  0001 C CNN
F 3 "" H 4900 1300 50  0001 C CNN
	1    4900 1300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR012
U 1 1 5B532981
P 7950 1300
F 0 "#PWR012" H 7950 1150 50  0001 C CNN
F 1 "VCC" H 7950 1450 50  0000 C CNN
F 2 "" H 7950 1300 50  0001 C CNN
F 3 "" H 7950 1300 50  0001 C CNN
	1    7950 1300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR013
U 1 1 5B5329EF
P 9750 1250
F 0 "#PWR013" H 9750 1100 50  0001 C CNN
F 1 "VCC" H 9750 1400 50  0000 C CNN
F 2 "" H 9750 1250 50  0001 C CNN
F 3 "" H 9750 1250 50  0001 C CNN
	1    9750 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5B625A89
P 2800 2200
F 0 "R2" V 2880 2200 50  0000 C CNN
F 1 "1K" V 2800 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2730 2200 50  0001 C CNN
F 3 "" H 2800 2200 50  0001 C CNN
	1    2800 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 2200 2650 2200
Wire Wire Line
	2950 2200 3000 2200
$Comp
L Device:C C10
U 1 1 5B64C674
P 9600 1600
F 0 "C10" H 9625 1700 50  0000 L CNN
F 1 "0.1µF" H 9625 1500 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 9638 1450 50  0001 C CNN
F 3 "" H 9600 1600 50  0001 C CNN
	1    9600 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1450 9600 1350
Wire Wire Line
	9600 1350 9750 1350
Wire Wire Line
	9900 1350 9900 1450
Wire Wire Line
	9750 1350 9750 1250
Connection ~ 9750 1350
Wire Wire Line
	9600 1750 9600 1850
Wire Wire Line
	9600 1850 9750 1850
Wire Wire Line
	9750 1950 9750 1850
Connection ~ 9750 1850
Wire Wire Line
	2000 1600 2000 1700
Wire Wire Line
	1550 3050 2000 3050
Wire Wire Line
	1550 3050 1550 3200
Wire Wire Line
	1550 2600 2550 2600
Wire Wire Line
	2600 2100 2600 2200
Wire Wire Line
	2550 2600 3150 2600
Wire Wire Line
	2000 1450 2000 1600
Wire Wire Line
	4200 1900 4400 1900
Wire Wire Line
	4900 1450 5500 1450
Wire Wire Line
	4900 1450 4900 1700
Wire Wire Line
	4350 1450 4900 1450
Wire Wire Line
	4150 2800 4900 2800
Wire Wire Line
	4150 2800 4150 2900
Wire Wire Line
	4900 2800 5500 2800
Wire Wire Line
	5500 2300 5500 2400
Wire Wire Line
	5500 2100 5500 2300
Wire Wire Line
	7400 2850 7950 2850
Wire Wire Line
	7950 2850 7950 2950
Wire Wire Line
	7950 2850 8550 2850
Wire Wire Line
	7350 2300 7450 2300
Wire Wire Line
	7100 1900 7100 2100
Wire Wire Line
	7350 1450 7950 1450
Wire Wire Line
	7950 1450 7950 1700
Wire Wire Line
	2400 4300 2400 4900
Wire Wire Line
	7900 4700 9700 4700
Wire Wire Line
	7900 4700 7900 4900
Wire Wire Line
	9750 1350 9900 1350
Wire Wire Line
	9750 1850 9900 1850
NoConn ~ 3750 7500
NoConn ~ 3750 7300
NoConn ~ 4950 7400
Text HLabel 1450 6000 0    50   Input ~ 0
PROG
$Comp
L clock-module-v2-rescue:74LS32-8bit-computer-rescue-8bit-computer-rescue-clock-module-with-prog-halt-rescue U6
U 4 1 5B531491
P 4350 7400
F 0 "U6" H 4350 7450 50  0000 C CNN
F 1 "74LS32" H 4350 7350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4350 7400 50  0001 C CNN
F 3 "" H 4350 7400 50  0001 C CNN
	4    4350 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5800 3650 5800
Wire Wire Line
	4850 5900 6300 5900
Wire Wire Line
	6300 4800 6300 5900
Wire Wire Line
	1450 6000 1800 6000
Wire Wire Line
	2700 6000 3650 6000
$Comp
L Timer:LM556 U2
U 1 1 607D2826
P 4900 2100
F 0 "U2" H 5175 2450 50  0000 C CNN
F 1 "LM556" H 4900 2100 50  0000 C CNN
F 2 "" H 4900 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm556.pdf" H 4900 2100 50  0001 C CNN
	1    4900 2100
	1    0    0    -1  
$EndComp
$Comp
L Timer:LM556 U2
U 2 1 607D78F1
P 7950 2100
F 0 "U2" H 8225 2450 50  0000 C CNN
F 1 "LM556" H 7950 2100 50  0000 C CNN
F 2 "" H 7950 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm556.pdf" H 7950 2100 50  0001 C CNN
	2    7950 2100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
