EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Memory Map Controller"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2600 1050 1    50   Input ~ 0
A0
Text HLabel 2525 1050 1    50   Input ~ 0
A1
Text HLabel 2450 1050 1    50   Input ~ 0
A2
Text HLabel 2375 1050 1    50   Input ~ 0
A3
Text HLabel 2300 1050 1    50   Input ~ 0
A4
Text HLabel 2225 1050 1    50   Input ~ 0
A5
Text HLabel 2150 1050 1    50   Input ~ 0
A6
Text HLabel 2075 1050 1    50   Input ~ 0
A7
Text HLabel 2000 1050 1    50   Input ~ 0
A8
Text HLabel 1925 1050 1    50   Input ~ 0
A9
Text HLabel 1850 1050 1    50   Input ~ 0
A10
Text HLabel 1775 1050 1    50   Input ~ 0
A11
Text HLabel 1700 1050 1    50   Input ~ 0
A12
Text HLabel 1625 1050 1    50   Input ~ 0
A13
Text HLabel 1550 1050 1    50   Input ~ 0
A14
Text HLabel 1475 1050 1    50   Input ~ 0
A15
Text HLabel 2600 7150 3    50   Output ~ 0
A0
Text HLabel 2525 7150 3    50   Output ~ 0
A1
Text HLabel 2450 7150 3    50   Output ~ 0
A2
Text HLabel 2375 7150 3    50   Output ~ 0
A3
Text HLabel 2300 7150 3    50   Output ~ 0
A4
Text HLabel 2225 7150 3    50   Output ~ 0
A5
Text HLabel 2150 7150 3    50   Output ~ 0
A6
Text HLabel 2075 7150 3    50   Output ~ 0
A7
Text HLabel 2000 7150 3    50   Output ~ 0
A8
Text HLabel 1925 7150 3    50   Output ~ 0
A9
Text HLabel 1850 7150 3    50   Output ~ 0
A10
Text HLabel 1775 7150 3    50   Output ~ 0
A11
Text HLabel 1700 7150 3    50   Output ~ 0
A12
Text HLabel 1625 7150 3    50   Output ~ 0
A13
Text HLabel 1550 7150 3    50   Output ~ 0
A14
Text HLabel 1475 7150 3    50   Output ~ 0
A15
Wire Wire Line
	2600 1050 2600 7150
Wire Wire Line
	2525 7150 2525 1050
Wire Wire Line
	2450 1050 2450 7150
Wire Wire Line
	2375 7150 2375 1050
Wire Wire Line
	2300 1050 2300 2700
Wire Wire Line
	2225 7150 2225 2800
Wire Wire Line
	2150 1050 2150 2900
Wire Wire Line
	1775 1050 1775 2000
Wire Wire Line
	1700 7150 1700 1900
Wire Wire Line
	1625 1050 1625 1800
Wire Wire Line
	1550 7150 1550 1700
Text HLabel 6250 1325 2    50   Output ~ 0
RAMe
$Comp
L 74xx:74LS21 U1
U 1 1 610A2B3A
P 3050 1850
F 0 "U1" H 3275 1750 50  0000 C CNN
F 1 "74LS21" H 3325 1975 50  0000 C CNN
F 2 "" H 3050 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 3050 1850 50  0001 C CNN
	1    3050 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U2
U 3 1 610A4EC8
P 3950 1650
F 0 "U2" H 4050 1525 50  0000 C CNN
F 1 "74LS04" H 4100 1775 50  0000 C CNN
F 2 "" H 3950 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3950 1650 50  0001 C CNN
	3    3950 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1700 1550 1700
Connection ~ 1550 1700
Wire Wire Line
	1550 1700 1550 1050
Wire Wire Line
	2750 1800 1625 1800
Connection ~ 1625 1800
Wire Wire Line
	1625 1800 1625 7150
Wire Wire Line
	2750 1900 1700 1900
Connection ~ 1700 1900
Wire Wire Line
	1700 1900 1700 1050
Wire Wire Line
	2750 2000 1775 2000
Connection ~ 1775 2000
Wire Wire Line
	1775 2000 1775 7150
Text HLabel 6250 1750 2    50   Output ~ 0
MMAPe
Text HLabel 6250 900  2    50   Output ~ 0
~ROMe
$Comp
L common-symbols:74HCT238 U5
U 1 1 610C0683
P 5650 3000
F 0 "U5" H 5850 3575 50  0000 C CNN
F 1 "74HCT238" V 5650 2975 50  0000 C CNN
F 2 "" H 5500 2825 50  0001 C CNN
F 3 "" H 5500 2825 50  0001 C CNN
	1    5650 3000
	1    0    0    -1  
$EndComp
$Comp
L common-symbols:74HCT238 U6
U 1 1 610C819E
P 4950 4550
F 0 "U6" H 5150 5125 50  0000 C CNN
F 1 "74LS32" V 4950 4525 50  0000 C CNN
F 2 "" H 4800 4375 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4800 4375 50  0001 C CNN
	1    4950 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4800 1850 4800
Connection ~ 1850 4800
Wire Wire Line
	4600 4450 1925 4450
Connection ~ 1925 4450
Wire Wire Line
	1925 4450 1925 7150
Wire Wire Line
	4600 4350 2000 4350
Connection ~ 2000 4350
Wire Wire Line
	2000 4350 2000 7150
Wire Wire Line
	4600 4250 2075 4250
Connection ~ 2075 4250
Wire Wire Line
	2075 4250 2075 7150
Wire Wire Line
	5300 4200 5300 3450
Wire Wire Line
	5300 2900 2150 2900
Connection ~ 2150 2900
Wire Wire Line
	2150 2900 2150 7150
Wire Wire Line
	5300 2800 2225 2800
Connection ~ 2225 2800
Wire Wire Line
	2225 2800 2225 1050
Wire Wire Line
	5300 2700 2300 2700
Connection ~ 2300 2700
Wire Wire Line
	2300 2700 2300 7150
$Comp
L 74xx:74LS04 U2
U 2 1 610D71D6
P 3700 3250
F 0 "U2" H 3800 3125 50  0000 C CNN
F 1 "74LS04" H 3850 3375 50  0000 C CNN
F 2 "" H 3700 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3700 3250 50  0001 C CNN
	2    3700 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3250 3400 2000
Wire Wire Line
	4000 3250 4425 3250
Wire Wire Line
	4425 3250 5300 3250
Connection ~ 4425 3250
Wire Wire Line
	4425 3250 4425 3350
Wire Wire Line
	4425 3350 5300 3350
Wire Wire Line
	4425 3350 4425 4900
Wire Wire Line
	4425 4900 4600 4900
Connection ~ 4425 3350
Wire Wire Line
	3400 3250 3400 5000
Wire Wire Line
	3400 5000 4600 5000
Connection ~ 3400 3250
Text HLabel 6225 2650 2    50   Output ~ 0
MMAP_0
Text HLabel 6225 2750 2    50   Output ~ 0
MMAP_1
Text HLabel 6225 2850 2    50   Output ~ 0
MMAP_2
Text HLabel 6225 2950 2    50   Output ~ 0
MMAP_3
Text HLabel 6225 3050 2    50   Output ~ 0
MMAP_4
Text HLabel 6225 3150 2    50   Output ~ 0
MMAP_5
Text HLabel 6225 3250 2    50   Output ~ 0
MMAP_6
Text HLabel 6225 3350 2    50   Output ~ 0
MMAP_7
Wire Wire Line
	6000 2650 6225 2650
Wire Wire Line
	6000 2750 6225 2750
Wire Wire Line
	6000 2850 6225 2850
Wire Wire Line
	6000 2950 6225 2950
Wire Wire Line
	6000 3050 6225 3050
Wire Wire Line
	6000 3150 6225 3150
Wire Wire Line
	6000 3250 6225 3250
Wire Wire Line
	6000 3350 6225 3350
Text HLabel 6225 4300 2    50   Output ~ 0
MMAP_8
Wire Wire Line
	5300 4300 6225 4300
Text HLabel 6225 4400 2    50   Output ~ 0
MMAP_9
Text HLabel 6225 4500 2    50   Output ~ 0
MMAP_10
Text HLabel 6225 4600 2    50   Output ~ 0
MMAP_11
Text HLabel 6225 4700 2    50   Output ~ 0
MMAP_12
Text HLabel 6225 4800 2    50   Output ~ 0
MMAP_13
Text HLabel 6225 4900 2    50   Output ~ 0
MMAP_14
Wire Wire Line
	5300 4400 6225 4400
Wire Wire Line
	5300 4500 6225 4500
Wire Wire Line
	5300 4600 6225 4600
Wire Wire Line
	5300 4700 6225 4700
Wire Wire Line
	6225 4800 5300 4800
Wire Wire Line
	6225 4900 5300 4900
$Comp
L 74xx:74LS08 U3
U 2 1 6124CEFE
P 4675 1750
F 0 "U3" H 4925 1650 50  0000 C CNN
F 1 "74LS08" H 4950 1875 50  0000 C CNN
F 2 "" H 4675 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4675 1750 50  0001 C CNN
	2    4675 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1850 4375 1850
Wire Wire Line
	4250 1650 4375 1650
Wire Wire Line
	4975 1750 5200 1750
Connection ~ 6050 1750
Wire Wire Line
	6050 1750 6250 1750
Wire Wire Line
	6050 2000 6050 1750
Wire Wire Line
	3400 2000 6050 2000
$Comp
L power:VCC #PWR0101
U 1 1 61442B67
P 5650 2375
F 0 "#PWR0101" H 5650 2225 50  0001 C CNN
F 1 "VCC" H 5665 2548 50  0000 C CNN
F 2 "" H 5650 2375 50  0001 C CNN
F 3 "" H 5650 2375 50  0001 C CNN
	1    5650 2375
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 61443128
P 4950 3925
F 0 "#PWR0102" H 4950 3775 50  0001 C CNN
F 1 "VCC" H 4965 4098 50  0000 C CNN
F 2 "" H 4950 3925 50  0001 C CNN
F 3 "" H 4950 3925 50  0001 C CNN
	1    4950 3925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 614450AA
P 5650 3675
F 0 "#PWR0103" H 5650 3425 50  0001 C CNN
F 1 "GND" H 5655 3502 50  0000 C CNN
F 2 "" H 5650 3675 50  0001 C CNN
F 3 "" H 5650 3675 50  0001 C CNN
	1    5650 3675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 6144568F
P 4950 5225
F 0 "#PWR0104" H 4950 4975 50  0001 C CNN
F 1 "GND" H 4955 5052 50  0000 C CNN
F 2 "" H 4950 5225 50  0001 C CNN
F 3 "" H 4950 5225 50  0001 C CNN
	1    4950 5225
	1    0    0    -1  
$EndComp
Wire Wire Line
	2075 1050 2075 4250
Wire Wire Line
	2000 1050 2000 4350
Wire Wire Line
	1925 1050 1925 4450
Wire Wire Line
	1850 1050 1850 4800
Text HLabel 6225 5525 2    50   Output ~ 0
MMAP_15
Wire Notes Line
	6175 2575 6675 2575
Wire Notes Line
	6675 2575 6675 3425
Wire Notes Line
	6675 3425 6175 3425
Wire Notes Line
	6175 3425 6175 2575
Text Notes 6100 2525 0    63   ~ 0
16 Byte Maps
Wire Notes Line
	6675 4225 6675 4975
Wire Notes Line
	6175 4975 6175 4225
Text Notes 6050 4175 0    63   ~ 0
128 Byte Maps
Wire Notes Line
	6675 5450 6675 5600
Wire Notes Line
	6175 5600 6175 5450
Text Notes 6050 5400 0    63   ~ 0
1024 Byte Map
Wire Wire Line
	3650 1650 3550 1650
$Comp
L 74xx:74LS32 U4
U 4 1 60ED1285
P 5900 900
F 0 "U4" H 6075 775 50  0000 C CNN
F 1 "74LS32" H 6150 1025 50  0000 C CNN
F 2 "" H 5900 900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5900 900 50  0001 C CNN
	4    5900 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1750 5200 1000
Wire Wire Line
	5200 1000 5600 1000
Connection ~ 5200 1750
Wire Wire Line
	5200 1750 6050 1750
Wire Wire Line
	6200 900  6250 900 
Wire Notes Line
	6175 4225 6675 4225
Wire Notes Line
	6175 4975 6675 4975
Wire Notes Line
	6175 5450 6675 5450
Wire Notes Line
	6175 5600 6675 5600
Text HLabel 1400 1050 1    50   Input ~ 0
A16
Text HLabel 1400 7150 3    50   Output ~ 0
A15
Wire Wire Line
	1400 1050 1400 1325
Wire Wire Line
	1475 1050 1475 1525
$Comp
L 74xx:74LS32 U4
U 3 1 60FC6A93
P 3150 1425
F 0 "U4" H 3350 1325 50  0000 C CNN
F 1 "74LS32" H 3400 1550 50  0000 C CNN
F 2 "" H 3150 1425 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3150 1425 50  0001 C CNN
	3    3150 1425
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1525 2800 1525
Connection ~ 1475 1525
Wire Wire Line
	1475 1525 1475 7150
Wire Wire Line
	2850 1325 2725 1325
Connection ~ 1400 1325
Wire Wire Line
	1400 1325 1400 7150
$Comp
L 74xx:74LS08 U3
U 3 1 60FD347A
P 3175 1000
F 0 "U3" H 3400 900 50  0000 C CNN
F 1 "74LS08" H 3450 1125 50  0000 C CNN
F 2 "" H 3175 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3175 1000 50  0001 C CNN
	3    3175 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2875 1100 2800 1100
Wire Wire Line
	2800 1100 2800 1525
Connection ~ 2800 1525
Wire Wire Line
	2800 1525 1475 1525
Wire Wire Line
	2875 900  2725 900 
Wire Wire Line
	2725 900  2725 1325
Connection ~ 2725 1325
Wire Wire Line
	2725 1325 1400 1325
$Comp
L 74xx:74LS04 U2
U 4 1 60FDE6A9
P 3850 1000
F 0 "U2" H 3950 875 50  0000 C CNN
F 1 "74LS04" H 4000 1125 50  0000 C CNN
F 2 "" H 3850 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3850 1000 50  0001 C CNN
	4    3850 1000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U3
U 4 1 60FE27D8
P 4575 1325
F 0 "U3" H 4800 1225 50  0000 C CNN
F 1 "74LS08" H 4850 1450 50  0000 C CNN
F 2 "" H 4575 1325 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4575 1325 50  0001 C CNN
	4    4575 1325
	1    0    0    1   
$EndComp
Wire Wire Line
	3450 1425 3550 1425
Wire Wire Line
	3550 1650 3550 1425
Connection ~ 3550 1425
Wire Wire Line
	3550 1425 4275 1425
Wire Wire Line
	3475 1000 3550 1000
Wire Wire Line
	4150 1000 4200 1000
Wire Wire Line
	4200 1000 4200 1225
Wire Wire Line
	4200 1225 4275 1225
Wire Wire Line
	4875 1325 5050 1325
Wire Wire Line
	5050 1325 5050 800 
Wire Wire Line
	5050 800  5600 800 
Connection ~ 5050 1325
Wire Wire Line
	5050 1325 6250 1325
Wire Wire Line
	4000 5525 6225 5525
Wire Wire Line
	1850 4800 1850 5625
Wire Wire Line
	3400 5625 1850 5625
Connection ~ 1850 5625
Wire Wire Line
	1850 5625 1850 7150
Wire Wire Line
	3400 5000 3400 5425
Connection ~ 3400 5000
$Comp
L 74xx:74LS08 U3
U 1 1 611259B0
P 3700 5525
F 0 "U3" H 3700 5850 50  0000 C CNN
F 1 "74LS08" H 3700 5759 50  0000 C CNN
F 2 "" H 3700 5525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3700 5525 50  0001 C CNN
	1    3700 5525
	1    0    0    -1  
$EndComp
$EndSCHEMATC
