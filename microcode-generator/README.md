## Purpose
The Python 3 code in this directory is used to generate microcode EEPROM images using a YAML configuration file. The various configuration files are spread through this repository.

## Usage
Microcode EEPROM image is used with the following command:
```
python generate-microcode.py /path/to/microcode-config.yaml
```

## Setup
Some python libraries should be installed before running this code. A `requirements.txt` file is provided to make that easy. Ideally this is done in a python virtual environment:
```
pip install -r requirements.txt
```