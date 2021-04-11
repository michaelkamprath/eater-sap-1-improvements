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
L 74xx:74LS245 U?
U 1 1 60A10AE0
P 5275 2200
F 0 "U?" H 5025 2875 50  0000 C CNN
F 1 "74LS245" V 5650 1750 50  0000 C CNN
F 2 "" H 5275 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 5275 2200 50  0001 C CNN
	1    5275 2200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS245 U?
U 1 1 60A12AAF
P 5275 4100
F 0 "U?" H 5025 4775 50  0000 C CNN
F 1 "74LS245" V 5650 3650 50  0000 C CNN
F 2 "" H 5275 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 5275 4100 50  0001 C CNN
	1    5275 4100
	1    0    0    -1  
$EndComp
Text HLabel 4775 1700 0    50   Input ~ 0
A0
Text HLabel 4775 1800 0    50   Input ~ 0
A1
Text HLabel 4775 1900 0    50   Input ~ 0
A2
Text HLabel 4775 2000 0    50   Input ~ 0
A3
Text HLabel 4775 2100 0    50   Input ~ 0
A4
Text HLabel 4775 2200 0    50   Input ~ 0
A5
Text HLabel 4775 2300 0    50   Input ~ 0
A6
Text HLabel 4775 2400 0    50   Input ~ 0
A7
Text HLabel 4775 3600 0    50   Input ~ 0
A8
Text HLabel 4775 3700 0    50   Input ~ 0
A9
Text HLabel 4775 3800 0    50   Input ~ 0
A10
Text HLabel 4775 3900 0    50   Input ~ 0
A11
Text HLabel 4775 4000 0    50   Input ~ 0
A12
Text HLabel 4775 4100 0    50   Input ~ 0
A13
Text HLabel 4775 4200 0    50   Input ~ 0
A14
Text HLabel 4775 4300 0    50   Input ~ 0
A15
Text HLabel 6425 1700 2    50   Output ~ 0
BUS_0
Text HLabel 6425 1800 2    50   Output ~ 0
BUS_1
Text HLabel 6425 1900 2    50   Output ~ 0
BUS_2
Text HLabel 6425 2000 2    50   Output ~ 0
BUS_3
Text HLabel 6425 2100 2    50   Output ~ 0
BUS_4
Text HLabel 6425 2200 2    50   Output ~ 0
BUS_5
Text HLabel 6425 2300 2    50   Output ~ 0
BUS_6
Text HLabel 6425 2400 2    50   Output ~ 0
BUS_7
Wire Wire Line
	5775 1700 5825 1700
Wire Wire Line
	5775 1800 5875 1800
Wire Wire Line
	5775 1900 5925 1900
Wire Wire Line
	5775 2000 5975 2000
Wire Wire Line
	5775 2100 6025 2100
Wire Wire Line
	5775 2200 6075 2200
Wire Wire Line
	5775 2300 6125 2300
Wire Wire Line
	5775 2400 6175 2400
Wire Wire Line
	5775 3600 5825 3600
Wire Wire Line
	5825 3600 5825 1700
Connection ~ 5825 1700
Wire Wire Line
	5825 1700 6425 1700
Wire Wire Line
	5775 3700 5875 3700
Wire Wire Line
	5875 3700 5875 1800
Connection ~ 5875 1800
Wire Wire Line
	5875 1800 6425 1800
Wire Wire Line
	5775 3800 5925 3800
Wire Wire Line
	5925 3800 5925 1900
Connection ~ 5925 1900
Wire Wire Line
	5925 1900 6425 1900
Wire Wire Line
	5775 3900 5975 3900
Wire Wire Line
	5975 3900 5975 2000
Connection ~ 5975 2000
Wire Wire Line
	5975 2000 6425 2000
Wire Wire Line
	5775 4000 6025 4000
Wire Wire Line
	6025 4000 6025 2100
Connection ~ 6025 2100
Wire Wire Line
	6025 2100 6425 2100
Wire Wire Line
	5775 4100 6075 4100
Wire Wire Line
	6075 4100 6075 2200
Connection ~ 6075 2200
Wire Wire Line
	6075 2200 6425 2200
Wire Wire Line
	5775 4200 6125 4200
Wire Wire Line
	6125 4200 6125 2300
Connection ~ 6125 2300
Wire Wire Line
	6125 2300 6425 2300
Wire Wire Line
	5775 4300 6175 4300
Wire Wire Line
	6175 4300 6175 2400
Connection ~ 6175 2400
Wire Wire Line
	6175 2400 6425 2400
$Comp
L 74xx:74LS00 U?
U 1 1 60A45F3A
P 2375 2825
F 0 "U?" H 2375 3150 50  0000 C CNN
F 1 "74LS00" H 2375 3059 50  0000 C CNN
F 2 "" H 2375 2825 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 2375 2825 50  0001 C CNN
	1    2375 2825
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 2 1 60A4F86B
P 2375 3400
F 0 "U?" H 2375 3725 50  0000 C CNN
F 1 "74LS00" H 2375 3634 50  0000 C CNN
F 2 "" H 2375 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 2375 3400 50  0001 C CNN
	2    2375 3400
	1    0    0    -1  
$EndComp
Text HLabel 825  3300 0    50   Input ~ 0
ABo
Text HLabel 825  3500 0    50   Input ~ 0
HI~LO~
$Comp
L 74xx:74LS04 U?
U 1 1 60A53705
P 1675 2925
F 0 "U?" H 1775 3050 50  0000 C CNN
F 1 "74LS04" H 1825 2800 50  0000 C CNN
F 2 "" H 1675 2925 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1675 2925 50  0001 C CNN
	1    1675 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	2075 3500 1200 3500
Wire Wire Line
	2075 3300 1000 3300
Wire Wire Line
	1200 3500 1200 2925
Wire Wire Line
	1200 2925 1375 2925
Connection ~ 1200 3500
Wire Wire Line
	1200 3500 825  3500
Wire Wire Line
	1975 2925 2075 2925
Wire Wire Line
	1000 3300 1000 2725
Wire Wire Line
	1000 2725 2075 2725
Connection ~ 1000 3300
Wire Wire Line
	1000 3300 825  3300
Wire Wire Line
	2675 2825 3775 2825
Wire Wire Line
	3775 2825 3775 2700
Wire Wire Line
	3775 2700 4775 2700
Wire Wire Line
	2675 3400 3775 3400
Wire Wire Line
	3775 3400 3775 4600
Wire Wire Line
	3775 4600 4775 4600
$Comp
L power:GND #PWR?
U 1 1 60A5C6CC
P 5125 3000
F 0 "#PWR?" H 5125 2750 50  0001 C CNN
F 1 "GND" H 5130 2827 50  0000 C CNN
F 2 "" H 5125 3000 50  0001 C CNN
F 3 "" H 5125 3000 50  0001 C CNN
	1    5125 3000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60A5CBD2
P 5275 1400
F 0 "#PWR?" H 5275 1250 50  0001 C CNN
F 1 "VCC" H 5290 1573 50  0000 C CNN
F 2 "" H 5275 1400 50  0001 C CNN
F 3 "" H 5275 1400 50  0001 C CNN
	1    5275 1400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60A5D6CD
P 5425 3300
F 0 "#PWR?" H 5425 3150 50  0001 C CNN
F 1 "VCC" H 5440 3473 50  0000 C CNN
F 2 "" H 5425 3300 50  0001 C CNN
F 3 "" H 5425 3300 50  0001 C CNN
	1    5425 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5275 3000 5125 3000
Wire Wire Line
	5275 3300 5425 3300
$Comp
L power:VCC #PWR?
U 1 1 60A602A3
P 4400 2600
F 0 "#PWR?" H 4400 2450 50  0001 C CNN
F 1 "VCC" H 4415 2773 50  0000 C CNN
F 2 "" H 4400 2600 50  0001 C CNN
F 3 "" H 4400 2600 50  0001 C CNN
	1    4400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2600 4775 2600
$Comp
L power:VCC #PWR?
U 1 1 60A61698
P 4450 4500
F 0 "#PWR?" H 4450 4350 50  0001 C CNN
F 1 "VCC" H 4465 4673 50  0000 C CNN
F 2 "" H 4450 4500 50  0001 C CNN
F 3 "" H 4450 4500 50  0001 C CNN
	1    4450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4500 4775 4500
$Comp
L power:GND #PWR?
U 1 1 60A62B6E
P 5275 4900
F 0 "#PWR?" H 5275 4650 50  0001 C CNN
F 1 "GND" H 5280 4727 50  0000 C CNN
F 2 "" H 5275 4900 50  0001 C CNN
F 3 "" H 5275 4900 50  0001 C CNN
	1    5275 4900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
