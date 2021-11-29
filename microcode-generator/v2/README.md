# Microcode Generator v2
This version of the microcode generator should be used with the control logic that uses two `27C4096` EPROMS, [as designed here](../../instruction-register-8-bit/).

This code does some light weight error checking to ensure the configuration file is coherent. However, there are some YAML errors that this code cannot detect. It is recommended that microcode configuration files be run through `yamllint` to ensure no syntax errors.