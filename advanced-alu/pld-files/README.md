# `PLD` Files for Programmable Logic

## Compiling PLD
The `.pld` files in this directory may be compiled with [GALasm](https://github.com/daveho/GALasm), producing a `.jed` file amonst others. Then the `.jed` file is used to program a `ATF22V10C` or `GAL22V10`.  

```sh
galasm flags-register-22v10.pld
```

## Programming the 22V10
The `ATF22V10C(UES)` type should be used when programming the ATF22V10C with `minipro`.

```sh
minipro -p "ATF22V10C(UES)" -w flags-register-22v10.jed
```

### Updating TL886II+ Firmware
Your TL866II+ may have an older version of firmware that is unable to program the `ATF22V10C`. You will need to latest firmware to be able to program these chips. Here is the process for updating the TL866II+ firmware using the `minipro` command line tool on MacOS and Linux:

1. Download Windows Minipro/XGecu Pro application from manufacturer site: [autoelectric.cn](http://www.autoelectric.cn/en/tl866_main.html)
2. Extract executable from RAR file:
```
unrar xgproV1181_setup.rar
```

3. Extract the `updateII.dat` file from the executable extracted in step 2. Use the [extract.me](https://extract.me) website to do this.
4. Update the TL866II+ firmware with:
```
minipro -F updateII.dat
```