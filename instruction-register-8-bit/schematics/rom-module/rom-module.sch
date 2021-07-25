EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ROM Module"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Memory_EEPROM:28C256 U?
U 1 1 612FE2F8
P 5625 2900
F 0 "U?" V 5875 3925 50  0000 L CNN
F 1 "28C256" V 5625 2750 50  0000 L CNN
F 2 "" H 5625 2900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 5625 2900 50  0001 C CNN
	1    5625 2900
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS245 U?
U 1 1 6130142A
P 6025 5075
F 0 "U?" V 5979 5919 50  0000 L CNN
F 1 "74LS245" V 6070 5919 50  0000 L CNN
F 2 "" H 6025 5075 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 6025 5075 50  0001 C CNN
	1    6025 5075
	0    1    1    0   
$EndComp
Text HLabel 6525 5800 3    50   Output ~ 0
BUS_0
Text HLabel 6425 5800 3    50   Output ~ 0
BUS_1
Text HLabel 6325 5800 3    50   Output ~ 0
BUS_2
Text HLabel 6225 5800 3    50   Output ~ 0
BUS_3
Text HLabel 6125 5800 3    50   Output ~ 0
BUS_4
Text HLabel 6025 5800 3    50   Output ~ 0
BUS_5
Text HLabel 5925 5800 3    50   Output ~ 0
BUS_6
Text HLabel 5825 5800 3    50   Output ~ 0
BUS_7
Wire Wire Line
	6525 5575 6525 5800
Wire Wire Line
	6425 5575 6425 5800
Wire Wire Line
	6325 5575 6325 5800
Wire Wire Line
	6225 5575 6225 5800
Wire Wire Line
	6125 5575 6125 5800
Wire Wire Line
	6025 5575 6025 5800
Wire Wire Line
	5925 5575 5925 5800
Wire Wire Line
	5825 5575 5825 5800
Wire Wire Line
	6525 3300 6525 3375
Wire Wire Line
	6425 4575 6425 3475
Wire Wire Line
	6325 3300 6325 3575
Wire Wire Line
	6225 4575 6225 3675
Wire Wire Line
	6125 3300 6125 3775
Wire Wire Line
	6025 4575 6025 3875
Wire Wire Line
	5925 3300 5925 3975
Wire Wire Line
	5825 4575 5825 4075
Text HLabel 6525 2100 1    50   Input ~ 0
A0
Text HLabel 6425 2100 1    50   Input ~ 0
A1
Text HLabel 6325 2100 1    50   Input ~ 0
A2
Text HLabel 6225 2100 1    50   Input ~ 0
A3
Text HLabel 6125 2100 1    50   Input ~ 0
A4
Text HLabel 6025 2100 1    50   Input ~ 0
A5
Text HLabel 5925 2100 1    50   Input ~ 0
A6
Text HLabel 5825 2100 1    50   Input ~ 0
A7
Text HLabel 5725 2100 1    50   Input ~ 0
A8
Text HLabel 5625 2100 1    50   Input ~ 0
A9
Text HLabel 5525 2100 1    50   Input ~ 0
A10
Text HLabel 5425 2100 1    50   Input ~ 0
A11
Text HLabel 5325 2100 1    50   Input ~ 0
A12
Text HLabel 5225 2100 1    50   Input ~ 0
A13
Text HLabel 5125 2100 1    50   Input ~ 0
A14
Wire Wire Line
	6525 2500 6525 2100
Wire Wire Line
	6425 2100 6425 2500
Wire Wire Line
	6325 2100 6325 2500
Wire Wire Line
	6225 2100 6225 2500
Wire Wire Line
	6125 2500 6125 2100
Wire Wire Line
	6025 2100 6025 2500
Wire Wire Line
	5925 2500 5925 2100
Wire Wire Line
	5825 2100 5825 2500
Wire Wire Line
	5725 2500 5725 2100
Wire Wire Line
	5625 2100 5625 2500
Wire Wire Line
	5525 2500 5525 2100
Wire Wire Line
	5425 2100 5425 2500
Wire Wire Line
	5325 2500 5325 2100
Wire Wire Line
	5225 2100 5225 2500
Wire Wire Line
	5125 2500 5125 2100
$Comp
L 74xx:74LS08 U?
U 1 1 6131C20E
P 2650 3875
F 0 "U?" H 2650 4200 50  0000 C CNN
F 1 "74LS08" H 2650 4109 50  0000 C CNN
F 2 "" H 2650 3875 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2650 3875 50  0001 C CNN
	1    2650 3875
	1    0    0    -1  
$EndComp
Text HLabel 1275 3775 0    50   Input ~ 0
~ROMe
Text HLabel 1275 3975 0    50   Input ~ 0
MDo
$Comp
L 74xx:74LS04 U?
U 1 1 6132310A
P 2000 3775
F 0 "U?" H 2000 4092 50  0000 C CNN
F 1 "74LS04" H 2000 4001 50  0000 C CNN
F 2 "" H 2000 3775 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2000 3775 50  0001 C CNN
	1    2000 3775
	1    0    0    -1  
$EndComp
Wire Wire Line
	1275 3975 2350 3975
Wire Wire Line
	2300 3775 2350 3775
Wire Wire Line
	1275 3775 1500 3775
$Comp
L 74xx:74LS04 U?
U 2 1 61326698
P 3325 3875
F 0 "U?" H 3325 4192 50  0000 C CNN
F 1 "74LS04" H 3325 4101 50  0000 C CNN
F 2 "" H 3325 3875 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3325 3875 50  0001 C CNN
	2    3325 3875
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3875 3025 3875
Wire Wire Line
	3625 3875 5525 3875
Wire Wire Line
	5525 3875 5525 4575
Wire Wire Line
	1500 3775 1500 2175
Connection ~ 1500 3775
Wire Wire Line
	1500 3775 1700 3775
Wire Wire Line
	4525 2425 4525 2900
Wire Wire Line
	4925 2500 4925 2425
Wire Wire Line
	4925 2425 6725 2425
Wire Wire Line
	6725 2425 6725 2900
Wire Wire Line
	4825 2175 4825 2500
Wire Wire Line
	1500 2175 4825 2175
Wire Wire Line
	4525 2425 4725 2425
Wire Wire Line
	4725 2425 4725 2500
Wire Wire Line
	5625 4575 5625 4500
Wire Wire Line
	5625 4500 6825 4500
Wire Wire Line
	6825 4500 6825 5075
$Comp
L power:VCC #PWR?
U 1 1 6132F6F5
P 6825 4500
F 0 "#PWR?" H 6825 4350 50  0001 C CNN
F 1 "VCC" H 6840 4673 50  0000 C CNN
F 2 "" H 6825 4500 50  0001 C CNN
F 3 "" H 6825 4500 50  0001 C CNN
	1    6825 4500
	1    0    0    -1  
$EndComp
Connection ~ 6825 4500
$Comp
L power:VCC #PWR?
U 1 1 6132F9EC
P 6725 2425
F 0 "#PWR?" H 6725 2275 50  0001 C CNN
F 1 "VCC" H 6740 2598 50  0000 C CNN
F 2 "" H 6725 2425 50  0001 C CNN
F 3 "" H 6725 2425 50  0001 C CNN
	1    6725 2425
	1    0    0    -1  
$EndComp
Connection ~ 6725 2425
$Comp
L power:GND #PWR?
U 1 1 6132FD1E
P 4525 2900
F 0 "#PWR?" H 4525 2650 50  0001 C CNN
F 1 "GND" H 4530 2727 50  0000 C CNN
F 2 "" H 4525 2900 50  0001 C CNN
F 3 "" H 4525 2900 50  0001 C CNN
	1    4525 2900
	1    0    0    -1  
$EndComp
Connection ~ 4525 2900
$Comp
L power:GND #PWR?
U 1 1 6133001D
P 5225 5075
F 0 "#PWR?" H 5225 4825 50  0001 C CNN
F 1 "GND" H 5230 4902 50  0000 C CNN
F 2 "" H 5225 5075 50  0001 C CNN
F 3 "" H 5225 5075 50  0001 C CNN
	1    5225 5075
	1    0    0    -1  
$EndComp
$Comp
L common-symbols:BarGraphLED_8P BAR?
U 1 1 61330C45
P 7375 3775
F 0 "BAR?" H 7375 4442 50  0000 C CNN
F 1 "BarGraphLED_8P" H 7375 4351 50  0000 C CNN
F 2 "" H 7375 3775 50  0001 C CNN
F 3 "" H 7375 3775 50  0001 C CNN
	1    7375 3775
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 61333752
P 8075 3775
F 0 "RN?" V 7458 3775 50  0000 C CNN
F 1 "R_Network08" V 7549 3775 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 8550 3775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8075 3775 50  0001 C CNN
	1    8075 3775
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6133637F
P 8425 3375
F 0 "#PWR?" H 8425 3125 50  0001 C CNN
F 1 "GND" H 8430 3202 50  0000 C CNN
F 2 "" H 8425 3375 50  0001 C CNN
F 3 "" H 8425 3375 50  0001 C CNN
	1    8425 3375
	1    0    0    -1  
$EndComp
Wire Wire Line
	7175 3375 6525 3375
Connection ~ 6525 3375
Wire Wire Line
	6525 3375 6525 4575
Wire Wire Line
	7175 3475 6425 3475
Connection ~ 6425 3475
Wire Wire Line
	6425 3475 6425 3300
Wire Wire Line
	7175 3575 6325 3575
Connection ~ 6325 3575
Wire Wire Line
	6325 3575 6325 4575
Wire Wire Line
	7175 3675 6225 3675
Connection ~ 6225 3675
Wire Wire Line
	6225 3675 6225 3300
Wire Wire Line
	7175 3775 6125 3775
Connection ~ 6125 3775
Wire Wire Line
	6125 3775 6125 4575
Wire Wire Line
	7175 3875 6025 3875
Connection ~ 6025 3875
Wire Wire Line
	6025 3875 6025 3300
Wire Wire Line
	7175 3975 5925 3975
Connection ~ 5925 3975
Wire Wire Line
	5925 3975 5925 4575
Wire Wire Line
	7175 4075 5825 4075
Connection ~ 5825 4075
Wire Wire Line
	5825 4075 5825 3300
Wire Wire Line
	7575 3375 7875 3375
Wire Wire Line
	7575 3475 7875 3475
Wire Wire Line
	7575 3575 7875 3575
Wire Wire Line
	7575 3675 7875 3675
Wire Wire Line
	7575 3775 7875 3775
Wire Wire Line
	7575 3875 7875 3875
Wire Wire Line
	7575 3975 7875 3975
Wire Wire Line
	7575 4075 7875 4075
Wire Wire Line
	8275 3375 8425 3375
$EndSCHEMATC
