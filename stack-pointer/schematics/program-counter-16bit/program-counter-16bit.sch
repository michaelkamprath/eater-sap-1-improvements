EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 12992 10827
encoding utf-8
Sheet 1 1
Title "16 Bit Program Counter with Input Selector"
Date ""
Rev ""
Comp ""
Comment1 "PCi - Read value from data bus into high/low byte per HI~LO~ (performs JUMP)"
Comment2 "DSs - Select address bus for input. HI~LO~ is ignored when address bus selected"
Comment3 "PCe - Increment program counter value"
Comment4 "PCa - Write program counter value to address bus"
$EndDescr
$Comp
L 74xx:74LS161 U5
U 1 1 60A226B8
P 4225 5525
F 0 "U5" V 3950 6150 50  0000 L CNN
F 1 "74LS161" V 4225 5350 50  0000 L CNN
F 2 "" H 4225 5525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4225 5525 50  0001 C CNN
	1    4225 5525
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS161 U8
U 1 1 60A2162B
P 6425 5525
F 0 "U8" V 6150 6150 50  0000 L CNN
F 1 "74LS161" V 6425 5350 50  0000 L CNN
F 2 "" H 6425 5525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6425 5525 50  0001 C CNN
	1    6425 5525
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS161 U10
U 1 1 60A1FB05
P 8625 5525
F 0 "U10" V 8350 6150 50  0000 L CNN
F 1 "74LS161" V 8625 5350 50  0000 L CNN
F 2 "" H 8625 5525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8625 5525 50  0001 C CNN
	1    8625 5525
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS161 U13
U 1 1 60A1CE78
P 10825 5525
F 0 "U13" V 10550 6150 50  0000 L CNN
F 1 "74LS161" V 10825 5350 50  0000 L CNN
F 2 "" H 10825 5525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 10825 5525 50  0001 C CNN
	1    10825 5525
	0    1    1    0   
$EndComp
Wire Wire Line
	10825 6025 9725 6025
Wire Wire Line
	9725 6025 9725 4950
Wire Wire Line
	8425 4950 8425 5025
Wire Wire Line
	9725 4950 8425 4950
Wire Wire Line
	8625 6025 7525 6025
Wire Wire Line
	7525 6025 7525 4950
Wire Wire Line
	7525 4950 6225 4950
Wire Wire Line
	6225 4950 6225 5025
Wire Wire Line
	6425 6025 5300 6025
Wire Wire Line
	5300 6025 5300 4950
Wire Wire Line
	5300 4950 4025 4950
Wire Wire Line
	4025 4950 4025 5025
Text HLabel 11875 2375 2    50   Input ~ 0
BUS_0
Text HLabel 11875 2300 2    50   Input ~ 0
BUS_1
Text HLabel 11875 2225 2    50   Input ~ 0
BUS_2
Text HLabel 11875 2150 2    50   Input ~ 0
BUS_3
Text HLabel 11875 2075 2    50   Input ~ 0
BUS_4
Text HLabel 11875 2000 2    50   Input ~ 0
BUS_5
Text HLabel 11875 1925 2    50   Input ~ 0
BUS_6
Text HLabel 11875 1850 2    50   Input ~ 0
BUS_7
Text HLabel 975  3825 0    50   Input ~ 0
PCi
Text HLabel 975  4375 0    50   Input ~ 0
HI~LO
Wire Wire Line
	3425 3925 4225 3925
Wire Wire Line
	4225 3925 4225 5025
Wire Wire Line
	4225 3925 6425 3925
Wire Wire Line
	6425 3925 6425 5025
Connection ~ 4225 3925
Wire Wire Line
	3425 4300 8625 4300
Wire Wire Line
	8625 4300 8625 5025
Wire Wire Line
	8625 4300 10825 4300
Wire Wire Line
	10825 4300 10825 5025
Connection ~ 8625 4300
Text HLabel 1000 4625 0    50   Input ~ 0
PCe
Text HLabel 1000 4725 0    50   Input ~ 0
CLK
Text HLabel 1000 4825 0    50   Input ~ 0
~CLR
Wire Wire Line
	1000 4625 4125 4625
Wire Wire Line
	4125 4625 4125 5025
Wire Wire Line
	4125 4625 6325 4625
Wire Wire Line
	6325 4625 6325 5025
Connection ~ 4125 4625
Wire Wire Line
	6325 4625 8525 4625
Wire Wire Line
	8525 4625 8525 5025
Connection ~ 6325 4625
Wire Wire Line
	8525 4625 10725 4625
Wire Wire Line
	10725 4625 10725 5025
Connection ~ 8525 4625
Wire Wire Line
	10625 5025 10625 4950
$Comp
L power:GND #PWR020
U 1 1 60687D03
P 10025 5525
F 0 "#PWR020" H 10025 5275 50  0001 C CNN
F 1 "GND" H 10030 5352 50  0000 C CNN
F 2 "" H 10025 5525 50  0001 C CNN
F 3 "" H 10025 5525 50  0001 C CNN
	1    10025 5525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 60688196
P 7825 5525
F 0 "#PWR014" H 7825 5275 50  0001 C CNN
F 1 "GND" H 7830 5352 50  0000 C CNN
F 2 "" H 7825 5525 50  0001 C CNN
F 3 "" H 7825 5525 50  0001 C CNN
	1    7825 5525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 6068854D
P 5625 5525
F 0 "#PWR08" H 5625 5275 50  0001 C CNN
F 1 "GND" H 5630 5352 50  0000 C CNN
F 2 "" H 5625 5525 50  0001 C CNN
F 3 "" H 5625 5525 50  0001 C CNN
	1    5625 5525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 60688D53
P 3425 5525
F 0 "#PWR02" H 3425 5275 50  0001 C CNN
F 1 "GND" H 3430 5352 50  0000 C CNN
F 2 "" H 3425 5525 50  0001 C CNN
F 3 "" H 3425 5525 50  0001 C CNN
	1    3425 5525
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 4725 3925 4725
Wire Wire Line
	3925 4725 3925 5025
Wire Wire Line
	3925 4725 6125 4725
Wire Wire Line
	6125 4725 6125 5025
Connection ~ 3925 4725
Wire Wire Line
	6125 4725 8325 4725
Wire Wire Line
	8325 4725 8325 5025
Connection ~ 6125 4725
Wire Wire Line
	8325 4725 10525 4725
Wire Wire Line
	10525 4725 10525 5025
Connection ~ 8325 4725
Wire Wire Line
	1000 4825 3725 4825
Wire Wire Line
	3725 4825 3725 5025
Wire Wire Line
	3725 4825 5925 4825
Wire Wire Line
	5925 4825 5925 5025
Connection ~ 3725 4825
Wire Wire Line
	5925 4825 8125 4825
Wire Wire Line
	8125 4825 8125 5025
Connection ~ 5925 4825
Wire Wire Line
	8125 4825 10325 4825
Wire Wire Line
	10325 4825 10325 5025
Connection ~ 8125 4825
NoConn ~ 4225 6025
$Comp
L 74xx:74LS245 U11
U 1 1 6069C49A
P 9025 7675
F 0 "U11" V 8750 8300 50  0000 L CNN
F 1 "74LS245" V 9400 7025 50  0000 L CNN
F 2 "" H 9025 7675 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 9025 7675 50  0001 C CNN
	1    9025 7675
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS245 U6
U 1 1 606A2B90
P 4625 7650
F 0 "U6" V 4350 8275 50  0000 L CNN
F 1 "74LS245" V 5000 7000 50  0000 L CNN
F 2 "" H 4625 7650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 4625 7650 50  0001 C CNN
	1    4625 7650
	0    1    1    0   
$EndComp
Wire Wire Line
	8825 6025 8825 6400
Wire Wire Line
	8925 6025 8925 6475
Wire Wire Line
	9025 6025 9025 6550
Wire Wire Line
	9125 6025 9125 6625
Wire Wire Line
	11025 6025 11025 6100
Wire Wire Line
	11025 6100 9225 6100
Wire Wire Line
	9225 6100 9225 6700
Wire Wire Line
	11125 6025 11125 6175
Wire Wire Line
	11125 6175 9325 6175
Wire Wire Line
	9325 6175 9325 6775
Wire Wire Line
	11225 6025 11225 6250
Wire Wire Line
	11225 6250 9425 6250
Wire Wire Line
	9425 6250 9425 6850
Wire Wire Line
	11325 6025 11325 6325
Wire Wire Line
	11325 6325 9525 6325
Wire Wire Line
	9525 6325 9525 6925
Wire Wire Line
	4425 6025 4425 6925
Wire Wire Line
	4525 6025 4525 6850
Wire Wire Line
	4625 6025 4625 6775
Wire Wire Line
	4725 6025 4725 6700
Wire Wire Line
	6625 6025 6625 6100
Wire Wire Line
	6625 6100 6300 6100
Wire Wire Line
	4825 6100 4825 7150
Wire Wire Line
	6725 6025 6725 6175
Wire Wire Line
	6725 6175 6400 6175
Wire Wire Line
	4925 6175 4925 7150
Wire Wire Line
	6825 6025 6825 6250
Wire Wire Line
	6825 6250 6500 6250
Wire Wire Line
	5025 6250 5025 7150
Wire Wire Line
	6925 6025 6925 6325
Wire Wire Line
	6925 6325 6600 6325
Text HLabel 2100 7000 0    50   Input ~ 0
PCa
$Comp
L 74xx:74LS04 U1
U 2 1 606D80AD
P 2400 7000
F 0 "U1" H 2400 7317 50  0000 C CNN
F 1 "74LS04" H 2400 7226 50  0000 C CNN
F 2 "" H 2400 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2400 7000 50  0001 C CNN
	2    2400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4225 7150 4225 7075
Wire Wire Line
	4225 7075 5425 7075
Wire Wire Line
	5425 7075 5425 7650
Wire Wire Line
	8625 7175 8625 7075
Wire Wire Line
	8625 7075 9825 7075
Wire Wire Line
	9825 7075 9825 7675
Wire Wire Line
	2700 7000 4125 7000
Wire Wire Line
	4125 7000 4125 7150
Wire Wire Line
	4125 7000 8525 7000
Wire Wire Line
	8525 7000 8525 7175
Connection ~ 4125 7000
$Comp
L common-symbols:BarGraphLED_8P BAR1
U 1 1 606FFA03
P 6200 7450
F 0 "BAR1" V 6200 6825 50  0000 L CNN
F 1 "BarGraphLED_8P" V 6245 7980 50  0001 L CNN
F 2 "" H 6200 7450 50  0001 C CNN
F 3 "" H 6200 7450 50  0001 C CNN
	1    6200 7450
	0    1    1    0   
$EndComp
$Comp
L common-symbols:BarGraphLED_8P BAR2
U 1 1 607039DE
P 7175 7450
F 0 "BAR2" V 7175 7980 50  0000 L CNN
F 1 "BarGraphLED_8P" V 7220 7980 50  0001 L CNN
F 2 "" H 7175 7450 50  0001 C CNN
F 3 "" H 7175 7450 50  0001 C CNN
	1    7175 7450
	0    1    1    0   
$EndComp
Wire Wire Line
	7575 7250 7575 6925
Wire Wire Line
	7575 6925 9525 6925
Connection ~ 9525 6925
Wire Wire Line
	9525 6925 9525 7175
Wire Wire Line
	7475 7250 7475 6850
Wire Wire Line
	7475 6850 9425 6850
Connection ~ 9425 6850
Wire Wire Line
	9425 6850 9425 7175
Wire Wire Line
	7375 7250 7375 6775
Wire Wire Line
	7375 6775 9325 6775
Connection ~ 9325 6775
Wire Wire Line
	9325 6775 9325 7175
Wire Wire Line
	7275 7250 7275 6700
Wire Wire Line
	7275 6700 9225 6700
Connection ~ 9225 6700
Wire Wire Line
	9225 6700 9225 7175
Wire Wire Line
	7175 7250 7175 6625
Wire Wire Line
	7175 6625 9125 6625
Connection ~ 9125 6625
Wire Wire Line
	9125 6625 9125 7175
Wire Wire Line
	7075 7250 7075 6550
Wire Wire Line
	7075 6550 9025 6550
Connection ~ 9025 6550
Wire Wire Line
	9025 6550 9025 7175
Wire Wire Line
	6975 7250 6975 6475
Wire Wire Line
	6975 6475 8925 6475
Connection ~ 8925 6475
Wire Wire Line
	8925 6475 8925 7175
Wire Wire Line
	6875 7250 6875 6400
Wire Wire Line
	6875 6400 8825 6400
Connection ~ 8825 6400
Wire Wire Line
	8825 6400 8825 7175
Wire Wire Line
	5125 6325 5125 7150
Wire Wire Line
	6600 7250 6600 6325
Connection ~ 6600 6325
Wire Wire Line
	6600 6325 5125 6325
Wire Wire Line
	6500 7250 6500 6250
Connection ~ 6500 6250
Wire Wire Line
	6500 6250 5025 6250
Wire Wire Line
	6400 7250 6400 6175
Connection ~ 6400 6175
Wire Wire Line
	6400 6175 4925 6175
Wire Wire Line
	6300 7250 6300 6100
Connection ~ 6300 6100
Wire Wire Line
	6300 6100 4825 6100
Wire Wire Line
	5900 7250 5900 6925
Wire Wire Line
	5900 6925 4425 6925
Connection ~ 4425 6925
Wire Wire Line
	4425 6925 4425 7150
Wire Wire Line
	6000 7250 6000 6850
Wire Wire Line
	6000 6850 4525 6850
Connection ~ 4525 6850
Wire Wire Line
	4525 6850 4525 7150
Wire Wire Line
	6100 7250 6100 6775
Wire Wire Line
	6100 6775 4625 6775
Connection ~ 4625 6775
Wire Wire Line
	4625 6775 4625 7150
Wire Wire Line
	6200 7250 6200 6700
Wire Wire Line
	6200 6700 4725 6700
Connection ~ 4725 6700
Wire Wire Line
	4725 6700 4725 7150
$Comp
L Device:R_Network08_US RN1
U 1 1 6077D426
P 6200 7850
F 0 "RN1" H 6725 7850 50  0000 R CNN
F 1 "R_Network08_US" H 5720 7895 50  0001 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 6675 7850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6200 7850 50  0001 C CNN
	1    6200 7850
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Network08_US RN2
U 1 1 60780E00
P 7175 7850
F 0 "RN2" H 6700 7850 50  0000 R CNN
F 1 "R_Network08_US" H 6695 7895 50  0001 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 7650 7850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7175 7850 50  0001 C CNN
	1    7175 7850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 60782C12
P 6600 8050
F 0 "#PWR09" H 6600 7800 50  0001 C CNN
F 1 "GND" H 6605 7877 50  0000 C CNN
F 2 "" H 6600 8050 50  0001 C CNN
F 3 "" H 6600 8050 50  0001 C CNN
	1    6600 8050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 607831DD
P 7575 8050
F 0 "#PWR013" H 7575 7800 50  0001 C CNN
F 1 "GND" H 7580 7877 50  0000 C CNN
F 2 "" H 7575 8050 50  0001 C CNN
F 3 "" H 7575 8050 50  0001 C CNN
	1    7575 8050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 607837B4
P 3825 7650
F 0 "#PWR03" H 3825 7400 50  0001 C CNN
F 1 "GND" H 3830 7477 50  0000 C CNN
F 2 "" H 3825 7650 50  0001 C CNN
F 3 "" H 3825 7650 50  0001 C CNN
	1    3825 7650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 60783D93
P 8225 7675
F 0 "#PWR015" H 8225 7425 50  0001 C CNN
F 1 "GND" H 8230 7502 50  0000 C CNN
F 2 "" H 8225 7675 50  0001 C CNN
F 3 "" H 8225 7675 50  0001 C CNN
	1    8225 7675
	1    0    0    -1  
$EndComp
Text HLabel 4425 8350 3    50   Output ~ 0
ADDR_BUS_15
Text HLabel 4525 8350 3    50   Output ~ 0
ADDR_BUS_14
Text HLabel 4625 8350 3    50   Output ~ 0
ADDR_BUS_13
Text HLabel 4725 8350 3    50   Output ~ 0
ADDR_BUS_12
Text HLabel 4825 8350 3    50   Output ~ 0
ADDR_BUS_11
Text HLabel 4925 8350 3    50   Output ~ 0
ADDR_BUS_10
Text HLabel 5025 8350 3    50   Output ~ 0
ADDR_BUS_9
Text HLabel 5125 8350 3    50   Output ~ 0
ADDR_BUS_8
Text HLabel 8825 8375 3    50   Output ~ 0
ADDR_BUS_7
Text HLabel 8925 8375 3    50   Output ~ 0
ADDR_BUS_6
Text HLabel 9025 8375 3    50   Output ~ 0
ADDR_BUS_5
Text HLabel 9125 8375 3    50   Output ~ 0
ADDR_BUS_4
Text HLabel 9225 8375 3    50   Output ~ 0
ADDR_BUS_3
Text HLabel 9325 8375 3    50   Output ~ 0
ADDR_BUS_2
Text HLabel 9425 8375 3    50   Output ~ 0
ADDR_BUS_1
Text HLabel 9525 8375 3    50   Output ~ 0
ADDR_BUS_0
Wire Wire Line
	9525 8175 9525 8375
Wire Wire Line
	9425 8175 9425 8375
Wire Wire Line
	9325 8175 9325 8375
Wire Wire Line
	9225 8175 9225 8375
Wire Wire Line
	9125 8175 9125 8375
Wire Wire Line
	9025 8175 9025 8375
Wire Wire Line
	8925 8175 8925 8375
Wire Wire Line
	8825 8175 8825 8375
Wire Wire Line
	5125 8150 5125 8350
Wire Wire Line
	5025 8150 5025 8350
Wire Wire Line
	4925 8150 4925 8350
Wire Wire Line
	4825 8150 4825 8350
Wire Wire Line
	4725 8150 4725 8350
Wire Wire Line
	4625 8350 4625 8150
Wire Wire Line
	4525 8150 4525 8350
Wire Wire Line
	4425 8150 4425 8350
$Comp
L power:VCC #PWR07
U 1 1 608307C9
P 5425 7650
F 0 "#PWR07" H 5425 7500 50  0001 C CNN
F 1 "VCC" H 5440 7823 50  0000 C CNN
F 2 "" H 5425 7650 50  0001 C CNN
F 3 "" H 5425 7650 50  0001 C CNN
	1    5425 7650
	-1   0    0    1   
$EndComp
Connection ~ 5425 7650
$Comp
L power:VCC #PWR019
U 1 1 608312BD
P 9825 7675
F 0 "#PWR019" H 9825 7525 50  0001 C CNN
F 1 "VCC" H 9840 7848 50  0000 C CNN
F 2 "" H 9825 7675 50  0001 C CNN
F 3 "" H 9825 7675 50  0001 C CNN
	1    9825 7675
	-1   0    0    1   
$EndComp
Connection ~ 9825 7675
$Comp
L power:VCC #PWR022
U 1 1 608326A1
P 11625 5525
F 0 "#PWR022" H 11625 5375 50  0001 C CNN
F 1 "VCC" H 11640 5698 50  0000 C CNN
F 2 "" H 11625 5525 50  0001 C CNN
F 3 "" H 11625 5525 50  0001 C CNN
	1    11625 5525
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR017
U 1 1 60832C9C
P 9425 5525
F 0 "#PWR017" H 9425 5375 50  0001 C CNN
F 1 "VCC" H 9440 5698 50  0000 C CNN
F 2 "" H 9425 5525 50  0001 C CNN
F 3 "" H 9425 5525 50  0001 C CNN
	1    9425 5525
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR011
U 1 1 608332A7
P 7225 5525
F 0 "#PWR011" H 7225 5375 50  0001 C CNN
F 1 "VCC" H 7240 5698 50  0000 C CNN
F 2 "" H 7225 5525 50  0001 C CNN
F 3 "" H 7225 5525 50  0001 C CNN
	1    7225 5525
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 608338C2
P 5025 5525
F 0 "#PWR05" H 5025 5375 50  0001 C CNN
F 1 "VCC" H 5040 5698 50  0000 C CNN
F 2 "" H 5025 5525 50  0001 C CNN
F 3 "" H 5025 5525 50  0001 C CNN
	1    5025 5525
	1    0    0    -1  
$EndComp
Wire Wire Line
	10625 4950 11775 4950
Wire Wire Line
	11775 4950 11775 5525
Wire Wire Line
	11775 5525 11625 5525
Connection ~ 11625 5525
$Comp
L 74xx:74LS157 U12
U 1 1 616A16E3
P 10725 3050
F 0 "U12" V 10450 3800 50  0000 L CNN
F 1 "74LS157" V 10725 2850 50  0000 L CNN
F 2 "" H 10725 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 10725 3050 50  0001 C CNN
	1    10725 3050
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U7
U 1 1 61733CC5
P 6325 3050
F 0 "U7" V 6050 3800 50  0000 L CNN
F 1 "74LS157" V 6325 2850 50  0000 L CNN
F 2 "" H 6325 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 6325 3050 50  0001 C CNN
	1    6325 3050
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U9
U 1 1 61732AEA
P 8525 3050
F 0 "U9" V 8250 3800 50  0000 L CNN
F 1 "74LS157" V 8525 2850 50  0000 L CNN
F 2 "" H 8525 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8525 3050 50  0001 C CNN
	1    8525 3050
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS157 U4
U 1 1 617425FD
P 4125 3050
F 0 "U4" V 3850 3800 50  0000 L CNN
F 1 "74LS157" V 4125 2850 50  0000 L CNN
F 2 "" H 4125 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 4125 3050 50  0001 C CNN
	1    4125 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	11325 3550 11325 5025
Wire Wire Line
	11025 3550 11225 3550
Wire Wire Line
	11225 3550 11225 5025
Wire Wire Line
	10725 3550 10725 3625
Wire Wire Line
	10725 3625 11125 3625
Wire Wire Line
	11125 3625 11125 5025
Wire Wire Line
	10425 3550 10425 3700
Wire Wire Line
	10425 3700 11025 3700
Wire Wire Line
	11025 3700 11025 5025
Wire Wire Line
	11875 2375 11325 2375
Wire Wire Line
	11325 2375 11325 2550
Wire Wire Line
	11325 2375 6925 2375
Wire Wire Line
	6925 2375 6925 2550
Connection ~ 11325 2375
Wire Wire Line
	11875 2300 11025 2300
Wire Wire Line
	11025 2300 11025 2550
Wire Wire Line
	11025 2300 6625 2300
Wire Wire Line
	6625 2300 6625 2550
Connection ~ 11025 2300
Wire Wire Line
	11875 2225 10725 2225
Wire Wire Line
	10725 2225 10725 2550
Wire Wire Line
	10725 2225 6325 2225
Wire Wire Line
	6325 2225 6325 2550
Connection ~ 10725 2225
Wire Wire Line
	11875 2150 10425 2150
Wire Wire Line
	10425 2150 10425 2550
Wire Wire Line
	10425 2150 6025 2150
Wire Wire Line
	6025 2150 6025 2550
Connection ~ 10425 2150
Wire Wire Line
	11875 2075 9125 2075
Wire Wire Line
	9125 2075 9125 2550
Wire Wire Line
	9125 2075 4725 2075
Wire Wire Line
	4725 2075 4725 2550
Connection ~ 9125 2075
Wire Wire Line
	11875 2000 8825 2000
Wire Wire Line
	8825 2000 8825 2550
Wire Wire Line
	8825 2000 4425 2000
Wire Wire Line
	4425 2000 4425 2550
Connection ~ 8825 2000
Wire Wire Line
	11875 1925 8525 1925
Wire Wire Line
	8525 1925 8525 2550
Wire Wire Line
	8525 1925 4125 1925
Wire Wire Line
	4125 1925 4125 2550
Connection ~ 8525 1925
Wire Wire Line
	11875 1850 8225 1850
Wire Wire Line
	3825 1850 3825 2550
Wire Wire Line
	8225 2550 8225 1850
Connection ~ 8225 1850
Wire Wire Line
	8225 1850 3825 1850
Wire Wire Line
	9125 3550 9125 5025
Wire Wire Line
	8825 3550 9025 3550
Wire Wire Line
	9025 3550 9025 5025
Wire Wire Line
	8525 3550 8525 3625
Wire Wire Line
	8525 3625 8925 3625
Wire Wire Line
	8925 3625 8925 5025
Wire Wire Line
	8225 3550 8225 3700
Wire Wire Line
	8225 3700 8825 3700
Wire Wire Line
	8825 3700 8825 5025
Wire Wire Line
	6925 3550 6925 5025
Wire Wire Line
	6625 3550 6825 3550
Wire Wire Line
	6825 3550 6825 5025
Wire Wire Line
	6325 3550 6325 3625
Wire Wire Line
	6325 3625 6725 3625
Wire Wire Line
	6725 3625 6725 5025
Wire Wire Line
	6025 3550 6025 3700
Wire Wire Line
	6025 3700 6625 3700
Wire Wire Line
	6625 3700 6625 5025
Wire Wire Line
	4725 3550 4725 5025
Wire Wire Line
	4425 3550 4625 3550
Wire Wire Line
	4625 3550 4625 5025
Wire Wire Line
	4125 3550 4125 3625
Wire Wire Line
	4125 3625 4525 3625
Wire Wire Line
	4525 3625 4525 5025
Wire Wire Line
	3825 3550 3825 3700
Wire Wire Line
	3825 3700 4425 3700
Wire Wire Line
	4425 3700 4425 5025
Text HLabel 3725 1575 1    50   Input ~ 0
ADDR_BUS_15
Text HLabel 4025 1575 1    50   Input ~ 0
ADDR_BUS_14
Text HLabel 4325 1575 1    50   Input ~ 0
ADDR_BUS_13
Text HLabel 4625 1575 1    50   Input ~ 0
ADDR_BUS_12
Text HLabel 5925 1575 1    50   Input ~ 0
ADDR_BUS_11
Text HLabel 6225 1575 1    50   Input ~ 0
ADDR_BUS_10
Text HLabel 6525 1575 1    50   Input ~ 0
ADDR_BUS_9
Text HLabel 6825 1575 1    50   Input ~ 0
ADDR_BUS_8
Text HLabel 8125 1600 1    50   Input ~ 0
ADDR_BUS_7
Text HLabel 8425 1600 1    50   Input ~ 0
ADDR_BUS_6
Text HLabel 8725 1600 1    50   Input ~ 0
ADDR_BUS_5
Text HLabel 9025 1600 1    50   Input ~ 0
ADDR_BUS_4
Text HLabel 10325 1600 1    50   Input ~ 0
ADDR_BUS_3
Text HLabel 10625 1600 1    50   Input ~ 0
ADDR_BUS_2
Text HLabel 10925 1600 1    50   Input ~ 0
ADDR_BUS_1
Text HLabel 11225 1600 1    50   Input ~ 0
ADDR_BUS_0
Wire Wire Line
	11225 2550 11225 1600
Wire Wire Line
	10925 2550 10925 1600
Wire Wire Line
	10625 2550 10625 1600
Wire Wire Line
	10325 1600 10325 2550
Wire Wire Line
	9025 1600 9025 2550
Wire Wire Line
	8725 1600 8725 2550
Wire Wire Line
	8425 1600 8425 2550
Wire Wire Line
	8125 1600 8125 2550
Text HLabel 975  3475 0    50   Input ~ 0
DSs
$Comp
L 74xx:74LS08 U2
U 1 1 619D1982
P 2050 3575
F 0 "U2" H 2300 3500 50  0000 C CNN
F 1 "74LS08" H 2325 3700 50  0000 C CNN
F 2 "" H 2050 3575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2050 3575 50  0001 C CNN
	1    2050 3575
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U2
U 2 1 619D533B
P 2050 3925
F 0 "U2" H 2300 3850 50  0000 C CNN
F 1 "74LS08" H 2325 4050 50  0000 C CNN
F 2 "" H 2050 3925 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2050 3925 50  0001 C CNN
	2    2050 3925
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U2
U 3 1 619D708E
P 2050 4275
F 0 "U2" H 2300 4200 50  0000 C CNN
F 1 "74LS08" H 2325 4400 50  0000 C CNN
F 2 "" H 2050 4275 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2050 4275 50  0001 C CNN
	3    2050 4275
	1    0    0    -1  
$EndComp
Wire Wire Line
	975  3475 1600 3475
$Comp
L 74xx:74LS04 U1
U 1 1 619E9C32
P 1350 4375
F 0 "U1" H 1450 4250 50  0000 C CNN
F 1 "74LS04" H 1500 4500 50  0000 C CNN
F 2 "" H 1350 4375 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1350 4375 50  0001 C CNN
	1    1350 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	975  4375 1050 4375
Wire Wire Line
	1650 4375 1750 4375
Wire Wire Line
	1050 4375 1050 4025
Wire Wire Line
	1050 4025 1750 4025
Connection ~ 1050 4375
Wire Wire Line
	1000 3825 1600 3825
Wire Wire Line
	1600 3825 1600 4175
Wire Wire Line
	1600 4175 1750 4175
Connection ~ 1600 3825
Wire Wire Line
	1600 3825 1750 3825
Wire Wire Line
	1600 3825 1600 3675
Wire Wire Line
	1600 3675 1750 3675
$Comp
L 74xx:74LS02 U3
U 1 1 61A4ED21
P 3125 3925
F 0 "U3" H 3350 3800 50  0000 C CNN
F 1 "74LS02" H 3400 4050 50  0000 C CNN
F 2 "" H 3125 3925 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 3125 3925 50  0001 C CNN
	1    3125 3925
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U3
U 2 1 61A53DB5
P 3125 4300
F 0 "U3" H 3350 4175 50  0000 C CNN
F 1 "74LS02" H 3400 4425 50  0000 C CNN
F 2 "" H 3125 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 3125 4300 50  0001 C CNN
	2    3125 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4275 2450 4275
Wire Wire Line
	2450 4275 2450 4400
Wire Wire Line
	2450 4400 2825 4400
Wire Wire Line
	2350 3925 2525 3925
Wire Wire Line
	2525 3925 2525 4025
Wire Wire Line
	2525 4025 2825 4025
Wire Wire Line
	2350 3575 2650 3575
Wire Wire Line
	2650 3575 2650 3825
Wire Wire Line
	2650 3825 2825 3825
Wire Wire Line
	2650 3825 2650 4200
Wire Wire Line
	2650 4200 2825 4200
Connection ~ 2650 3825
Wire Wire Line
	10125 2550 10125 2450
Wire Wire Line
	10125 2450 7925 2450
Wire Wire Line
	7925 2450 7925 2550
Wire Wire Line
	7925 2450 5725 2450
Wire Wire Line
	5725 2450 5725 2550
Connection ~ 7925 2450
Wire Wire Line
	5725 2450 3525 2450
Wire Wire Line
	3525 2450 3525 2550
Connection ~ 5725 2450
Wire Wire Line
	1600 3475 1600 2450
Wire Wire Line
	1600 2450 3525 2450
Connection ~ 1600 3475
Wire Wire Line
	1600 3475 1750 3475
Connection ~ 3525 2450
Wire Wire Line
	3425 2550 3125 2550
Wire Wire Line
	3125 2550 3125 3050
Wire Wire Line
	5625 2550 5325 2550
Wire Wire Line
	5325 2550 5325 3050
Wire Wire Line
	7825 2550 7525 2550
Wire Wire Line
	7525 2550 7525 3050
Wire Wire Line
	9725 2550 9725 3050
Wire Wire Line
	9725 2550 10025 2550
Wire Wire Line
	6825 1575 6825 2550
Wire Wire Line
	6525 1575 6525 2550
Wire Wire Line
	6225 1575 6225 2550
Wire Wire Line
	5925 1575 5925 2550
Wire Wire Line
	4625 1575 4625 2550
Wire Wire Line
	4325 1575 4325 2550
Wire Wire Line
	4025 1575 4025 2550
Wire Wire Line
	3725 1575 3725 2550
$Comp
L power:GND #PWR01
U 1 1 61C59ED0
P 3125 3050
F 0 "#PWR01" H 3125 2800 50  0001 C CNN
F 1 "GND" H 3130 2877 50  0000 C CNN
F 2 "" H 3125 3050 50  0001 C CNN
F 3 "" H 3125 3050 50  0001 C CNN
	1    3125 3050
	1    0    0    -1  
$EndComp
Connection ~ 3125 3050
$Comp
L power:GND #PWR06
U 1 1 61C5A729
P 5325 3050
F 0 "#PWR06" H 5325 2800 50  0001 C CNN
F 1 "GND" H 5330 2877 50  0000 C CNN
F 2 "" H 5325 3050 50  0001 C CNN
F 3 "" H 5325 3050 50  0001 C CNN
	1    5325 3050
	1    0    0    -1  
$EndComp
Connection ~ 5325 3050
$Comp
L power:GND #PWR012
U 1 1 61C5AF8E
P 7525 3050
F 0 "#PWR012" H 7525 2800 50  0001 C CNN
F 1 "GND" H 7530 2877 50  0000 C CNN
F 2 "" H 7525 3050 50  0001 C CNN
F 3 "" H 7525 3050 50  0001 C CNN
	1    7525 3050
	1    0    0    -1  
$EndComp
Connection ~ 7525 3050
$Comp
L power:GND #PWR018
U 1 1 61C5B7FF
P 9725 3050
F 0 "#PWR018" H 9725 2800 50  0001 C CNN
F 1 "GND" H 9730 2877 50  0000 C CNN
F 2 "" H 9725 3050 50  0001 C CNN
F 3 "" H 9725 3050 50  0001 C CNN
	1    9725 3050
	1    0    0    -1  
$EndComp
Connection ~ 9725 3050
$Comp
L power:VCC #PWR04
U 1 1 61C5C9E6
P 5025 3050
F 0 "#PWR04" H 5025 2900 50  0001 C CNN
F 1 "VCC" H 5040 3223 50  0000 C CNN
F 2 "" H 5025 3050 50  0001 C CNN
F 3 "" H 5025 3050 50  0001 C CNN
	1    5025 3050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR016
U 1 1 61C5D2AF
P 9425 3050
F 0 "#PWR016" H 9425 2900 50  0001 C CNN
F 1 "VCC" H 9440 3223 50  0000 C CNN
F 2 "" H 9425 3050 50  0001 C CNN
F 3 "" H 9425 3050 50  0001 C CNN
	1    9425 3050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR010
U 1 1 61C5DB88
P 7225 3050
F 0 "#PWR010" H 7225 2900 50  0001 C CNN
F 1 "VCC" H 7240 3223 50  0000 C CNN
F 2 "" H 7225 3050 50  0001 C CNN
F 3 "" H 7225 3050 50  0001 C CNN
	1    7225 3050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR021
U 1 1 61C5E471
P 11625 3050
F 0 "#PWR021" H 11625 2900 50  0001 C CNN
F 1 "VCC" H 11640 3223 50  0000 C CNN
F 2 "" H 11625 3050 50  0001 C CNN
F 3 "" H 11625 3050 50  0001 C CNN
	1    11625 3050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
