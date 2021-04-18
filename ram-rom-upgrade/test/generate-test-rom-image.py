import sys

if __name__ == '__main__':
    out_file_name = 'eeprom_test_pattern.bin'
    if len(sys.argv) == 2:
        out_file_name = sys.argv[1]
    eeprom_size = 2**15
    eeprom_contents = bytearray(eeprom_size)
    print("Generating eeprom contents ...")
    for i in range(0,eeprom_size):
        eeprom_contents[i] = i&0x00FF
    print('Writing eeprom contents to "{0}"'.format(out_file_name))
    with open(out_file_name, 'wb') as f:
        f.write(eeprom_contents)
    
    print("Done!")