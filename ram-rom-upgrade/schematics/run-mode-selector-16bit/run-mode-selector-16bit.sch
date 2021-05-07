EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "16 Bit Address Bus Run Mode Selector"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3275 6950 3    50   Output ~ 0
A0
Text HLabel 3200 6950 3    50   Output ~ 0
A1
Text HLabel 3125 6950 3    50   Output ~ 0
A2
Text HLabel 3050 6950 3    50   Output ~ 0
A3
Text HLabel 2975 6950 3    50   Output ~ 0
A4
Text HLabel 2900 6950 3    50   Output ~ 0
A5
Text HLabel 2825 6950 3    50   Output ~ 0
A6
Text HLabel 2750 6950 3    50   Output ~ 0
A7
Text HLabel 2675 6950 3    50   Output ~ 0
A8
Text HLabel 2600 6950 3    50   Output ~ 0
A9
Text HLabel 2525 6950 3    50   Output ~ 0
A10
Text HLabel 2450 6950 3    50   Output ~ 0
A11
Text HLabel 2375 6950 3    50   Output ~ 0
A12
Text HLabel 2300 6950 3    50   Output ~ 0
A13
Text HLabel 2225 6950 3    50   Output ~ 0
A14
Text HLabel 2150 6950 3    50   Output ~ 0
A15
$Comp
L 74xx:74LS157 U1
U 1 1 60588DDC
P 2450 5200
F 0 "U1" V 2825 4400 50  0000 L CNN
F 1 "74LS157" V 2450 5025 50  0000 L CNN
F 2 "" H 2450 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2450 5200 50  0001 C CNN
	1    2450 5200
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U2
U 1 1 6058F2C6
P 4625 5200
F 0 "U2" V 5000 4400 50  0000 L CNN
F 1 "74LS157" V 4625 5025 50  0000 L CNN
F 2 "" H 4625 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 4625 5200 50  0001 C CNN
	1    4625 5200
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U3
U 1 1 60590082
P 6725 5200
F 0 "U3" V 7100 4400 50  0000 L CNN
F 1 "74LS157" V 6725 5025 50  0000 L CNN
F 2 "" H 6725 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 6725 5200 50  0001 C CNN
	1    6725 5200
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U4
U 1 1 60590658
P 8775 5200
F 0 "U4" V 9150 4400 50  0000 L CNN
F 1 "74LS157" V 8775 5025 50  0000 L CNN
F 2 "" H 8775 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8775 5200 50  0001 C CNN
	1    8775 5200
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 60598F76
P 950 3200
F 0 "SW1" H 950 3867 50  0000 C CNN
F 1 "SW_DIP_x08" H 950 3776 50  0000 C CNN
F 2 "" H 950 3200 50  0001 C CNN
F 3 "~" H 950 3200 50  0001 C CNN
	1    950  3200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW2
U 1 1 6059B235
P 950 4150
F 0 "SW2" H 950 3575 50  0000 C CNN
F 1 "SW_DIP_x08" H 950 3675 50  0000 C CNN
F 2 "" H 950 4150 50  0001 C CNN
F 3 "~" H 950 4150 50  0001 C CNN
	1    950  4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2800 2050 2800
Wire Wire Line
	2050 2800 2050 4700
Wire Wire Line
	2150 2800 2150 4700
Wire Wire Line
	1250 2900 2350 2900
Wire Wire Line
	2350 2900 2350 4700
Wire Wire Line
	1250 3000 2650 3000
Wire Wire Line
	2650 3000 2650 4700
Wire Wire Line
	1250 3100 2950 3100
Wire Wire Line
	2950 3100 2950 4700
Wire Wire Line
	1250 3200 4225 3200
Wire Wire Line
	4225 3200 4225 4700
Wire Wire Line
	4325 3200 4325 4700
Wire Wire Line
	1250 3300 4525 3300
Wire Wire Line
	4525 3300 4525 4700
Wire Wire Line
	4625 3300 4625 4700
Wire Wire Line
	1250 3400 4825 3400
Wire Wire Line
	4825 3400 4825 4700
Wire Wire Line
	1250 3500 5125 3500
Wire Wire Line
	5125 3500 5125 4700
Wire Wire Line
	1250 3750 6325 3750
Wire Wire Line
	6325 3750 6325 4700
Wire Wire Line
	6425 3750 6425 4700
Wire Wire Line
	1250 3850 6625 3850
Wire Wire Line
	6625 3850 6625 4700
Wire Wire Line
	6725 3850 6725 4700
Wire Wire Line
	1250 3950 6925 3950
Wire Wire Line
	6925 3950 6925 4700
Wire Wire Line
	1250 4050 7225 4050
Wire Wire Line
	7225 4050 7225 4700
Wire Wire Line
	1250 4150 8375 4150
Wire Wire Line
	8375 4150 8375 4700
Wire Wire Line
	8475 4150 8475 4700
Wire Wire Line
	1250 4250 8675 4250
Wire Wire Line
	8675 4250 8675 4700
Wire Wire Line
	8775 4250 8775 4700
Wire Wire Line
	1250 4350 8975 4350
Wire Wire Line
	8975 4350 8975 4700
Wire Wire Line
	1250 4450 9275 4450
Wire Wire Line
	9275 4450 9275 4700
Wire Wire Line
	3925 4700 3625 4700
Wire Wire Line
	3625 4700 3625 5200
Wire Wire Line
	1750 4700 1450 4700
Wire Wire Line
	1450 4700 1450 5200
Wire Wire Line
	6025 4700 5725 4700
Wire Wire Line
	5725 4700 5725 5200
Wire Wire Line
	8075 4700 7775 4700
Wire Wire Line
	7775 4700 7775 5200
Wire Wire Line
	8175 4700 8175 4625
Wire Wire Line
	6125 4625 6125 4700
Wire Wire Line
	6125 4625 8175 4625
Wire Wire Line
	6125 4625 4025 4625
Wire Wire Line
	4025 4625 4025 4700
Connection ~ 6125 4625
Wire Wire Line
	4025 4625 1850 4625
Wire Wire Line
	1850 4625 1850 4700
Connection ~ 4025 4625
Connection ~ 8175 4625
Wire Wire Line
	650  2800 650  2900
Wire Wire Line
	650  2900 650  3000
Connection ~ 650  2900
Wire Wire Line
	650  3000 650  3100
Connection ~ 650  3000
Wire Wire Line
	650  3100 650  3200
Connection ~ 650  3100
Wire Wire Line
	650  3200 650  3300
Connection ~ 650  3200
Wire Wire Line
	650  3300 650  3400
Connection ~ 650  3300
Wire Wire Line
	650  3400 650  3500
Connection ~ 650  3400
Wire Wire Line
	650  3500 650  3750
Connection ~ 650  3500
Wire Wire Line
	650  3750 650  3850
Connection ~ 650  3750
Wire Wire Line
	650  3850 650  3950
Connection ~ 650  3850
Wire Wire Line
	650  3950 650  4050
Connection ~ 650  3950
Wire Wire Line
	650  4050 650  4150
Connection ~ 650  4050
Wire Wire Line
	650  4150 650  4250
Connection ~ 650  4150
Wire Wire Line
	650  4250 650  4350
Connection ~ 650  4250
Wire Wire Line
	650  4350 650  4450
Connection ~ 650  4350
$Comp
L power:GND #PWR01
U 1 1 60656D6C
P 650 4800
F 0 "#PWR01" H 650 4550 50  0001 C CNN
F 1 "GND" H 655 4627 50  0000 C CNN
F 2 "" H 650 4800 50  0001 C CNN
F 3 "" H 650 4800 50  0001 C CNN
	1    650  4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  4450 650  4800
Connection ~ 650  4450
Wire Wire Line
	2150 5700 2150 6600
Wire Wire Line
	2225 6950 2225 6550
Wire Wire Line
	2225 5700 2450 5700
Wire Wire Line
	2300 6950 2300 6500
Wire Wire Line
	2300 5725 2750 5725
Wire Wire Line
	2750 5725 2750 5700
Wire Wire Line
	2375 6950 2375 6450
Wire Wire Line
	2375 5750 3050 5750
Wire Wire Line
	3050 5750 3050 5700
Wire Wire Line
	2450 6950 2450 5775
Wire Wire Line
	2450 5775 4175 5775
Wire Wire Line
	4325 5775 4325 5700
Wire Wire Line
	2525 6950 2525 5825
Wire Wire Line
	2525 5825 4275 5825
Wire Wire Line
	4625 5825 4625 5700
Wire Wire Line
	2600 6950 2600 5875
Wire Wire Line
	2600 5875 4375 5875
Wire Wire Line
	4925 5875 4925 5700
Wire Wire Line
	2675 6950 2675 5925
Wire Wire Line
	2675 5925 4475 5925
Wire Wire Line
	5225 5925 5225 5700
Wire Wire Line
	2750 6950 2750 5975
Wire Wire Line
	2750 5975 4775 5975
Wire Wire Line
	6425 5975 6425 5700
Wire Wire Line
	2825 6950 2825 6025
Wire Wire Line
	2825 6025 4875 6025
Wire Wire Line
	6725 6025 6725 5700
Wire Wire Line
	2900 6950 2900 6075
Wire Wire Line
	2900 6075 4975 6075
Wire Wire Line
	7025 6075 7025 5700
Wire Wire Line
	2975 6950 2975 6125
Wire Wire Line
	2975 6125 5075 6125
Wire Wire Line
	7325 6125 7325 5700
Wire Wire Line
	3050 6950 3050 6175
Wire Wire Line
	3050 6175 5175 6175
Wire Wire Line
	8475 6175 8475 5700
Wire Wire Line
	3125 6950 3125 6225
Wire Wire Line
	3125 6225 5275 6225
Wire Wire Line
	8775 6225 8775 5700
Wire Wire Line
	3200 6950 3200 6275
Wire Wire Line
	3200 6275 5375 6275
Wire Wire Line
	9075 6275 9075 5700
Wire Wire Line
	3275 6950 3275 6325
Wire Wire Line
	3275 6325 5475 6325
Wire Wire Line
	9375 6325 9375 5700
$Comp
L power:GND #PWR02
U 1 1 606EC1D2
P 1450 5200
F 0 "#PWR02" H 1450 4950 50  0001 C CNN
F 1 "GND" H 1455 5027 50  0000 C CNN
F 2 "" H 1450 5200 50  0001 C CNN
F 3 "" H 1450 5200 50  0001 C CNN
	1    1450 5200
	1    0    0    -1  
$EndComp
Connection ~ 1450 5200
$Comp
L power:GND #PWR04
U 1 1 606EC5FB
P 3625 5200
F 0 "#PWR04" H 3625 4950 50  0001 C CNN
F 1 "GND" H 3630 5027 50  0000 C CNN
F 2 "" H 3625 5200 50  0001 C CNN
F 3 "" H 3625 5200 50  0001 C CNN
	1    3625 5200
	1    0    0    -1  
$EndComp
Connection ~ 3625 5200
$Comp
L power:GND #PWR08
U 1 1 606ECA30
P 5725 5200
F 0 "#PWR08" H 5725 4950 50  0001 C CNN
F 1 "GND" H 5730 5027 50  0000 C CNN
F 2 "" H 5725 5200 50  0001 C CNN
F 3 "" H 5725 5200 50  0001 C CNN
	1    5725 5200
	1    0    0    -1  
$EndComp
Connection ~ 5725 5200
$Comp
L power:GND #PWR011
U 1 1 606ECE71
P 7775 5200
F 0 "#PWR011" H 7775 4950 50  0001 C CNN
F 1 "GND" H 7780 5027 50  0000 C CNN
F 2 "" H 7775 5200 50  0001 C CNN
F 3 "" H 7775 5200 50  0001 C CNN
	1    7775 5200
	1    0    0    -1  
$EndComp
Connection ~ 7775 5200
Text HLabel 10300 4625 2    50   Output ~ 0
PROG
$Comp
L power:VCC #PWR012
U 1 1 606F7246
P 9675 5200
F 0 "#PWR012" H 9675 5050 50  0001 C CNN
F 1 "VCC" H 9690 5373 50  0000 C CNN
F 2 "" H 9675 5200 50  0001 C CNN
F 3 "" H 9675 5200 50  0001 C CNN
	1    9675 5200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR010
U 1 1 6072F5DD
P 7625 5200
F 0 "#PWR010" H 7625 5050 50  0001 C CNN
F 1 "VCC" H 7640 5373 50  0000 C CNN
F 2 "" H 7625 5200 50  0001 C CNN
F 3 "" H 7625 5200 50  0001 C CNN
	1    7625 5200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 6072FAB1
P 5525 5200
F 0 "#PWR07" H 5525 5050 50  0001 C CNN
F 1 "VCC" H 5540 5373 50  0000 C CNN
F 2 "" H 5525 5200 50  0001 C CNN
F 3 "" H 5525 5200 50  0001 C CNN
	1    5525 5200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 6072FF6A
P 3350 5200
F 0 "#PWR03" H 3350 5050 50  0001 C CNN
F 1 "VCC" H 3365 5373 50  0000 C CNN
F 2 "" H 3350 5200 50  0001 C CNN
F 3 "" H 3350 5200 50  0001 C CNN
	1    3350 5200
	1    0    0    -1  
$EndComp
Connection ~ 9850 5075
Wire Wire Line
	9850 5075 9850 4625
Wire Wire Line
	10425 5075 10525 5075
Connection ~ 10425 5075
Wire Wire Line
	9850 5075 10425 5075
Wire Wire Line
	10925 4975 11050 4975
$Comp
L power:GND #PWR014
U 1 1 60610629
P 11050 4975
F 0 "#PWR014" H 11050 4725 50  0001 C CNN
F 1 "GND" H 11055 4802 50  0000 C CNN
F 2 "" H 11050 4975 50  0001 C CNN
F 3 "" H 11050 4975 50  0001 C CNN
	1    11050 4975
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9850 5550 9850 5075
Wire Wire Line
	10100 4875 10525 4875
Wire Wire Line
	10100 5275 10100 4875
Wire Wire Line
	10100 5550 10100 5475
Wire Wire Line
	10425 5275 10425 5075
Wire Wire Line
	10425 5550 10425 5475
Wire Wire Line
	9850 5975 9850 5850
Wire Wire Line
	10100 5975 9850 5975
Connection ~ 10100 5975
Wire Wire Line
	10100 5975 10100 5850
Wire Wire Line
	10425 5975 10425 5850
Wire Wire Line
	10100 5975 10425 5975
Wire Wire Line
	10100 6075 10100 5975
$Comp
L power:VCC #PWR013
U 1 1 605F5E31
P 10100 6075
F 0 "#PWR013" H 10100 5925 50  0001 C CNN
F 1 "VCC" H 10115 6248 50  0000 C CNN
F 2 "" H 10100 6075 50  0001 C CNN
F 3 "" H 10100 6075 50  0001 C CNN
	1    10100 6075
	1    0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 605F5563
P 9850 5700
F 0 "R1" V 9750 5650 50  0000 L CNN
F 1 "1K" V 9850 5650 50  0000 L CNN
F 2 "" V 9780 5700 50  0001 C CNN
F 3 "~" H 9850 5700 50  0001 C CNN
	1    9850 5700
	1    0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 605F4E75
P 10100 5700
F 0 "R2" V 10000 5650 50  0000 L CNN
F 1 "220" V 10100 5625 50  0000 L CNN
F 2 "" V 10030 5700 50  0001 C CNN
F 3 "~" H 10100 5700 50  0001 C CNN
	1    10100 5700
	1    0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 605F477A
P 10425 5700
F 0 "R3" V 10325 5650 50  0000 L CNN
F 1 "220" V 10425 5625 50  0000 L CNN
F 2 "" V 10355 5700 50  0001 C CNN
F 3 "~" H 10425 5700 50  0001 C CNN
	1    10425 5700
	1    0    0    1   
$EndComp
$Comp
L Device:LED_Small_ALT D1
U 1 1 605F3ADE
P 10100 5375
F 0 "D1" H 10150 5500 50  0000 R CNN
F 1 "RED" H 10225 5275 50  0000 R CNN
F 2 "" V 10100 5375 50  0001 C CNN
F 3 "~" V 10100 5375 50  0001 C CNN
	1    10100 5375
	0    -1   1    0   
$EndComp
$Comp
L Device:LED_Small_ALT D2
U 1 1 605F2267
P 10425 5375
F 0 "D2" H 10475 5500 50  0000 R CNN
F 1 "GREEN" H 10550 5275 50  0000 R CNN
F 2 "" V 10425 5375 50  0001 C CNN
F 3 "~" V 10425 5375 50  0001 C CNN
	1    10425 5375
	0    -1   1    0   
$EndComp
$Comp
L Switch:SW_SPDT SW3
U 1 1 605E7856
P 10725 4975
F 0 "SW3" H 10725 5260 50  0000 C CNN
F 1 "SW_SPDT" H 10725 5169 50  0000 C CNN
F 2 "" H 10725 4975 50  0001 C CNN
F 3 "~" H 10725 4975 50  0001 C CNN
	1    10725 4975
	-1   0    0    1   
$EndComp
Connection ~ 9850 4625
Wire Wire Line
	9850 4625 10300 4625
Wire Wire Line
	8175 4625 9850 4625
Text HLabel 9825 2800 2    50   Input ~ 0
ADDR_BUS_15
Text HLabel 9825 2900 2    50   Input ~ 0
ADDR_BUS_14
Text HLabel 9825 3000 2    50   Input ~ 0
ADDR_BUS_13
Text HLabel 9825 3100 2    50   Input ~ 0
ADDR_BUS_12
Text HLabel 9825 3200 2    50   Input ~ 0
ADDR_BUS_11
Text HLabel 9825 3300 2    50   Input ~ 0
ADDR_BUS_10
Text HLabel 9825 3400 2    50   Input ~ 0
ADDR_BUS_9
Text HLabel 9825 3500 2    50   Input ~ 0
ADDR_BUS_8
Text HLabel 9825 3750 2    50   Input ~ 0
ADDR_BUS_7
Text HLabel 9825 3850 2    50   Input ~ 0
ADDR_BUS_6
Text HLabel 9825 3950 2    50   Input ~ 0
ADDR_BUS_5
Text HLabel 9825 4050 2    50   Input ~ 0
ADDR_BUS_4
Text HLabel 9825 4150 2    50   Input ~ 0
ADDR_BUS_3
Text HLabel 9825 4250 2    50   Input ~ 0
ADDR_BUS_2
Text HLabel 9825 4350 2    50   Input ~ 0
ADDR_BUS_1
Text HLabel 9825 4450 2    50   Input ~ 0
ADDR_BUS_0
Wire Wire Line
	9375 4700 9375 4450
Wire Wire Line
	9075 4700 9075 4350
Wire Wire Line
	7325 4700 7325 4050
Wire Wire Line
	7025 4700 7025 3950
Wire Wire Line
	5225 4700 5225 3500
Wire Wire Line
	4925 4700 4925 3400
Wire Wire Line
	3050 4700 3050 3100
Wire Wire Line
	2750 4700 2750 3000
Wire Wire Line
	2450 4700 2450 2900
$Comp
L ram-rom-upgrade-symbols:BarGraphLED_8P BAR1
U 1 1 6086E85F
P 4075 6850
F 0 "BAR1" V 4075 6225 50  0000 L CNN
F 1 "BarGraphLED_8P" V 4120 7380 50  0001 L CNN
F 2 "" H 4075 6850 50  0001 C CNN
F 3 "" H 4075 6850 50  0001 C CNN
	1    4075 6850
	0    1    1    0   
$EndComp
$Comp
L ram-rom-upgrade-symbols:BarGraphLED_8P BAR2
U 1 1 608742C3
P 5075 6850
F 0 "BAR2" V 5075 7400 50  0000 L CNN
F 1 "BarGraphLED_8P" V 5120 7380 50  0001 L CNN
F 2 "" H 5075 6850 50  0001 C CNN
F 3 "" H 5075 6850 50  0001 C CNN
	1    5075 6850
	0    1    1    0   
$EndComp
Wire Wire Line
	5475 6650 5475 6325
Connection ~ 5475 6325
Wire Wire Line
	5475 6325 9375 6325
Wire Wire Line
	5375 6650 5375 6275
Connection ~ 5375 6275
Wire Wire Line
	5375 6275 9075 6275
Wire Wire Line
	5275 6650 5275 6225
Connection ~ 5275 6225
Wire Wire Line
	5275 6225 8775 6225
Wire Wire Line
	5175 6650 5175 6175
Connection ~ 5175 6175
Wire Wire Line
	5175 6175 8475 6175
Wire Wire Line
	5075 6650 5075 6125
Connection ~ 5075 6125
Wire Wire Line
	5075 6125 7325 6125
Wire Wire Line
	4975 6650 4975 6075
Connection ~ 4975 6075
Wire Wire Line
	4975 6075 7025 6075
Wire Wire Line
	4875 6650 4875 6025
Connection ~ 4875 6025
Wire Wire Line
	4875 6025 6725 6025
Wire Wire Line
	4775 6650 4775 5975
Connection ~ 4775 5975
Wire Wire Line
	4775 5975 6425 5975
Wire Wire Line
	4475 6650 4475 5925
Connection ~ 4475 5925
Wire Wire Line
	4475 5925 5225 5925
Wire Wire Line
	4375 6650 4375 5875
Connection ~ 4375 5875
Wire Wire Line
	4375 5875 4925 5875
Wire Wire Line
	4275 6650 4275 5825
Connection ~ 4275 5825
Wire Wire Line
	4275 5825 4625 5825
Wire Wire Line
	4175 6650 4175 5775
Connection ~ 4175 5775
Wire Wire Line
	4175 5775 4325 5775
Wire Wire Line
	3775 6650 3775 6600
Wire Wire Line
	3775 6600 2150 6600
Connection ~ 2150 6600
Wire Wire Line
	2150 6600 2150 6950
Wire Wire Line
	3875 6650 3875 6550
Wire Wire Line
	3875 6550 2225 6550
Connection ~ 2225 6550
Wire Wire Line
	2225 6550 2225 5700
Wire Wire Line
	3975 6650 3975 6500
Wire Wire Line
	3975 6500 2300 6500
Connection ~ 2300 6500
Wire Wire Line
	2300 6500 2300 5725
Wire Wire Line
	4075 6650 4075 6450
Wire Wire Line
	4075 6450 2375 6450
Connection ~ 2375 6450
Wire Wire Line
	2375 6450 2375 5750
$Comp
L Device:R_Network08_US RN1
U 1 1 608F7760
P 4075 7250
F 0 "RN1" H 4600 7250 50  0000 R CNN
F 1 "R_Network08_US" H 3595 7295 50  0001 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4550 7250 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4075 7250 50  0001 C CNN
	1    4075 7250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Network08_US RN2
U 1 1 608FA03A
P 5075 7250
F 0 "RN2" H 4600 7250 50  0000 R CNN
F 1 "R_Network08_US" H 4595 7295 50  0001 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5550 7250 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5075 7250 50  0001 C CNN
	1    5075 7250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 608FB857
P 4475 7450
F 0 "#PWR05" H 4475 7200 50  0001 C CNN
F 1 "GND" H 4480 7277 50  0000 C CNN
F 2 "" H 4475 7450 50  0001 C CNN
F 3 "" H 4475 7450 50  0001 C CNN
	1    4475 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 608FBDA6
P 5475 7450
F 0 "#PWR06" H 5475 7200 50  0001 C CNN
F 1 "GND" H 5480 7277 50  0000 C CNN
F 2 "" H 5475 7450 50  0001 C CNN
F 3 "" H 5475 7450 50  0001 C CNN
	1    5475 7450
	1    0    0    -1  
$EndComp
Connection ~ 7525 625 
Wire Wire Line
	7525 625  7250 625 
$Comp
L power:GND #PWR09
U 1 1 60809B64
P 7250 625
F 0 "#PWR09" H 7250 375 50  0001 C CNN
F 1 "GND" H 7255 452 50  0000 C CNN
F 2 "" H 7250 625 50  0001 C CNN
F 3 "" H 7250 625 50  0001 C CNN
	1    7250 625 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8675 625  7525 625 
$Comp
L Device:R_Network08_US RN3
U 1 1 6073A7C3
P 7925 825
F 0 "RN3" H 8313 871 50  0000 L CNN
F 1 "10K" H 8313 780 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 8400 825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7925 825 50  0001 C CNN
	1    7925 825 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN4
U 1 1 60736850
P 9075 825
F 0 "RN4" H 9463 871 50  0000 L CNN
F 1 "10K" H 9463 780 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9550 825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9075 825 50  0001 C CNN
	1    9075 825 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2900 7625 2900
Wire Wire Line
	2750 3000 7725 3000
Wire Wire Line
	3050 3100 7825 3100
Wire Wire Line
	4325 3200 7925 3200
Wire Wire Line
	4625 3300 8025 3300
Wire Wire Line
	4925 3400 8125 3400
Wire Wire Line
	5225 3500 8225 3500
Wire Wire Line
	6425 3750 8675 3750
Wire Wire Line
	6725 3850 8775 3850
Wire Wire Line
	7325 4050 8975 4050
Wire Wire Line
	8475 4150 9075 4150
Wire Wire Line
	8775 4250 9175 4250
Wire Wire Line
	9075 4350 9275 4350
Wire Wire Line
	9375 4450 9825 4450
Wire Wire Line
	9375 1025 9375 4450
Connection ~ 9375 4450
Wire Wire Line
	9275 1025 9275 4350
Connection ~ 9275 4350
Wire Wire Line
	9275 4350 9825 4350
Wire Wire Line
	9175 1025 9175 4250
Connection ~ 9175 4250
Wire Wire Line
	9175 4250 9825 4250
Wire Wire Line
	9075 1025 9075 4150
Connection ~ 9075 4150
Wire Wire Line
	9075 4150 9825 4150
Wire Wire Line
	8975 1025 8975 4050
Connection ~ 8975 4050
Wire Wire Line
	8975 4050 9825 4050
Wire Wire Line
	8875 1025 8875 3950
Connection ~ 8875 3950
Wire Wire Line
	8875 3950 9825 3950
Wire Wire Line
	7025 3950 8875 3950
Wire Wire Line
	8775 1025 8775 3850
Connection ~ 8775 3850
Wire Wire Line
	8775 3850 9825 3850
Wire Wire Line
	8675 1025 8675 3750
Connection ~ 8675 3750
Wire Wire Line
	8675 3750 9825 3750
Wire Wire Line
	8225 1025 8225 3500
Connection ~ 8225 3500
Wire Wire Line
	8225 3500 9825 3500
Wire Wire Line
	8125 1025 8125 3400
Connection ~ 8125 3400
Wire Wire Line
	8125 3400 9825 3400
Wire Wire Line
	8025 1025 8025 3300
Connection ~ 8025 3300
Wire Wire Line
	8025 3300 9825 3300
Wire Wire Line
	7925 1025 7925 3200
Connection ~ 7925 3200
Wire Wire Line
	7925 3200 9825 3200
Wire Wire Line
	7825 1025 7825 3100
Connection ~ 7825 3100
Wire Wire Line
	7825 3100 9825 3100
Wire Wire Line
	7725 1025 7725 3000
Connection ~ 7725 3000
Wire Wire Line
	7725 3000 9825 3000
Wire Wire Line
	7625 1025 7625 2900
Connection ~ 7625 2900
Wire Wire Line
	7625 2900 9825 2900
Wire Wire Line
	7525 1025 7525 2800
Wire Wire Line
	2150 2800 7525 2800
Wire Wire Line
	7525 2800 9825 2800
Connection ~ 7525 2800
$EndSCHEMATC
