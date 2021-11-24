EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Index Register"
Date ""
Rev ""
Comp ""
Comment1 "HLi - read in from data bus to byte according to HI~LO~"
Comment2 "HLe - increment or decrement according to SUB"
Comment3 "HLa - write register value to address bus"
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS169 U7
U 1 1 6175A069
P 8425 3575
F 0 "U7" V 8150 4300 50  0000 L CNN
F 1 "74LS169" V 8425 3400 50  0000 L CNN
F 2 "" H 8425 3575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS169" H 8425 3575 50  0001 C CNN
	1    8425 3575
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS169 U5
U 1 1 6175E21D
P 6125 3575
F 0 "U5" V 5850 4300 50  0000 L CNN
F 1 "74LS169" V 6125 3400 50  0000 L CNN
F 2 "" H 6125 3575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS169" H 6125 3575 50  0001 C CNN
	1    6125 3575
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS169 U3
U 1 1 61761B44
P 3825 3575
F 0 "U3" V 3550 4300 50  0000 L CNN
F 1 "74LS169" V 3825 3400 50  0000 L CNN
F 2 "" H 3825 3575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS169" H 3825 3575 50  0001 C CNN
	1    3825 3575
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS169 U2
U 1 1 617638DF
P 1525 3575
F 0 "U2" V 1250 4300 50  0000 L CNN
F 1 "74LS169" V 1525 3400 50  0000 L CNN
F 2 "" H 1525 3575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS169" H 1525 3575 50  0001 C CNN
	1    1525 3575
	0    1    1    0   
$EndComp
Text HLabel 10600 2050 2    50   Input ~ 0
BUS_0
Text HLabel 10600 1950 2    50   Input ~ 0
BUS_1
Text HLabel 10600 1850 2    50   Input ~ 0
BUS_2
Text HLabel 10600 1750 2    50   Input ~ 0
BUS_3
Text HLabel 10600 1650 2    50   Input ~ 0
BUS_4
Text HLabel 10600 1550 2    50   Input ~ 0
BUS_5
Text HLabel 10600 1450 2    50   Input ~ 0
BUS_6
Text HLabel 10600 1350 2    50   Input ~ 0
BUS_7
Wire Wire Line
	10600 2050 9025 2050
Wire Wire Line
	9025 2050 9025 3075
Wire Wire Line
	9025 2050 4425 2050
Wire Wire Line
	4425 2050 4425 3075
Connection ~ 9025 2050
Wire Wire Line
	10600 1950 8925 1950
Wire Wire Line
	8925 1950 8925 3075
Wire Wire Line
	8925 1950 4325 1950
Wire Wire Line
	4325 1950 4325 3075
Connection ~ 8925 1950
Wire Wire Line
	10600 1850 8825 1850
Wire Wire Line
	8825 1850 8825 3075
Wire Wire Line
	8825 1850 4225 1850
Wire Wire Line
	4225 1850 4225 3075
Connection ~ 8825 1850
Wire Wire Line
	10600 1750 8725 1750
Wire Wire Line
	8725 1750 8725 3075
Wire Wire Line
	8725 1750 4125 1750
Wire Wire Line
	4125 1750 4125 3075
Connection ~ 8725 1750
Wire Wire Line
	10600 1650 6725 1650
Wire Wire Line
	6725 1650 6725 3075
Wire Wire Line
	6725 1650 2125 1650
Wire Wire Line
	2125 1650 2125 3075
Connection ~ 6725 1650
Wire Wire Line
	10600 1550 6625 1550
Wire Wire Line
	6625 1550 6625 3075
Wire Wire Line
	6625 1550 2025 1550
Wire Wire Line
	2025 1550 2025 3075
Connection ~ 6625 1550
Wire Wire Line
	10600 1450 6525 1450
Wire Wire Line
	6525 1450 6525 3075
Wire Wire Line
	6525 1450 1925 1450
Wire Wire Line
	1925 1450 1925 3075
Connection ~ 6525 1450
Wire Wire Line
	10600 1350 6425 1350
Wire Wire Line
	6425 1350 6425 3075
Wire Wire Line
	6425 1350 1825 1350
Wire Wire Line
	1825 1350 1825 3075
Connection ~ 6425 1350
Text HLabel 10575 575  2    50   Input ~ 0
HLi
$Comp
L 74xx:74LS04 U1
U 1 1 61792AB6
P 10100 1125
F 0 "U1" H 10225 1000 50  0000 C CNN
F 1 "74LS04" H 10275 1250 50  0000 C CNN
F 2 "" H 10100 1125 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10100 1125 50  0001 C CNN
	1    10100 1125
	-1   0    0    1   
$EndComp
Text HLabel 10600 1125 2    50   Input ~ 0
HI~LO~
Wire Wire Line
	10600 1125 10475 1125
Wire Wire Line
	9725 1125 9800 1125
Wire Wire Line
	10575 575  10050 575 
Wire Wire Line
	9725 925  10050 925 
Wire Wire Line
	10050 925  10050 575 
Connection ~ 10050 575 
Wire Wire Line
	10050 575  9700 575 
Wire Wire Line
	10475 1125 10475 775 
Wire Wire Line
	10475 775  9700 775 
Connection ~ 10475 1125
Wire Wire Line
	10475 1125 10400 1125
Wire Wire Line
	9125 1025 8525 1025
Wire Wire Line
	8525 1025 8525 3075
Wire Wire Line
	8525 1025 6225 1025
Wire Wire Line
	6225 1025 6225 3075
Connection ~ 8525 1025
Wire Wire Line
	9100 675  3925 675 
Wire Wire Line
	3925 675  3925 3075
Wire Wire Line
	3925 675  1625 675 
Wire Wire Line
	1625 675  1625 3075
Connection ~ 3925 675 
$Comp
L 74xx:74LS04 U1
U 2 1 6179AA95
P 10100 2275
F 0 "U1" H 10225 2150 50  0000 C CNN
F 1 "74LS04" H 10275 2400 50  0000 C CNN
F 2 "" H 10100 2275 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10100 2275 50  0001 C CNN
	2    10100 2275
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS04 U1
U 3 1 617A06F8
P 10100 2625
F 0 "U1" H 10225 2500 50  0000 C CNN
F 1 "74LS04" H 10275 2750 50  0000 C CNN
F 2 "" H 10100 2625 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10100 2625 50  0001 C CNN
	3    10100 2625
	-1   0    0    1   
$EndComp
Text HLabel 10600 2275 2    50   Input ~ 0
HLe
Text HLabel 10600 2625 2    50   Input ~ 0
SUB
Wire Wire Line
	10600 2275 10400 2275
Wire Wire Line
	10600 2625 10400 2625
Wire Wire Line
	9800 2625 8325 2625
Wire Wire Line
	8325 2625 8325 3075
Wire Wire Line
	8325 2625 6025 2625
Wire Wire Line
	6025 2625 6025 3075
Connection ~ 8325 2625
Wire Wire Line
	6025 2625 3725 2625
Wire Wire Line
	3725 2625 3725 3075
Connection ~ 6025 2625
Wire Wire Line
	3725 2625 1425 2625
Wire Wire Line
	1425 2625 1425 3075
Connection ~ 3725 2625
Wire Wire Line
	9800 2275 8125 2275
Wire Wire Line
	8125 2275 8125 3075
Wire Wire Line
	8125 2275 5825 2275
Wire Wire Line
	5825 2275 5825 3075
Connection ~ 8125 2275
Wire Wire Line
	5825 2275 3525 2275
Wire Wire Line
	3525 2275 3525 3075
Connection ~ 5825 2275
Wire Wire Line
	3525 2275 1225 2275
Wire Wire Line
	1225 2275 1225 3075
Connection ~ 3525 2275
Text HLabel 10600 2850 2    50   Input ~ 0
CLK
Wire Wire Line
	10600 2850 7825 2850
Wire Wire Line
	7825 2850 7825 3075
Wire Wire Line
	7825 2850 5525 2850
Wire Wire Line
	5525 2850 5525 3075
Connection ~ 7825 2850
Wire Wire Line
	5525 2850 3225 2850
Wire Wire Line
	3225 2850 3225 3075
Connection ~ 5525 2850
Wire Wire Line
	3225 2850 925  2850
Wire Wire Line
	925  2850 925  3075
Connection ~ 3225 2850
Wire Wire Line
	8425 4075 7275 4075
Wire Wire Line
	7275 4075 7275 2975
Wire Wire Line
	7275 2975 5725 2975
Wire Wire Line
	5725 2975 5725 3075
Wire Wire Line
	6125 4075 4975 4075
Wire Wire Line
	4975 4075 4975 2975
Wire Wire Line
	4975 2975 3425 2975
Wire Wire Line
	3425 2975 3425 3075
Wire Wire Line
	3825 4075 2675 4075
Wire Wire Line
	2675 4075 2675 2975
Wire Wire Line
	2675 2975 1125 2975
Wire Wire Line
	1125 2975 1125 3075
$Comp
L 74xx:74LS04 U1
U 4 1 617BFB3E
P 1525 4775
F 0 "U1" V 1475 4475 50  0000 L CNN
F 1 "74LS04" V 1575 4350 50  0000 L CNN
F 2 "" H 1525 4775 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1525 4775 50  0001 C CNN
	4    1525 4775
	0    1    1    0   
$EndComp
Wire Wire Line
	1525 4075 1525 4475
Text HLabel 925  5075 0    50   Output ~ 0
ERR_HLO
Wire Wire Line
	925  5075 1525 5075
$Comp
L 74xx:74LS245 U4
U 1 1 617CC3A5
P 3925 5475
F 0 "U4" V 3650 6100 50  0000 L CNN
F 1 "74LS245" V 3925 5525 50  0000 L CNN
F 2 "" H 3925 5475 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 3925 5475 50  0001 C CNN
	1    3925 5475
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS245 U6
U 1 1 617D2D1E
P 6625 5475
F 0 "U6" V 6350 6100 50  0000 L CNN
F 1 "74LS245" V 6625 5525 50  0000 L CNN
F 2 "" H 6625 5475 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 6625 5475 50  0001 C CNN
	1    6625 5475
	0    1    1    0   
$EndComp
Wire Wire Line
	6725 4075 6725 4575
Wire Wire Line
	7125 4975 9025 4975
Wire Wire Line
	9025 4975 9025 4075
Wire Wire Line
	7025 4975 7025 4875
Wire Wire Line
	7025 4875 8925 4875
Wire Wire Line
	8925 4875 8925 4075
Wire Wire Line
	6925 4975 6925 4775
Wire Wire Line
	6925 4775 8825 4775
Wire Wire Line
	8825 4775 8825 4075
Wire Wire Line
	6825 4975 6825 4675
Wire Wire Line
	6825 4675 8725 4675
Wire Wire Line
	8725 4675 8725 4075
Wire Wire Line
	6525 4975 6525 4375
Wire Wire Line
	6425 4975 6425 4275
$Comp
L common-symbols:BarGraphLED_8P BAR2
U 1 1 617F6AED
P 9675 4675
F 0 "BAR2" H 9675 5225 50  0000 C CNN
F 1 "BarGraphLED_8P" H 9675 4225 50  0001 C CNN
F 2 "" H 9675 4675 50  0001 C CNN
F 3 "" H 9675 4675 50  0001 C CNN
	1    9675 4675
	1    0    0    -1  
$EndComp
Wire Wire Line
	9475 4575 6725 4575
Connection ~ 6725 4575
Wire Wire Line
	6725 4575 6725 4975
Wire Wire Line
	9475 4475 6625 4475
Wire Wire Line
	6625 4075 6625 4475
Connection ~ 6625 4475
Wire Wire Line
	6625 4475 6625 4975
Wire Wire Line
	9475 4375 6525 4375
Connection ~ 6525 4375
Wire Wire Line
	6525 4375 6525 4075
Wire Wire Line
	9475 4275 6425 4275
Connection ~ 6425 4275
Wire Wire Line
	6425 4275 6425 4075
Wire Wire Line
	9025 4975 9475 4975
Connection ~ 9025 4975
Wire Wire Line
	8925 4875 9475 4875
Connection ~ 8925 4875
Wire Wire Line
	8825 4775 9475 4775
Connection ~ 8825 4775
Wire Wire Line
	8725 4675 9475 4675
Connection ~ 8725 4675
Wire Wire Line
	4425 4075 4425 4975
$Comp
L common-symbols:BarGraphLED_8P BAR1
U 1 1 6184FDFC
P 4775 4675
F 0 "BAR1" H 4775 5225 50  0000 C CNN
F 1 "BarGraphLED_8P" H 4975 4225 50  0001 C CNN
F 2 "" H 4775 4675 50  0001 C CNN
F 3 "" H 4775 4675 50  0001 C CNN
	1    4775 4675
	1    0    0    -1  
$EndComp
Text HLabel 7125 5975 3    50   Output ~ 0
ADDR_BUS_0
Wire Wire Line
	1825 4275 1825 4075
Wire Wire Line
	3725 4275 1825 4275
Wire Wire Line
	3725 4275 3725 4975
Wire Wire Line
	1925 4375 1925 4075
Wire Wire Line
	3825 4375 1925 4375
Wire Wire Line
	3825 4375 3825 4975
Wire Wire Line
	2025 4475 2025 4075
Wire Wire Line
	3925 4475 2025 4475
Wire Wire Line
	3925 4475 3925 4975
Wire Wire Line
	2125 4575 2125 4075
Wire Wire Line
	4025 4575 2125 4575
Wire Wire Line
	4025 4575 4025 4975
Connection ~ 3725 4275
Wire Wire Line
	4575 4275 3725 4275
Connection ~ 3825 4375
Wire Wire Line
	4575 4375 3825 4375
Connection ~ 3925 4475
Wire Wire Line
	4575 4475 3925 4475
Connection ~ 4025 4575
Wire Wire Line
	4575 4575 4025 4575
Wire Wire Line
	4125 4675 4125 4975
Wire Wire Line
	4125 4075 4125 4675
Connection ~ 4125 4675
Wire Wire Line
	4575 4675 4125 4675
Wire Wire Line
	4225 4775 4225 4075
Wire Wire Line
	4225 4975 4225 4775
Connection ~ 4225 4775
Wire Wire Line
	4575 4775 4225 4775
Wire Wire Line
	4325 4875 4325 4075
Wire Wire Line
	4325 4975 4325 4875
Connection ~ 4325 4875
Wire Wire Line
	4575 4875 4325 4875
Connection ~ 4425 4975
Wire Wire Line
	4425 4975 4575 4975
Text HLabel 925  5475 0    50   Input ~ 0
HLa
$Comp
L 74xx:74LS04 U1
U 5 1 618B4DD3
P 1375 5475
F 0 "U1" H 1475 5600 50  0000 C CNN
F 1 "74LS04" H 1550 5350 50  0000 C CNN
F 2 "" H 1375 5475 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1375 5475 50  0001 C CNN
	5    1375 5475
	1    0    0    -1  
$EndComp
Wire Wire Line
	925  5475 1075 5475
Wire Wire Line
	1675 5475 2050 5475
Wire Wire Line
	2050 5475 2050 4975
Wire Wire Line
	2050 4975 3425 4975
Wire Wire Line
	2050 5475 2050 6075
Wire Wire Line
	2050 6075 5400 6075
Wire Wire Line
	5400 6075 5400 4975
Wire Wire Line
	5400 4975 6125 4975
Connection ~ 2050 5475
$Comp
L power:VCC #PWR05
U 1 1 618D1EFB
P 3525 4975
F 0 "#PWR05" H 3525 4825 50  0001 C CNN
F 1 "VCC" H 3540 5148 50  0000 C CNN
F 2 "" H 3525 4975 50  0001 C CNN
F 3 "" H 3525 4975 50  0001 C CNN
	1    3525 4975
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 618D24D7
P 4725 5475
F 0 "#PWR07" H 4725 5325 50  0001 C CNN
F 1 "VCC" H 4740 5648 50  0000 C CNN
F 2 "" H 4725 5475 50  0001 C CNN
F 3 "" H 4725 5475 50  0001 C CNN
	1    4725 5475
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR010
U 1 1 618D2AAE
P 6225 4975
F 0 "#PWR010" H 6225 4825 50  0001 C CNN
F 1 "VCC" H 6240 5148 50  0000 C CNN
F 2 "" H 6225 4975 50  0001 C CNN
F 3 "" H 6225 4975 50  0001 C CNN
	1    6225 4975
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR012
U 1 1 618D3095
P 7425 5475
F 0 "#PWR012" H 7425 5325 50  0001 C CNN
F 1 "VCC" H 7440 5648 50  0000 C CNN
F 2 "" H 7425 5475 50  0001 C CNN
F 3 "" H 7425 5475 50  0001 C CNN
	1    7425 5475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 618D380F
P 5825 5475
F 0 "#PWR09" H 5825 5225 50  0001 C CNN
F 1 "GND" H 5830 5302 50  0000 C CNN
F 2 "" H 5825 5475 50  0001 C CNN
F 3 "" H 5825 5475 50  0001 C CNN
	1    5825 5475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 618D3DFE
P 3125 5475
F 0 "#PWR04" H 3125 5225 50  0001 C CNN
F 1 "GND" H 3130 5302 50  0000 C CNN
F 2 "" H 3125 5475 50  0001 C CNN
F 3 "" H 3125 5475 50  0001 C CNN
	1    3125 5475
	1    0    0    -1  
$EndComp
Text HLabel 7025 5975 3    50   Output ~ 0
ADDR_BUS_1
Text HLabel 6925 5975 3    50   Output ~ 0
ADDR_BUS_2
Text HLabel 6825 5975 3    50   Output ~ 0
ADDR_BUS_3
Text HLabel 6725 5975 3    50   Output ~ 0
ADDR_BUS_4
Text HLabel 6625 5975 3    50   Output ~ 0
ADDR_BUS_5
Text HLabel 6525 5975 3    50   Output ~ 0
ADDR_BUS_6
Text HLabel 6425 5975 3    50   Output ~ 0
ADDR_BUS_7
Text HLabel 4425 6200 3    50   Output ~ 0
ADDR_BUS_8
Text HLabel 4325 6200 3    50   Output ~ 0
ADDR_BUS_9
Text HLabel 4225 6200 3    50   Output ~ 0
ADDR_BUS_10
Text HLabel 4125 6200 3    50   Output ~ 0
ADDR_BUS_11
Text HLabel 4025 6200 3    50   Output ~ 0
ADDR_BUS_12
Text HLabel 3925 6200 3    50   Output ~ 0
ADDR_BUS_13
Text HLabel 3825 6200 3    50   Output ~ 0
ADDR_BUS_14
Text HLabel 3725 6200 3    50   Output ~ 0
ADDR_BUS_15
Wire Wire Line
	4425 5975 4425 6200
Wire Wire Line
	4325 6200 4325 5975
Wire Wire Line
	4225 5975 4225 6200
Wire Wire Line
	4125 6200 4125 5975
Wire Wire Line
	4025 5975 4025 6200
Wire Wire Line
	3925 6200 3925 5975
Wire Wire Line
	3825 5975 3825 6200
Wire Wire Line
	3725 6200 3725 5975
$Comp
L power:VCC #PWR06
U 1 1 6190F149
P 4725 3575
F 0 "#PWR06" H 4725 3425 50  0001 C CNN
F 1 "VCC" H 4740 3748 50  0000 C CNN
F 2 "" H 4725 3575 50  0001 C CNN
F 3 "" H 4725 3575 50  0001 C CNN
	1    4725 3575
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR011
U 1 1 6190FBF5
P 7025 3575
F 0 "#PWR011" H 7025 3425 50  0001 C CNN
F 1 "VCC" H 7040 3748 50  0000 C CNN
F 2 "" H 7025 3575 50  0001 C CNN
F 3 "" H 7025 3575 50  0001 C CNN
	1    7025 3575
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR014
U 1 1 619104BC
P 9325 3575
F 0 "#PWR014" H 9325 3425 50  0001 C CNN
F 1 "VCC" H 9340 3748 50  0000 C CNN
F 2 "" H 9325 3575 50  0001 C CNN
F 3 "" H 9325 3575 50  0001 C CNN
	1    9325 3575
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 61910EF1
P 2425 3575
F 0 "#PWR02" H 2425 3425 50  0001 C CNN
F 1 "VCC" H 2440 3748 50  0000 C CNN
F 2 "" H 2425 3575 50  0001 C CNN
F 3 "" H 2425 3575 50  0001 C CNN
	1    2425 3575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6191250C
P 625 3575
F 0 "#PWR01" H 625 3325 50  0001 C CNN
F 1 "GND" H 630 3402 50  0000 C CNN
F 2 "" H 625 3575 50  0001 C CNN
F 3 "" H 625 3575 50  0001 C CNN
	1    625  3575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 61912B47
P 2925 3575
F 0 "#PWR03" H 2925 3325 50  0001 C CNN
F 1 "GND" H 2930 3402 50  0000 C CNN
F 2 "" H 2925 3575 50  0001 C CNN
F 3 "" H 2925 3575 50  0001 C CNN
	1    2925 3575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 619131B9
P 5225 3575
F 0 "#PWR08" H 5225 3325 50  0001 C CNN
F 1 "GND" H 5230 3402 50  0000 C CNN
F 2 "" H 5225 3575 50  0001 C CNN
F 3 "" H 5225 3575 50  0001 C CNN
	1    5225 3575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 6191380C
P 7525 3575
F 0 "#PWR013" H 7525 3325 50  0001 C CNN
F 1 "GND" H 7530 3402 50  0000 C CNN
F 2 "" H 7525 3575 50  0001 C CNN
F 3 "" H 7525 3575 50  0001 C CNN
	1    7525 3575
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U8
U 1 1 6191C83E
P 9400 675
F 0 "U8" H 9625 550 50  0000 C CNN
F 1 "74LS00" H 9700 775 50  0000 C CNN
F 2 "" H 9400 675 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9400 675 50  0001 C CNN
	1    9400 675 
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS00 U8
U 2 1 6191F3EE
P 9425 1025
F 0 "U8" H 9650 900 50  0000 C CNN
F 1 "74LS00" H 9725 1125 50  0000 C CNN
F 2 "" H 9425 1025 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9425 1025 50  0001 C CNN
	2    9425 1025
	-1   0    0    1   
$EndComp
Wire Wire Line
	8025 3075 8025 2975
Wire Wire Line
	8025 2975 7525 2975
Wire Wire Line
	7525 2975 7525 3575
Connection ~ 7525 3575
$Comp
L Device:R_Network08_US RN2
U 1 1 619F200F
P 10075 4675
F 0 "RN2" V 9575 4675 50  0000 C CNN
F 1 "330 Ω" V 10475 4675 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10550 4675 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 10075 4675 50  0001 C CNN
	1    10075 4675
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network08_US RN1
U 1 1 619F6D46
P 5175 4675
F 0 "RN1" V 4675 4675 50  0000 C CNN
F 1 "330 Ω" V 5575 4675 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5650 4675 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5175 4675 50  0001 C CNN
	1    5175 4675
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 619F978C
P 5475 4275
F 0 "#PWR015" H 5475 4025 50  0001 C CNN
F 1 "GND" H 5480 4102 50  0000 C CNN
F 2 "" H 5475 4275 50  0001 C CNN
F 3 "" H 5475 4275 50  0001 C CNN
	1    5475 4275
	1    0    0    -1  
$EndComp
Wire Wire Line
	5375 4275 5475 4275
$EndSCHEMATC
