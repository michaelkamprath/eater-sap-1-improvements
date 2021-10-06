EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "16 Bit Address Bus Run Mode Selector v1.1"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3275 7500 3    50   Output ~ 0
A0
Text HLabel 3200 7500 3    50   Output ~ 0
A1
Text HLabel 3125 7500 3    50   Output ~ 0
A2
Text HLabel 3050 7500 3    50   Output ~ 0
A3
Text HLabel 2975 7500 3    50   Output ~ 0
A4
Text HLabel 2900 7500 3    50   Output ~ 0
A5
Text HLabel 2825 7500 3    50   Output ~ 0
A6
Text HLabel 2750 7500 3    50   Output ~ 0
A7
Text HLabel 2675 7500 3    50   Output ~ 0
A8
Text HLabel 2600 7500 3    50   Output ~ 0
A9
Text HLabel 2525 7500 3    50   Output ~ 0
A10
Text HLabel 2450 7500 3    50   Output ~ 0
A11
Text HLabel 2375 7500 3    50   Output ~ 0
A12
Text HLabel 2300 7500 3    50   Output ~ 0
A13
Text HLabel 2225 7500 3    50   Output ~ 0
A14
Text HLabel 2150 7500 3    50   Output ~ 0
A15
$Comp
L 74xx:74LS157 U1
U 1 1 60588DDC
P 2450 3525
F 0 "U1" V 2825 2725 50  0000 L CNN
F 1 "74LS157" V 2450 3350 50  0000 L CNN
F 2 "" H 2450 3525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2450 3525 50  0001 C CNN
	1    2450 3525
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U2
U 1 1 6058F2C6
P 4625 3525
F 0 "U2" V 5000 2725 50  0000 L CNN
F 1 "74LS157" V 4625 3350 50  0000 L CNN
F 2 "" H 4625 3525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 4625 3525 50  0001 C CNN
	1    4625 3525
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U3
U 1 1 60590082
P 6725 3525
F 0 "U3" V 7100 2725 50  0000 L CNN
F 1 "74LS157" V 6725 3350 50  0000 L CNN
F 2 "" H 6725 3525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 6725 3525 50  0001 C CNN
	1    6725 3525
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U4
U 1 1 60590658
P 8775 3525
F 0 "U4" V 9150 2725 50  0000 L CNN
F 1 "74LS157" V 8775 3350 50  0000 L CNN
F 2 "" H 8775 3525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8775 3525 50  0001 C CNN
	1    8775 3525
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 60598F76
P 950 1525
F 0 "SW1" H 950 2192 50  0000 C CNN
F 1 "SW_DIP_x08" H 950 2101 50  0000 C CNN
F 2 "" H 950 1525 50  0001 C CNN
F 3 "~" H 950 1525 50  0001 C CNN
	1    950  1525
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW2
U 1 1 6059B235
P 950 2475
F 0 "SW2" H 950 1900 50  0000 C CNN
F 1 "SW_DIP_x08" H 950 2000 50  0000 C CNN
F 2 "" H 950 2475 50  0001 C CNN
F 3 "~" H 950 2475 50  0001 C CNN
	1    950  2475
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1125 2050 1125
Wire Wire Line
	2050 1125 2050 3025
Wire Wire Line
	2150 1125 2150 3025
Wire Wire Line
	1250 1225 2350 1225
Wire Wire Line
	2350 1225 2350 3025
Wire Wire Line
	1250 1325 2650 1325
Wire Wire Line
	2650 1325 2650 3025
Wire Wire Line
	1250 1425 2950 1425
Wire Wire Line
	2950 1425 2950 3025
Wire Wire Line
	1250 1525 4225 1525
Wire Wire Line
	4225 1525 4225 3025
Wire Wire Line
	4325 1525 4325 3025
Wire Wire Line
	1250 1625 4525 1625
Wire Wire Line
	4525 1625 4525 3025
Wire Wire Line
	4625 1625 4625 3025
Wire Wire Line
	1250 1725 4825 1725
Wire Wire Line
	4825 1725 4825 3025
Wire Wire Line
	1250 1825 5125 1825
Wire Wire Line
	5125 1825 5125 3025
Wire Wire Line
	1250 2075 6325 2075
Wire Wire Line
	6325 2075 6325 3025
Wire Wire Line
	6425 2075 6425 3025
Wire Wire Line
	1250 2175 6625 2175
Wire Wire Line
	6625 2175 6625 3025
Wire Wire Line
	6725 2175 6725 3025
Wire Wire Line
	1250 2275 6925 2275
Wire Wire Line
	6925 2275 6925 3025
Wire Wire Line
	1250 2375 7225 2375
Wire Wire Line
	7225 2375 7225 3025
Wire Wire Line
	1250 2475 8375 2475
Wire Wire Line
	8375 2475 8375 3025
Wire Wire Line
	8475 2475 8475 3025
Wire Wire Line
	1250 2575 8675 2575
Wire Wire Line
	8675 2575 8675 3025
Wire Wire Line
	8775 2575 8775 3025
Wire Wire Line
	1250 2675 8975 2675
Wire Wire Line
	8975 2675 8975 3025
Wire Wire Line
	1250 2775 9275 2775
Wire Wire Line
	9275 2775 9275 3025
Wire Wire Line
	3925 3025 3625 3025
Wire Wire Line
	3625 3025 3625 3525
Wire Wire Line
	1750 3025 1450 3025
Wire Wire Line
	1450 3025 1450 3525
Wire Wire Line
	6025 3025 5725 3025
Wire Wire Line
	5725 3025 5725 3525
Wire Wire Line
	8075 3025 7775 3025
Wire Wire Line
	7775 3025 7775 3525
Wire Wire Line
	8175 3025 8175 2950
Wire Wire Line
	6125 2950 6125 3025
Wire Wire Line
	6125 2950 8175 2950
Wire Wire Line
	6125 2950 4025 2950
Wire Wire Line
	4025 2950 4025 3025
Connection ~ 6125 2950
Wire Wire Line
	4025 2950 1850 2950
Wire Wire Line
	1850 2950 1850 3025
Connection ~ 4025 2950
Connection ~ 8175 2950
Wire Wire Line
	650  1125 650  1225
Wire Wire Line
	650  1225 650  1325
Connection ~ 650  1225
Wire Wire Line
	650  1325 650  1425
Connection ~ 650  1325
Wire Wire Line
	650  1425 650  1525
Connection ~ 650  1425
Wire Wire Line
	650  1525 650  1625
Connection ~ 650  1525
Wire Wire Line
	650  1625 650  1725
Connection ~ 650  1625
Wire Wire Line
	650  1725 650  1825
Connection ~ 650  1725
Wire Wire Line
	650  1825 650  2075
Connection ~ 650  1825
Wire Wire Line
	650  2075 650  2175
Connection ~ 650  2075
Wire Wire Line
	650  2175 650  2275
Connection ~ 650  2175
Wire Wire Line
	650  2275 650  2375
Connection ~ 650  2275
Wire Wire Line
	650  2375 650  2475
Connection ~ 650  2375
Wire Wire Line
	650  2475 650  2575
Connection ~ 650  2475
Wire Wire Line
	650  2575 650  2675
Connection ~ 650  2575
Wire Wire Line
	650  2675 650  2775
Connection ~ 650  2675
$Comp
L power:GND #PWR01
U 1 1 60656D6C
P 650 3125
F 0 "#PWR01" H 650 2875 50  0001 C CNN
F 1 "GND" H 655 2952 50  0000 C CNN
F 2 "" H 650 3125 50  0001 C CNN
F 3 "" H 650 3125 50  0001 C CNN
	1    650  3125
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  2775 650  3125
Connection ~ 650  2775
Wire Wire Line
	2150 4025 2150 4925
Wire Wire Line
	2225 4025 2450 4025
Wire Wire Line
	2300 4050 2750 4050
Wire Wire Line
	2750 4050 2750 4025
Wire Wire Line
	2375 4075 3050 4075
Wire Wire Line
	3050 4075 3050 4025
Wire Wire Line
	2450 4100 4175 4100
Wire Wire Line
	4325 4100 4325 4025
Wire Wire Line
	2525 7500 2525 4150
Wire Wire Line
	2525 4150 4275 4150
Wire Wire Line
	4625 4150 4625 4025
Wire Wire Line
	2600 7500 2600 4200
Wire Wire Line
	2600 4200 4375 4200
Wire Wire Line
	4925 4200 4925 4025
Wire Wire Line
	2675 7500 2675 4250
Wire Wire Line
	2675 4250 4475 4250
Wire Wire Line
	5225 4250 5225 4025
Wire Wire Line
	2750 7500 2750 4300
Wire Wire Line
	2750 4300 4775 4300
Wire Wire Line
	6425 4300 6425 4025
Wire Wire Line
	2825 7500 2825 4350
Wire Wire Line
	2825 4350 4875 4350
Wire Wire Line
	6725 4350 6725 4025
Wire Wire Line
	2900 7500 2900 4400
Wire Wire Line
	2900 4400 4975 4400
Wire Wire Line
	7025 4400 7025 4025
Wire Wire Line
	2975 7500 2975 4450
Wire Wire Line
	2975 4450 5075 4450
Wire Wire Line
	7325 4450 7325 4025
Wire Wire Line
	3050 7500 3050 4500
Wire Wire Line
	3050 4500 5175 4500
Wire Wire Line
	8475 4500 8475 4025
Wire Wire Line
	3125 7500 3125 4550
Wire Wire Line
	3125 4550 5275 4550
Wire Wire Line
	8775 4550 8775 4025
Wire Wire Line
	3200 7500 3200 4600
Wire Wire Line
	3200 4600 5375 4600
Wire Wire Line
	9075 4600 9075 4025
Wire Wire Line
	3275 7500 3275 4650
Wire Wire Line
	3275 4650 5475 4650
Wire Wire Line
	9375 4650 9375 4025
$Comp
L power:GND #PWR02
U 1 1 606EC1D2
P 1450 3525
F 0 "#PWR02" H 1450 3275 50  0001 C CNN
F 1 "GND" H 1455 3352 50  0000 C CNN
F 2 "" H 1450 3525 50  0001 C CNN
F 3 "" H 1450 3525 50  0001 C CNN
	1    1450 3525
	1    0    0    -1  
$EndComp
Connection ~ 1450 3525
$Comp
L power:GND #PWR04
U 1 1 606EC5FB
P 3625 3525
F 0 "#PWR04" H 3625 3275 50  0001 C CNN
F 1 "GND" H 3630 3352 50  0000 C CNN
F 2 "" H 3625 3525 50  0001 C CNN
F 3 "" H 3625 3525 50  0001 C CNN
	1    3625 3525
	1    0    0    -1  
$EndComp
Connection ~ 3625 3525
$Comp
L power:GND #PWR08
U 1 1 606ECA30
P 5725 3525
F 0 "#PWR08" H 5725 3275 50  0001 C CNN
F 1 "GND" H 5730 3352 50  0000 C CNN
F 2 "" H 5725 3525 50  0001 C CNN
F 3 "" H 5725 3525 50  0001 C CNN
	1    5725 3525
	1    0    0    -1  
$EndComp
Connection ~ 5725 3525
$Comp
L power:GND #PWR011
U 1 1 606ECE71
P 7775 3525
F 0 "#PWR011" H 7775 3275 50  0001 C CNN
F 1 "GND" H 7780 3352 50  0000 C CNN
F 2 "" H 7775 3525 50  0001 C CNN
F 3 "" H 7775 3525 50  0001 C CNN
	1    7775 3525
	1    0    0    -1  
$EndComp
Connection ~ 7775 3525
Text HLabel 10300 2950 2    50   Output ~ 0
PROG
$Comp
L power:VCC #PWR012
U 1 1 606F7246
P 9675 3525
F 0 "#PWR012" H 9675 3375 50  0001 C CNN
F 1 "VCC" H 9690 3698 50  0000 C CNN
F 2 "" H 9675 3525 50  0001 C CNN
F 3 "" H 9675 3525 50  0001 C CNN
	1    9675 3525
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR010
U 1 1 6072F5DD
P 7625 3525
F 0 "#PWR010" H 7625 3375 50  0001 C CNN
F 1 "VCC" H 7640 3698 50  0000 C CNN
F 2 "" H 7625 3525 50  0001 C CNN
F 3 "" H 7625 3525 50  0001 C CNN
	1    7625 3525
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 6072FAB1
P 5525 3525
F 0 "#PWR07" H 5525 3375 50  0001 C CNN
F 1 "VCC" H 5540 3698 50  0000 C CNN
F 2 "" H 5525 3525 50  0001 C CNN
F 3 "" H 5525 3525 50  0001 C CNN
	1    5525 3525
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 6072FF6A
P 3350 3525
F 0 "#PWR03" H 3350 3375 50  0001 C CNN
F 1 "VCC" H 3365 3698 50  0000 C CNN
F 2 "" H 3350 3525 50  0001 C CNN
F 3 "" H 3350 3525 50  0001 C CNN
	1    3350 3525
	1    0    0    -1  
$EndComp
Connection ~ 9850 3400
Wire Wire Line
	9850 3400 9850 2950
Wire Wire Line
	10425 3400 10525 3400
Connection ~ 10425 3400
Wire Wire Line
	9850 3400 10425 3400
Wire Wire Line
	10925 3300 11050 3300
$Comp
L power:GND #PWR014
U 1 1 60610629
P 11050 3300
F 0 "#PWR014" H 11050 3050 50  0001 C CNN
F 1 "GND" H 11055 3127 50  0000 C CNN
F 2 "" H 11050 3300 50  0001 C CNN
F 3 "" H 11050 3300 50  0001 C CNN
	1    11050 3300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9850 3875 9850 3400
Wire Wire Line
	10100 3200 10525 3200
Wire Wire Line
	10100 3600 10100 3200
Wire Wire Line
	10100 3875 10100 3800
Wire Wire Line
	10425 3600 10425 3400
Wire Wire Line
	10425 3875 10425 3800
Wire Wire Line
	9850 4300 9850 4175
Wire Wire Line
	10100 4300 9850 4300
Connection ~ 10100 4300
Wire Wire Line
	10100 4300 10100 4175
Wire Wire Line
	10425 4300 10425 4175
Wire Wire Line
	10100 4300 10425 4300
Wire Wire Line
	10100 4400 10100 4300
$Comp
L power:VCC #PWR013
U 1 1 605F5E31
P 10100 4400
F 0 "#PWR013" H 10100 4250 50  0001 C CNN
F 1 "VCC" H 10115 4573 50  0000 C CNN
F 2 "" H 10100 4400 50  0001 C CNN
F 3 "" H 10100 4400 50  0001 C CNN
	1    10100 4400
	1    0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 605F5563
P 9850 4025
F 0 "R1" V 9750 3975 50  0000 L CNN
F 1 "1K" V 9850 3975 50  0000 L CNN
F 2 "" V 9780 4025 50  0001 C CNN
F 3 "~" H 9850 4025 50  0001 C CNN
	1    9850 4025
	1    0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 605F4E75
P 10100 4025
F 0 "R2" V 10000 3975 50  0000 L CNN
F 1 "220" V 10100 3950 50  0000 L CNN
F 2 "" V 10030 4025 50  0001 C CNN
F 3 "~" H 10100 4025 50  0001 C CNN
	1    10100 4025
	1    0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 605F477A
P 10425 4025
F 0 "R3" V 10325 3975 50  0000 L CNN
F 1 "220" V 10425 3950 50  0000 L CNN
F 2 "" V 10355 4025 50  0001 C CNN
F 3 "~" H 10425 4025 50  0001 C CNN
	1    10425 4025
	1    0    0    1   
$EndComp
$Comp
L Device:LED_Small_ALT D1
U 1 1 605F3ADE
P 10100 3700
F 0 "D1" H 10150 3825 50  0000 R CNN
F 1 "RED" H 10225 3600 50  0000 R CNN
F 2 "" V 10100 3700 50  0001 C CNN
F 3 "~" V 10100 3700 50  0001 C CNN
	1    10100 3700
	0    -1   1    0   
$EndComp
$Comp
L Device:LED_Small_ALT D2
U 1 1 605F2267
P 10425 3700
F 0 "D2" H 10475 3825 50  0000 R CNN
F 1 "GREEN" H 10550 3600 50  0000 R CNN
F 2 "" V 10425 3700 50  0001 C CNN
F 3 "~" V 10425 3700 50  0001 C CNN
	1    10425 3700
	0    -1   1    0   
$EndComp
$Comp
L Switch:SW_SPDT SW3
U 1 1 605E7856
P 10725 3300
F 0 "SW3" H 10725 3585 50  0000 C CNN
F 1 "SW_SPDT" H 10725 3494 50  0000 C CNN
F 2 "" H 10725 3300 50  0001 C CNN
F 3 "~" H 10725 3300 50  0001 C CNN
	1    10725 3300
	-1   0    0    1   
$EndComp
Connection ~ 9850 2950
Wire Wire Line
	9850 2950 10300 2950
Wire Wire Line
	8175 2950 9850 2950
Text HLabel 9825 1125 2    50   Input ~ 0
ADDR_15
Text HLabel 9825 1225 2    50   Input ~ 0
ADDR_14
Text HLabel 9825 1325 2    50   Input ~ 0
ADDR_13
Text HLabel 9825 1425 2    50   Input ~ 0
ADDR_12
Text HLabel 9825 1525 2    50   Input ~ 0
ADDR_11
Text HLabel 9825 1625 2    50   Input ~ 0
ADDR_10
Text HLabel 9825 1725 2    50   Input ~ 0
ADDR_9
Text HLabel 9825 1825 2    50   Input ~ 0
ADDR_8
Text HLabel 9825 2075 2    50   Input ~ 0
ADDR_7
Text HLabel 9825 2175 2    50   Input ~ 0
ADDR_6
Text HLabel 9825 2275 2    50   Input ~ 0
ADDR_5
Text HLabel 9825 2375 2    50   Input ~ 0
ADDR_4
Text HLabel 9825 2475 2    50   Input ~ 0
ADDR_3
Text HLabel 9825 2575 2    50   Input ~ 0
ADDR_2
Text HLabel 9825 2675 2    50   Input ~ 0
ADDR_1
Text HLabel 9825 2775 2    50   Input ~ 0
ADDR_0
Wire Wire Line
	9375 3025 9375 2775
Wire Wire Line
	9075 3025 9075 2675
Wire Wire Line
	7325 3025 7325 2375
Wire Wire Line
	7025 3025 7025 2275
Wire Wire Line
	5225 3025 5225 1825
Wire Wire Line
	4925 3025 4925 1725
Wire Wire Line
	3050 3025 3050 1425
Wire Wire Line
	2750 3025 2750 1325
Wire Wire Line
	2450 3025 2450 1225
$Comp
L common-symbols:BarGraphLED_8P BAR1
U 1 1 6086E85F
P 4075 5175
F 0 "BAR1" V 4075 4550 50  0000 L CNN
F 1 "BarGraphLED_8P" V 4120 5705 50  0001 L CNN
F 2 "" H 4075 5175 50  0001 C CNN
F 3 "" H 4075 5175 50  0001 C CNN
	1    4075 5175
	0    1    1    0   
$EndComp
$Comp
L common-symbols:BarGraphLED_8P BAR2
U 1 1 608742C3
P 5075 5175
F 0 "BAR2" V 5075 5725 50  0000 L CNN
F 1 "BarGraphLED_8P" V 5120 5705 50  0001 L CNN
F 2 "" H 5075 5175 50  0001 C CNN
F 3 "" H 5075 5175 50  0001 C CNN
	1    5075 5175
	0    1    1    0   
$EndComp
Wire Wire Line
	5475 4975 5475 4650
Connection ~ 5475 4650
Wire Wire Line
	5475 4650 9375 4650
Wire Wire Line
	5375 4975 5375 4600
Connection ~ 5375 4600
Wire Wire Line
	5375 4600 9075 4600
Wire Wire Line
	5275 4975 5275 4550
Connection ~ 5275 4550
Wire Wire Line
	5275 4550 8775 4550
Wire Wire Line
	5175 4975 5175 4500
Connection ~ 5175 4500
Wire Wire Line
	5175 4500 8475 4500
Wire Wire Line
	5075 4975 5075 4450
Connection ~ 5075 4450
Wire Wire Line
	5075 4450 7325 4450
Wire Wire Line
	4975 4975 4975 4400
Connection ~ 4975 4400
Wire Wire Line
	4975 4400 7025 4400
Wire Wire Line
	4875 4975 4875 4350
Connection ~ 4875 4350
Wire Wire Line
	4875 4350 6725 4350
Wire Wire Line
	4775 4975 4775 4300
Connection ~ 4775 4300
Wire Wire Line
	4775 4300 6425 4300
Wire Wire Line
	4475 4975 4475 4250
Connection ~ 4475 4250
Wire Wire Line
	4475 4250 5225 4250
Wire Wire Line
	4375 4975 4375 4200
Connection ~ 4375 4200
Wire Wire Line
	4375 4200 4925 4200
Wire Wire Line
	4275 4975 4275 4150
Connection ~ 4275 4150
Wire Wire Line
	4275 4150 4625 4150
Wire Wire Line
	4175 4975 4175 4100
Connection ~ 4175 4100
Wire Wire Line
	4175 4100 4325 4100
Wire Wire Line
	3775 4975 3775 4925
Wire Wire Line
	3775 4925 2150 4925
Connection ~ 2150 4925
Wire Wire Line
	3875 4975 3875 4875
Wire Wire Line
	3875 4875 2225 4875
Connection ~ 2225 4875
Wire Wire Line
	2225 4875 2225 4025
Wire Wire Line
	3975 4975 3975 4825
Wire Wire Line
	3975 4825 2300 4825
Connection ~ 2300 4825
Wire Wire Line
	2300 4825 2300 4050
Wire Wire Line
	4075 4975 4075 4775
Wire Wire Line
	4075 4775 2375 4775
Connection ~ 2375 4775
Wire Wire Line
	2375 4775 2375 4075
$Comp
L Device:R_Network08_US RN1
U 1 1 608F7760
P 4075 5575
F 0 "RN1" H 4600 5575 50  0000 R CNN
F 1 "R_Network08_US" H 3595 5620 50  0001 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4550 5575 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4075 5575 50  0001 C CNN
	1    4075 5575
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Network08_US RN2
U 1 1 608FA03A
P 5075 5575
F 0 "RN2" H 4600 5575 50  0000 R CNN
F 1 "R_Network08_US" H 4595 5620 50  0001 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5550 5575 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5075 5575 50  0001 C CNN
	1    5075 5575
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 608FB857
P 4475 5775
F 0 "#PWR05" H 4475 5525 50  0001 C CNN
F 1 "GND" H 4480 5602 50  0000 C CNN
F 2 "" H 4475 5775 50  0001 C CNN
F 3 "" H 4475 5775 50  0001 C CNN
	1    4475 5775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 608FBDA6
P 5475 5775
F 0 "#PWR06" H 5475 5525 50  0001 C CNN
F 1 "GND" H 5480 5602 50  0000 C CNN
F 2 "" H 5475 5775 50  0001 C CNN
F 3 "" H 5475 5775 50  0001 C CNN
	1    5475 5775
	1    0    0    -1  
$EndComp
Wire Wire Line
	9375 2775 9825 2775
Wire Wire Line
	2150 4925 2150 7500
Wire Wire Line
	2225 4875 2225 7500
Wire Wire Line
	2300 4825 2300 7500
Wire Wire Line
	2375 4775 2375 7500
Wire Wire Line
	2450 4100 2450 7500
Text HLabel 2075 7500 3    50   Output ~ 0
A16
$Comp
L power:GND #PWR?
U 1 1 6105A225
P 1650 7325
F 0 "#PWR?" H 1650 7075 50  0001 C CNN
F 1 "GND" H 1655 7152 50  0000 C CNN
F 2 "" H 1650 7325 50  0001 C CNN
F 3 "" H 1650 7325 50  0001 C CNN
	1    1650 7325
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6105B7B2
P 1925 7325
F 0 "R?" V 2000 7325 50  0000 C CNN
F 1 "1K" V 1925 7325 50  0000 C CNN
F 2 "" V 1855 7325 50  0001 C CNN
F 3 "~" H 1925 7325 50  0001 C CNN
	1    1925 7325
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2075 7500 2075 7325
Wire Wire Line
	1775 7325 1650 7325
Wire Wire Line
	9075 2675 9825 2675
Wire Wire Line
	8775 2575 9825 2575
Wire Wire Line
	8475 2475 9825 2475
Wire Wire Line
	7325 2375 9825 2375
Wire Wire Line
	7025 2275 9825 2275
Wire Wire Line
	6725 2175 9825 2175
Wire Wire Line
	6425 2075 9825 2075
Wire Wire Line
	5225 1825 9825 1825
Wire Wire Line
	4925 1725 9825 1725
Wire Wire Line
	4625 1625 9825 1625
Wire Wire Line
	4325 1525 9825 1525
Wire Wire Line
	3050 1425 9825 1425
Wire Wire Line
	2750 1325 9825 1325
Wire Wire Line
	2450 1225 9825 1225
Wire Wire Line
	2150 1125 9825 1125
$EndSCHEMATC
