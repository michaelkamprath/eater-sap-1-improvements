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
Text HLabel 6250 1125 2    50   Output ~ 0
RAMe
$Comp
L 74xx:74LS21 U?
U 1 1 610A2B3A
P 3050 1850
F 0 "U?" H 3275 1750 50  0000 C CNN
F 1 "74LS21" H 3325 1975 50  0000 C CNN
F 2 "" H 3050 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 3050 1850 50  0001 C CNN
	1    3050 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 1 1 610A4EC8
P 4825 1650
F 0 "U?" H 4925 1525 50  0000 C CNN
F 1 "74LS04" H 4975 1775 50  0000 C CNN
F 2 "" H 4825 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4825 1650 50  0001 C CNN
	1    4825 1650
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
Text HLabel 6250 800  2    50   Output ~ 0
~ROMe
Wire Wire Line
	6175 800  6250 800 
$Comp
L common-symbols:74HCT238 U?
U 1 1 610C0683
P 5650 3000
F 0 "U?" H 5850 3575 50  0000 C CNN
F 1 "74HCT238" V 5650 2975 50  0000 C CNN
F 2 "" H 5500 2825 50  0001 C CNN
F 3 "" H 5500 2825 50  0001 C CNN
	1    5650 3000
	1    0    0    -1  
$EndComp
$Comp
L common-symbols:74HCT238 U?
U 1 1 610C819E
P 4950 4550
F 0 "U?" H 5150 5125 50  0000 C CNN
F 1 "74HCT238" V 4950 4525 50  0000 C CNN
F 2 "" H 4800 4375 50  0001 C CNN
F 3 "" H 4800 4375 50  0001 C CNN
	1    4950 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4800 1850 4800
Connection ~ 1850 4800
Wire Wire Line
	1850 4800 1850 5525
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
L 74xx:74LS04 U?
U 2 1 610D71D6
P 3700 3250
F 0 "U?" H 3800 3125 50  0000 C CNN
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
MMAP_0a
Text HLabel 6225 2750 2    50   Output ~ 0
MMAP_0b
Text HLabel 6225 2850 2    50   Output ~ 0
MMAP_0c
Text HLabel 6225 2950 2    50   Output ~ 0
MMAP_0d
Text HLabel 6225 3050 2    50   Output ~ 0
MMAP_0e
Text HLabel 6225 3150 2    50   Output ~ 0
MMAP_0f
Text HLabel 6225 3250 2    50   Output ~ 0
MMAP_0g
Text HLabel 6225 3350 2    50   Output ~ 0
MMAP_0h
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
MMAP_1
Wire Wire Line
	5300 4300 6225 4300
Text HLabel 6225 4400 2    50   Output ~ 0
MMAP_2
Text HLabel 6225 4500 2    50   Output ~ 0
MMAP_3
Text HLabel 6225 4600 2    50   Output ~ 0
MMAP_4
Text HLabel 6225 4700 2    50   Output ~ 0
MMAP_5
Text HLabel 6225 4800 2    50   Output ~ 0
MMAP_6
Text HLabel 6225 4900 2    50   Output ~ 0
MMAP_7
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
L 74xx:74LS32 U?
U 1 1 6113D1DF
P 5875 800
F 0 "U?" H 6075 700 50  0000 C CNN
F 1 "74LS32" H 6125 925 50  0000 C CNN
F 2 "" H 5875 800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5875 800 50  0001 C CNN
	1    5875 800 
	1    0    0    -1  
$EndComp
Text HLabel 1400 1050 1    50   Input ~ 0
A16
Text HLabel 1400 7150 3    50   Output ~ 0
A16
Wire Wire Line
	1400 7150 1400 1125
Wire Wire Line
	1475 1050 1475 1325
Wire Wire Line
	2900 1125 2750 1125
Connection ~ 1400 1125
Wire Wire Line
	1400 1125 1400 1050
Wire Wire Line
	2900 1325 2825 1325
Connection ~ 1475 1325
Wire Wire Line
	1475 1325 1475 7150
$Comp
L 74xx:74LS32 U?
U 2 1 61221DD6
P 3225 700
F 0 "U?" H 3425 600 50  0000 C CNN
F 1 "74LS32" H 3475 825 50  0000 C CNN
F 2 "" H 3225 700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3225 700 50  0001 C CNN
	2    3225 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3525 700  4525 700 
Wire Wire Line
	2825 1325 2825 800 
Wire Wire Line
	2825 800  2925 800 
Connection ~ 2825 1325
Wire Wire Line
	2825 1325 1475 1325
Wire Wire Line
	2925 600  2750 600 
Wire Wire Line
	2750 600  2750 1125
Connection ~ 2750 1125
Wire Wire Line
	2750 1125 1400 1125
$Comp
L 74xx:74LS08 U?
U 1 1 6124CEFE
P 5550 1750
F 0 "U?" H 5800 1650 50  0000 C CNN
F 1 "74LS08" H 5825 1875 50  0000 C CNN
F 2 "" H 5550 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5550 1750 50  0001 C CNN
	1    5550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1850 5250 1850
Wire Wire Line
	5125 1650 5250 1650
Wire Wire Line
	4525 1650 4525 1025
Connection ~ 4525 700 
Wire Wire Line
	4525 700  5575 700 
Wire Wire Line
	5850 1750 6050 1750
Wire Wire Line
	6050 1750 6050 1425
Wire Wire Line
	6050 1425 5575 1425
Wire Wire Line
	5575 1425 5575 900 
Connection ~ 6050 1750
Wire Wire Line
	6050 1750 6250 1750
Wire Wire Line
	6050 2000 6050 1750
Wire Wire Line
	3400 2000 6050 2000
$Comp
L 74xx:74LS08 U?
U 2 1 61272C32
P 3200 1225
F 0 "U?" H 3200 1550 50  0000 C CNN
F 1 "74LS08" H 3200 1459 50  0000 C CNN
F 2 "" H 3200 1225 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3200 1225 50  0001 C CNN
	2    3200 1225
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 3 1 61274478
P 3875 1225
F 0 "U?" H 3875 1542 50  0000 C CNN
F 1 "74LS04" H 3875 1451 50  0000 C CNN
F 2 "" H 3875 1225 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3875 1225 50  0001 C CNN
	3    3875 1225
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1225 3575 1225
$Comp
L 74xx:74LS08 U?
U 3 1 61279070
P 4950 1125
F 0 "U?" H 4950 1450 50  0000 C CNN
F 1 "74LS08" H 4950 1359 50  0000 C CNN
F 2 "" H 4950 1125 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4950 1125 50  0001 C CNN
	3    4950 1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	4175 1225 4650 1225
Wire Wire Line
	4650 1025 4525 1025
Connection ~ 4525 1025
Wire Wire Line
	4525 1025 4525 700 
Wire Wire Line
	5250 1125 6250 1125
Text Notes 4375 1475 2    35   ~ 0
This logic is used instead of an XOR in order to reduce chips
$Comp
L power:VCC #PWR?
U 1 1 61442B67
P 5650 2375
F 0 "#PWR?" H 5650 2225 50  0001 C CNN
F 1 "VCC" H 5665 2548 50  0000 C CNN
F 2 "" H 5650 2375 50  0001 C CNN
F 3 "" H 5650 2375 50  0001 C CNN
	1    5650 2375
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 61443128
P 4950 3925
F 0 "#PWR?" H 4950 3775 50  0001 C CNN
F 1 "VCC" H 4965 4098 50  0000 C CNN
F 2 "" H 4950 3925 50  0001 C CNN
F 3 "" H 4950 3925 50  0001 C CNN
	1    4950 3925
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 61443D3F
P 4950 2125
F 0 "#PWR?" H 4950 1975 50  0001 C CNN
F 1 "VCC" H 4825 2175 50  0000 C CNN
F 2 "" H 4950 2125 50  0001 C CNN
F 3 "" H 4950 2125 50  0001 C CNN
	1    4950 2125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614450AA
P 5650 3675
F 0 "#PWR?" H 5650 3425 50  0001 C CNN
F 1 "GND" H 5655 3502 50  0000 C CNN
F 2 "" H 5650 3675 50  0001 C CNN
F 3 "" H 5650 3675 50  0001 C CNN
	1    5650 3675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6144568F
P 4950 5225
F 0 "#PWR?" H 4950 4975 50  0001 C CNN
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
Wire Wire Line
	1850 5525 6225 5525
Connection ~ 1850 5525
Wire Wire Line
	1850 5525 1850 7150
Text HLabel 6225 5525 2    50   Output ~ 0
MMAP_8
Wire Notes Line
	6175 2575 6675 2575
Wire Notes Line
	6675 2575 6675 3425
Wire Notes Line
	6675 3425 6175 3425
Wire Notes Line
	6175 3425 6175 2575
Text Notes 6125 2525 0    63   ~ 0
8 Byte Maps
Wire Notes Line
	6175 4225 6625 4225
Wire Notes Line
	6625 4225 6625 4975
Wire Notes Line
	6625 4975 6175 4975
Wire Notes Line
	6175 4975 6175 4225
Text Notes 6075 4175 0    63   ~ 0
64 Byte Maps
Wire Notes Line
	6175 5450 6625 5450
Wire Notes Line
	6625 5450 6625 5600
Wire Notes Line
	6625 5600 6175 5600
Wire Notes Line
	6175 5600 6175 5450
Text Notes 6075 5400 0    63   ~ 0
512 Byte Map
$EndSCHEMATC
