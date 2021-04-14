EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "32K RAM / 32K ROM Module for Eater SAP-1"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ram-rom-module-parts:UM61512A U2
U 1 1 6042600F
P 3650 1950
F 0 "U2" V 4450 -250 50  0000 C CNN
F 1 "UM61512A" V 4000 775 50  0000 C CNN
F 2 "" H 3900 -150 50  0001 C CNN
F 3 "" H 3900 -150 50  0001 C CNN
	1    3650 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	3425 2800 3425 3275
Wire Wire Line
	3225 2800 3225 3425
Wire Wire Line
	3125 2800 3125 3500
Wire Wire Line
	3025 2800 3025 3575
Wire Wire Line
	2925 2800 2925 3650
Wire Wire Line
	2825 2800 2825 3725
Wire Wire Line
	3525 2800 3525 3200
Wire Wire Line
	4650 3725 2825 3725
Connection ~ 2825 3725
Wire Wire Line
	4950 3650 2925 3650
Connection ~ 2925 3650
Connection ~ 3025 3575
Wire Wire Line
	5550 3500 3125 3500
Connection ~ 3125 3500
Wire Wire Line
	6675 3425 5975 3425
Connection ~ 3225 3425
Wire Wire Line
	3325 2800 3325 3350
Wire Wire Line
	6975 3350 5875 3350
Connection ~ 3325 3350
Wire Wire Line
	7275 3275 5775 3275
Connection ~ 3425 3275
Connection ~ 3525 3200
$Comp
L ram-rom-upgrade-symbols:BarGraphLED_8P BAR1
U 1 1 605ABF74
P 1175 4275
F 0 "BAR1" V 1175 4800 50  0000 L CNN
F 1 "BarGraphLED_8P" H 900 3775 50  0000 L CNN
F 2 "" H 1175 4275 50  0001 C CNN
F 3 "" H 1175 4275 50  0001 C CNN
	1    1175 4275
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network08_US RN1
U 1 1 605C7F18
P 1175 4750
F 0 "RN1" H 695 4704 50  0000 R CNN
F 1 "220 Ω" H 695 4795 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 1650 4750 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 1175 4750 50  0001 C CNN
	1    1175 4750
	-1   0    0    1   
$EndComp
Wire Wire Line
	875  4475 875  4550
Wire Wire Line
	975  4475 975  4550
Wire Wire Line
	1075 4475 1075 4550
Wire Wire Line
	1175 4475 1175 4550
Wire Wire Line
	1275 4475 1275 4550
Wire Wire Line
	1375 4475 1375 4550
Wire Wire Line
	1475 4475 1475 4550
Wire Wire Line
	1575 4475 1575 4550
$Comp
L power:GND #PWR0101
U 1 1 605DD0AA
P 1575 5025
F 0 "#PWR0101" H 1575 4775 50  0001 C CNN
F 1 "GND" H 1580 4852 50  0000 C CNN
F 2 "" H 1575 5025 50  0001 C CNN
F 3 "" H 1575 5025 50  0001 C CNN
	1    1575 5025
	1    0    0    -1  
$EndComp
Wire Wire Line
	1575 4950 1575 5025
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 605E04A7
P 4050 6775
F 0 "SW1" V 4004 7305 50  0000 L CNN
F 1 "SW_DIP_x08" V 4095 7305 50  0000 L CNN
F 2 "" H 4050 6775 50  0001 C CNN
F 3 "~" H 4050 6775 50  0001 C CNN
	1    4050 6775
	0    1    1    0   
$EndComp
Wire Wire Line
	2825 6300 2825 5250
Wire Wire Line
	2925 6225 2925 5250
Wire Wire Line
	3025 6150 3025 5250
Wire Wire Line
	3125 6075 3125 5250
Wire Wire Line
	3225 6000 3225 5250
Wire Wire Line
	3325 5925 3325 5250
Wire Wire Line
	3425 5850 3425 5250
Wire Wire Line
	3525 5775 3525 5250
$Comp
L 74xx:74LS245 U1
U 1 1 60575E88
P 3325 4750
F 0 "U1" V 3075 4000 50  0000 L CNN
F 1 "74LS245" V 3425 4600 50  0000 L CNN
F 2 "" H 3325 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 3325 4750 50  0001 C CNN
	1    3325 4750
	0    -1   1    0   
$EndComp
Text HLabel 8150 6300 2    50   BiDi ~ 0
BUS_0
Text HLabel 8150 6225 2    50   BiDi ~ 0
BUS_1
Text HLabel 8150 6150 2    50   BiDi ~ 0
BUS_2
Text HLabel 8150 6075 2    50   BiDi ~ 0
BUS_3
Text HLabel 8150 6000 2    50   BiDi ~ 0
BUS_4
Text HLabel 8150 5925 2    50   BiDi ~ 0
BUS_5
Text HLabel 8150 5850 2    50   BiDi ~ 0
BUS_6
Text HLabel 8150 5775 2    50   BiDi ~ 0
BUS_7
Wire Wire Line
	7575 3200 7575 4250
Wire Wire Line
	7275 3275 7275 4250
Wire Wire Line
	6975 3350 6975 4250
Wire Wire Line
	6675 3425 6675 4250
Wire Wire Line
	5550 3500 5550 4250
Wire Wire Line
	4950 3650 4950 4250
Wire Wire Line
	4650 3725 4650 4250
Wire Wire Line
	3525 3200 3525 4250
Wire Wire Line
	3425 3275 3425 4250
Wire Wire Line
	3325 3350 3325 4250
Wire Wire Line
	3225 3425 3225 4250
Wire Wire Line
	3125 3500 3125 4250
Wire Wire Line
	3025 3575 3025 4250
Wire Wire Line
	2925 3650 2925 4250
Wire Wire Line
	2825 3725 2825 4250
Wire Wire Line
	3750 5600 3750 6475
Wire Wire Line
	3850 5550 3850 6475
Wire Wire Line
	3950 5500 3950 6475
Wire Wire Line
	4050 5450 4050 6475
Wire Wire Line
	4150 5400 4150 6475
Wire Wire Line
	4250 5350 4250 6475
Wire Wire Line
	4350 5300 4350 6475
$Comp
L Memory_EEPROM:28C256 U4
U 1 1 606B59F6
P 5475 2325
F 0 "U4" V 5825 1325 50  0000 L CNN
F 1 "28C256" V 5450 2175 50  0000 L CNN
F 2 "" H 5475 2325 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 5475 2325 50  0001 C CNN
	1    5475 2325
	0    1    1    0   
$EndComp
Text HLabel 1525 900  1    50   Input ~ 0
A0
Text HLabel 1625 900  1    50   Input ~ 0
A1
Text HLabel 1725 900  1    50   Input ~ 0
A2
Text HLabel 1825 900  1    50   Input ~ 0
A3
Text HLabel 1925 900  1    50   Input ~ 0
A4
Text HLabel 2025 900  1    50   Input ~ 0
A5
Text HLabel 2125 900  1    50   Input ~ 0
A6
Text HLabel 2225 900  1    50   Input ~ 0
A7
Text HLabel 2325 900  1    50   Input ~ 0
A8
Text HLabel 2425 900  1    50   Input ~ 0
A9
Text HLabel 2525 900  1    50   Input ~ 0
A10
Text HLabel 2625 900  1    50   Input ~ 0
A11
Text HLabel 2725 900  1    50   Input ~ 0
A12
Text HLabel 2825 900  1    50   Input ~ 0
A13
Text HLabel 2925 900  1    50   Input ~ 0
A14
Text HLabel 3025 900  1    50   Input ~ 0
A15
Wire Wire Line
	1525 900  1525 1750
Wire Wire Line
	1625 900  1625 1700
Wire Wire Line
	1725 900  1725 1650
Wire Wire Line
	1825 900  1825 1600
Wire Wire Line
	1925 900  1925 1550
Wire Wire Line
	2025 900  2025 1500
Wire Wire Line
	2125 900  2125 1450
Wire Wire Line
	2925 900  2925 1050
Wire Wire Line
	3025 900  3025 1000
Wire Wire Line
	3025 1000 3200 1000
Wire Wire Line
	3200 1000 3200 1850
Wire Wire Line
	2925 1050 4975 1050
Wire Wire Line
	4975 1050 4975 1925
Connection ~ 2925 1050
Wire Wire Line
	2925 1050 2925 1850
Wire Wire Line
	2225 900  2225 1400
Wire Wire Line
	2325 900  2325 1350
Wire Wire Line
	2425 900  2425 1300
Wire Wire Line
	2525 900  2525 1250
Wire Wire Line
	2625 900  2625 1200
Wire Wire Line
	2725 900  2725 1150
Wire Wire Line
	2825 900  2825 1100
Wire Wire Line
	2825 1100 5075 1100
Wire Wire Line
	5075 1100 5075 1925
Connection ~ 2825 1100
Wire Wire Line
	2825 1100 2825 1850
Wire Wire Line
	2725 1150 5175 1150
Wire Wire Line
	5175 1150 5175 1925
Connection ~ 2725 1150
Wire Wire Line
	2725 1150 2725 1850
Wire Wire Line
	2625 1200 5275 1200
Wire Wire Line
	5275 1200 5275 1925
Connection ~ 2625 1200
Wire Wire Line
	2625 1200 2625 1850
Wire Wire Line
	2525 1250 5375 1250
Wire Wire Line
	5375 1250 5375 1925
Connection ~ 2525 1250
Wire Wire Line
	2525 1250 2525 1850
Wire Wire Line
	2425 1300 5475 1300
Wire Wire Line
	5475 1300 5475 1925
Connection ~ 2425 1300
Wire Wire Line
	2425 1300 2425 1850
Wire Wire Line
	2325 1350 5575 1350
Wire Wire Line
	5575 1350 5575 1925
Connection ~ 2325 1350
Wire Wire Line
	2325 1350 2325 1850
Wire Wire Line
	2225 1400 5675 1400
Wire Wire Line
	5675 1400 5675 1925
Connection ~ 2225 1400
Wire Wire Line
	2225 1400 2225 1850
Wire Wire Line
	2125 1450 5775 1450
Wire Wire Line
	5775 1450 5775 1925
Connection ~ 2125 1450
Wire Wire Line
	2125 1450 2125 1850
Wire Wire Line
	2025 1500 5875 1500
Wire Wire Line
	5875 1500 5875 1925
Connection ~ 2025 1500
Wire Wire Line
	2025 1500 2025 1850
Wire Wire Line
	1925 1550 5975 1550
Wire Wire Line
	5975 1550 5975 1925
Connection ~ 1925 1550
Wire Wire Line
	1925 1550 1925 1850
Wire Wire Line
	1825 1600 6075 1600
Wire Wire Line
	6075 1600 6075 1925
Connection ~ 1825 1600
Wire Wire Line
	1825 1600 1825 1850
Wire Wire Line
	1725 1650 6175 1650
Wire Wire Line
	6175 1650 6175 1925
Connection ~ 1725 1650
Wire Wire Line
	1725 1650 1725 1850
Wire Wire Line
	1625 1700 6275 1700
Wire Wire Line
	6275 1700 6275 1925
Connection ~ 1625 1700
Wire Wire Line
	1625 1700 1625 1850
Wire Wire Line
	1525 1750 6375 1750
Wire Wire Line
	6375 1750 6375 1925
Connection ~ 1525 1750
Wire Wire Line
	1525 1750 1525 1850
$Comp
L power:GND #PWR0102
U 1 1 6081049F
P 4100 2325
F 0 "#PWR0102" H 4100 2075 50  0001 C CNN
F 1 "GND" H 4105 2152 50  0000 C CNN
F 2 "" H 4100 2325 50  0001 C CNN
F 3 "" H 4100 2325 50  0001 C CNN
	1    4100 2325
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 60810E8E
P 4350 850
F 0 "#PWR0103" H 4350 700 50  0001 C CNN
F 1 "VCC" H 4365 1023 50  0000 C CNN
F 2 "" H 4350 850 50  0001 C CNN
F 3 "" H 4350 850 50  0001 C CNN
	1    4350 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4775 1925 4775 1875
Wire Wire Line
	4775 1875 4350 1875
Wire Wire Line
	3300 1850 3300 1800
Wire Wire Line
	3025 1850 3025 1800
Wire Wire Line
	3025 1800 3300 1800
Wire Wire Line
	4350 850  4350 1875
$Comp
L power:GND #PWR0104
U 1 1 608E68AE
P 6250 4750
F 0 "#PWR0104" H 6250 4500 50  0001 C CNN
F 1 "GND" H 6255 4577 50  0000 C CNN
F 2 "" H 6250 4750 50  0001 C CNN
F 3 "" H 6250 4750 50  0001 C CNN
	1    6250 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 608F4888
P 8275 4750
F 0 "#PWR0105" H 8275 4500 50  0001 C CNN
F 1 "GND" H 8280 4577 50  0000 C CNN
F 2 "" H 8275 4750 50  0001 C CNN
F 3 "" H 8275 4750 50  0001 C CNN
	1    8275 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3525 1850 3525 950 
$Comp
L 74xx:74LS157 U6
U 1 1 6091C4A7
P 7975 2325
F 0 "U6" V 7700 3175 50  0000 R CNN
F 1 "74LS157" V 8000 2475 50  0000 R CNN
F 2 "" H 7975 2325 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 7975 2325 50  0001 C CNN
	1    7975 2325
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7875 5250 7875 5650
Text HLabel 10925 5650 2    50   Input ~ 0
PROG
$Comp
L Device:R_Small R2
U 1 1 609DB4E4
P 8975 3025
F 0 "R2" V 9050 2975 50  0000 L CNN
F 1 "10K Ω" V 8900 2925 50  0000 L CNN
F 2 "" H 8975 3025 50  0001 C CNN
F 3 "~" H 8975 3025 50  0001 C CNN
	1    8975 3025
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 609DCC8C
P 9500 3275
F 0 "SW2" H 9625 3400 50  0000 C CNN
F 1 "SW_Push" H 9500 3200 50  0000 C CNN
F 2 "" H 9500 3475 50  0001 C CNN
F 3 "~" H 9500 3475 50  0001 C CNN
	1    9500 3275
	1    0    0    -1  
$EndComp
Wire Wire Line
	8975 3125 8975 3275
$Comp
L power:GND #PWR0106
U 1 1 60A080BD
P 9150 2325
F 0 "#PWR0106" H 9150 2075 50  0001 C CNN
F 1 "GND" H 9155 2152 50  0000 C CNN
F 2 "" H 9150 2325 50  0001 C CNN
F 3 "" H 9150 2325 50  0001 C CNN
	1    9150 2325
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 60A087AA
P 9850 3275
F 0 "#PWR0107" H 9850 3125 50  0001 C CNN
F 1 "VCC" H 9865 3448 50  0000 C CNN
F 2 "" H 9850 3275 50  0001 C CNN
F 3 "" H 9850 3275 50  0001 C CNN
	1    9850 3275
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3275 9850 3275
$Comp
L 74xx:74LS00 U7
U 1 1 60A34B20
P 9900 3875
F 0 "U7" H 10000 3600 50  0000 R CNN
F 1 "74LS00" H 10000 3675 50  0000 R CNN
F 2 "" H 9900 3875 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9900 3875 50  0001 C CNN
	1    9900 3875
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS00 U7
U 4 1 60A61832
P 7975 750
F 0 "U7" H 7950 1025 50  0000 R CNN
F 1 "74LS00" H 8075 950 50  0000 R CNN
F 2 "" H 7975 750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7975 750 50  0001 C CNN
	4    7975 750 
	-1   0    0    1   
$EndComp
$Comp
L Device:C C1
U 1 1 60AC7A75
P 10400 3975
F 0 "C1" V 10325 4075 50  0000 C CNN
F 1 "0.01 µF" V 10550 3975 50  0000 C CNN
F 2 "" H 10438 3825 50  0001 C CNN
F 3 "~" H 10400 3975 50  0001 C CNN
	1    10400 3975
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS00 U7
U 2 1 60A3B14B
P 9300 3875
F 0 "U7" H 9400 3600 50  0000 R CNN
F 1 "74LS00" H 9400 3675 50  0000 R CNN
F 2 "" H 9300 3875 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9300 3875 50  0001 C CNN
	2    9300 3875
	-1   0    0    1   
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 60ACD153
P 10750 3975
F 0 "D1" H 10875 4075 50  0000 C CNN
F 1 "BAT43" H 10750 3850 50  0000 C CNN
F 2 "" H 10750 3975 50  0001 C CNN
F 3 "~" H 10750 3975 50  0001 C CNN
	1    10750 3975
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 60ACDD52
P 10200 4375
F 0 "R1" V 10275 4325 50  0000 L CNN
F 1 "1K Ω" V 10125 4275 50  0000 L CNN
F 2 "" H 10200 4375 50  0001 C CNN
F 3 "~" H 10200 4375 50  0001 C CNN
	1    10200 4375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 60ACF243
P 10200 4475
F 0 "#PWR0108" H 10200 4225 50  0001 C CNN
F 1 "GND" H 10205 4302 50  0000 C CNN
F 2 "" H 10200 4475 50  0001 C CNN
F 3 "" H 10200 4475 50  0001 C CNN
	1    10200 4475
	1    0    0    -1  
$EndComp
Text HLabel 10950 3975 2    50   Input ~ 0
CLK
Wire Wire Line
	10200 3975 10250 3975
Wire Wire Line
	10550 3975 10600 3975
Text HLabel 10950 3775 2    50   Input ~ 0
RMi
Wire Wire Line
	4675 1925 4675 1800
Wire Wire Line
	3750 2325 3825 2325
Wire Wire Line
	3825 2325 3825 1875
Wire Wire Line
	3825 1875 4350 1875
Connection ~ 4350 1875
Wire Wire Line
	4100 2325 4375 2325
Wire Wire Line
	3425 1850 3425 1800
Wire Wire Line
	5675 2725 5675 3200
Connection ~ 5675 3200
Wire Wire Line
	5675 3200 3525 3200
Wire Wire Line
	5775 2725 5775 3275
Connection ~ 5775 3275
Wire Wire Line
	5775 3275 3425 3275
Wire Wire Line
	5875 2725 5875 3350
Connection ~ 5875 3350
Wire Wire Line
	5875 3350 3325 3350
Wire Wire Line
	5975 2725 5975 3425
Connection ~ 5975 3425
Wire Wire Line
	5975 3425 3225 3425
Wire Wire Line
	6075 2725 6075 3500
Wire Wire Line
	6075 3500 5550 3500
Connection ~ 5550 3500
Wire Wire Line
	6175 2725 6175 3575
Wire Wire Line
	6275 2725 6275 3650
Wire Wire Line
	6275 3650 4950 3650
Connection ~ 4950 3650
Wire Wire Line
	6375 2725 6375 3725
Wire Wire Line
	6375 3725 4650 3725
Connection ~ 4650 3725
$Comp
L power:VCC #PWR0109
U 1 1 60C15423
P 4350 4750
F 0 "#PWR0109" H 4350 4600 50  0001 C CNN
F 1 "VCC" H 4365 4923 50  0000 C CNN
F 2 "" H 4350 4750 50  0001 C CNN
F 3 "" H 4350 4750 50  0001 C CNN
	1    4350 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 7075 3750 7150
Wire Wire Line
	3750 7150 3850 7150
Wire Wire Line
	4450 7150 4450 7075
Wire Wire Line
	4350 7075 4350 7150
Connection ~ 4350 7150
Wire Wire Line
	4350 7150 4450 7150
Wire Wire Line
	4250 7075 4250 7150
Connection ~ 4250 7150
Wire Wire Line
	4250 7150 4350 7150
Wire Wire Line
	4150 7075 4150 7150
Connection ~ 4150 7150
Wire Wire Line
	4150 7150 4250 7150
Wire Wire Line
	4050 7075 4050 7150
Connection ~ 4050 7150
Wire Wire Line
	4050 7150 4150 7150
Wire Wire Line
	3950 7075 3950 7150
Connection ~ 3950 7150
Wire Wire Line
	3950 7150 4050 7150
Wire Wire Line
	3850 7075 3850 7150
Connection ~ 3850 7150
Wire Wire Line
	3850 7150 3950 7150
$Comp
L power:GND #PWR0110
U 1 1 60CD7BF0
P 4450 7250
F 0 "#PWR0110" H 4450 7000 50  0001 C CNN
F 1 "GND" H 4455 7077 50  0000 C CNN
F 2 "" H 4450 7250 50  0001 C CNN
F 3 "" H 4450 7250 50  0001 C CNN
	1    4450 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 7150 4450 7250
Connection ~ 4450 7150
NoConn ~ 7975 1825
NoConn ~ 7675 1825
NoConn ~ 7375 1825
$Comp
L power:GND #PWR0111
U 1 1 60D9C95B
P 8075 2950
F 0 "#PWR0111" H 8075 2700 50  0001 C CNN
F 1 "GND" H 8080 2777 50  0000 C CNN
F 2 "" H 8075 2950 50  0001 C CNN
F 3 "" H 8075 2950 50  0001 C CNN
	1    8075 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8075 2950 8075 2875
Wire Wire Line
	7375 2875 7475 2875
Wire Wire Line
	8975 2325 8975 2825
Wire Wire Line
	8675 2825 8975 2825
Connection ~ 8975 2825
Wire Wire Line
	8975 2825 8975 2925
Wire Wire Line
	8975 2325 9150 2325
Connection ~ 8975 2325
Wire Wire Line
	7375 2875 7375 2825
Wire Wire Line
	7475 2825 7475 2875
Connection ~ 7475 2875
Wire Wire Line
	7475 2875 7675 2875
Wire Wire Line
	7675 2825 7675 2875
Connection ~ 7675 2875
Wire Wire Line
	7675 2875 7775 2875
Wire Wire Line
	7775 2825 7775 2875
Connection ~ 7775 2875
Wire Wire Line
	7775 2875 7975 2875
Wire Wire Line
	7975 2825 7975 2875
Connection ~ 7975 2875
Wire Wire Line
	7975 2875 8075 2875
Wire Wire Line
	8075 2825 8075 2875
Connection ~ 8075 2875
$Comp
L power:VCC #PWR0112
U 1 1 60F054EC
P 7075 2200
F 0 "#PWR0112" H 7075 2050 50  0001 C CNN
F 1 "VCC" H 7090 2373 50  0000 C CNN
F 2 "" H 7075 2200 50  0001 C CNN
F 3 "" H 7075 2200 50  0001 C CNN
	1    7075 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3825 4250 3825 3800
Text HLabel 10950 5200 2    50   Input ~ 0
~RMo
$Comp
L power:GND #PWR0113
U 1 1 60F70DD4
P 4125 4750
F 0 "#PWR0113" H 4125 4500 50  0001 C CNN
F 1 "GND" H 4130 4577 50  0000 C CNN
F 2 "" H 4125 4750 50  0001 C CNN
F 3 "" H 4125 4750 50  0001 C CNN
	1    4125 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 60F871F3
P 1100 2550
F 0 "#PWR0114" H 1100 2300 50  0001 C CNN
F 1 "GND" H 1105 2377 50  0000 C CNN
F 2 "" H 1100 2550 50  0001 C CNN
F 3 "" H 1100 2550 50  0001 C CNN
	1    1100 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2325 1100 2325
Wire Wire Line
	1100 2325 1100 2550
Wire Wire Line
	3725 4175 3725 4250
Connection ~ 5250 3575
Wire Wire Line
	6175 3575 5250 3575
Wire Wire Line
	5250 3575 3025 3575
Wire Wire Line
	5250 3575 5250 4250
Wire Wire Line
	7875 5650 5850 5650
Wire Wire Line
	5850 5650 5850 5250
Connection ~ 7875 5650
Wire Wire Line
	2525 4750 2525 4175
Wire Wire Line
	2525 4175 3725 4175
Wire Wire Line
	5950 5250 5950 5400
Wire Wire Line
	5950 5400 7975 5400
Wire Wire Line
	7975 5400 7975 5250
$Comp
L 74xx:74LS32 U8
U 1 1 60819261
P 7150 1475
F 0 "U8" H 7075 1750 50  0000 C CNN
F 1 "74LS32" H 7150 1675 50  0000 C CNN
F 2 "" H 7150 1475 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7150 1475 50  0001 C CNN
	1    7150 1475
	-1   0    0    1   
$EndComp
Connection ~ 3200 1000
Wire Wire Line
	4575 1000 4575 1925
Text Notes 6475 1275 0    39   ~ 0
NOTE: This OR gate prevents the ROM & RAM \nfrom outputing to the bus if the 74LS157s are\nactive. The 74LS157s are active is RMi or the \nmanual memory write buttons are high. 
Wire Wire Line
	7875 5650 8750 5650
Wire Wire Line
	8575 2825 8575 3025
Wire Wire Line
	8575 3025 8750 3025
Connection ~ 8750 5650
Wire Wire Line
	7575 3200 5675 3200
Wire Wire Line
	3425 1800 4675 1800
Wire Wire Line
	3200 1000 4575 1000
Wire Wire Line
	6575 2325 7075 2325
Wire Wire Line
	7075 2325 7075 2200
Connection ~ 7075 2325
Wire Wire Line
	4675 1800 6850 1800
Connection ~ 4675 1800
Wire Wire Line
	8750 5650 10925 5650
Wire Wire Line
	10900 3975 10950 3975
Wire Wire Line
	10550 3775 10950 3775
$Comp
L 74xx:74LS00 U7
U 3 1 60BCC7C3
P 8275 5400
F 0 "U7" H 8275 5083 50  0000 C CNN
F 1 "74LS00" H 8275 5174 50  0000 C CNN
F 2 "" H 8275 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8275 5400 50  0001 C CNN
	3    8275 5400
	-1   0    0    1   
$EndComp
Connection ~ 7975 5400
Wire Wire Line
	6850 1800 6850 3125
Wire Wire Line
	6850 3125 7850 3125
Wire Wire Line
	7850 3125 7850 4250
Wire Wire Line
	7850 4250 8575 4250
Wire Wire Line
	8575 4250 8575 5300
Connection ~ 6850 1800
Wire Wire Line
	8575 5300 8575 5500
Connection ~ 8575 5300
Wire Wire Line
	3025 1800 1100 1800
Wire Wire Line
	1100 1800 1100 2325
Connection ~ 3025 1800
Connection ~ 1100 2325
Wire Wire Line
	9600 3875 9600 3775
Wire Wire Line
	9600 3875 9600 3975
Connection ~ 9600 3875
Wire Wire Line
	10550 3775 10200 3775
Connection ~ 10550 3775
Wire Wire Line
	10200 3975 10200 4275
Connection ~ 10200 3975
Wire Wire Line
	9000 3575 9000 3875
Wire Wire Line
	10950 5200 8875 5200
Wire Wire Line
	8875 5200 8875 3800
Wire Wire Line
	3825 3800 8875 3800
Wire Wire Line
	8975 3275 9300 3275
Wire Wire Line
	10550 1575 10550 3775
Wire Wire Line
	2825 6300 4650 6300
Wire Wire Line
	2925 6225 4950 6225
Wire Wire Line
	3025 6150 5250 6150
Wire Wire Line
	3125 6075 5550 6075
Wire Wire Line
	3225 6000 6675 6000
Wire Wire Line
	3325 5925 6975 5925
Wire Wire Line
	3525 5775 7575 5775
Wire Wire Line
	7675 5600 7675 5250
Wire Wire Line
	3750 5600 7675 5600
Wire Wire Line
	7375 5550 7375 5250
Wire Wire Line
	3850 5550 7375 5550
Wire Wire Line
	7075 5500 7075 5250
Wire Wire Line
	3950 5500 7075 5500
Wire Wire Line
	6775 5450 6775 5250
Wire Wire Line
	4050 5450 6775 5450
Wire Wire Line
	5050 5300 5050 5250
Wire Wire Line
	4350 5300 5050 5300
Wire Wire Line
	5350 5350 5350 5250
Wire Wire Line
	4250 5350 5350 5350
Wire Wire Line
	5650 5400 5650 5250
Wire Wire Line
	4150 5400 5650 5400
Wire Wire Line
	4450 6475 4750 6475
Wire Wire Line
	4750 6475 4750 5250
Wire Wire Line
	7575 5250 7575 5775
Connection ~ 7575 5775
Wire Wire Line
	7575 5775 8150 5775
Wire Wire Line
	7275 5250 7275 5850
Wire Wire Line
	3425 5850 7275 5850
Connection ~ 7275 5850
Wire Wire Line
	7275 5850 8150 5850
Wire Wire Line
	6975 5250 6975 5925
Connection ~ 6975 5925
Wire Wire Line
	6975 5925 8150 5925
Wire Wire Line
	6675 5250 6675 6000
Connection ~ 6675 6000
Wire Wire Line
	6675 6000 8150 6000
Wire Wire Line
	5550 5250 5550 6075
Connection ~ 5550 6075
Wire Wire Line
	5550 6075 8150 6075
Wire Wire Line
	5250 5250 5250 6150
Connection ~ 5250 6150
Wire Wire Line
	5250 6150 8150 6150
Wire Wire Line
	4950 5250 4950 6225
Connection ~ 4950 6225
Wire Wire Line
	4950 6225 8150 6225
Wire Wire Line
	4650 5250 4650 6300
Connection ~ 4650 6300
Wire Wire Line
	4650 6300 8150 6300
Wire Wire Line
	2825 3725 1575 3725
Wire Wire Line
	1575 3725 1575 4075
Wire Wire Line
	2925 3650 1475 3650
Wire Wire Line
	1475 3650 1475 4075
Wire Wire Line
	3025 3575 1375 3575
Wire Wire Line
	1375 3575 1375 4075
Wire Wire Line
	3125 3500 1275 3500
Wire Wire Line
	1275 3500 1275 4075
Wire Wire Line
	3225 3425 1175 3425
Wire Wire Line
	1175 3425 1175 4075
Wire Wire Line
	3325 3350 1075 3350
Wire Wire Line
	1075 3350 1075 4075
Wire Wire Line
	3425 3275 975  3275
Wire Wire Line
	975  3275 975  4075
Wire Wire Line
	3525 3200 875  3200
Wire Wire Line
	875  3200 875  4075
Wire Wire Line
	8975 3275 8375 3275
Wire Wire Line
	8375 3275 8375 2825
Connection ~ 8975 3275
Wire Wire Line
	8275 3575 8275 2825
Wire Wire Line
	8275 3575 9000 3575
$Comp
L power:VCC #PWR02
U 1 1 60A653A0
P 6375 4750
F 0 "#PWR02" H 6375 4600 50  0001 C CNN
F 1 "VCC" H 6390 4923 50  0000 C CNN
F 2 "" H 6375 4750 50  0001 C CNN
F 3 "" H 6375 4750 50  0001 C CNN
	1    6375 4750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 60A65B45
P 2525 4175
F 0 "#PWR01" H 2525 4025 50  0001 C CNN
F 1 "VCC" H 2540 4348 50  0000 C CNN
F 2 "" H 2525 4175 50  0001 C CNN
F 3 "" H 2525 4175 50  0001 C CNN
	1    2525 4175
	1    0    0    -1  
$EndComp
Connection ~ 2525 4175
Wire Wire Line
	6850 1475 6850 1800
Wire Wire Line
	8750 3025 8750 5650
Wire Wire Line
	8275 850  8275 1375
Wire Wire Line
	8275 850  8275 650 
Connection ~ 8275 850 
Wire Wire Line
	7675 750  6275 750 
Wire Wire Line
	6275 750  6275 950 
Wire Wire Line
	6275 950  3525 950 
Wire Wire Line
	7450 1575 10550 1575
Wire Wire Line
	7450 1375 8275 1375
Connection ~ 8275 1375
Wire Wire Line
	8275 1375 8275 1825
$Comp
L ram-rom-upgrade-symbols:74LS257 U?
U 1 1 607C5143
P 7275 4750
F 0 "U?" V 7525 3925 50  0000 R CNN
F 1 "74LS257" V 7275 4900 50  0000 R CNN
F 2 "" H 7275 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS257" H 7275 4750 50  0001 C CNN
	1    7275 4750
	0    -1   -1   0   
$EndComp
$Comp
L ram-rom-upgrade-symbols:74LS257 U?
U 1 1 60814B6F
P 5250 4750
F 0 "U?" V 5500 3925 50  0000 R CNN
F 1 "74LS257" V 5250 4900 50  0000 R CNN
F 2 "" H 5250 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS257" H 5250 4750 50  0001 C CNN
	1    5250 4750
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
