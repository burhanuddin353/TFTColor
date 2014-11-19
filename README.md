TFTColor
========

A simple UIColor category to get UIColor from RGB hex values, CMYK hex values and CMYK values.

## Usage
========

* Add `UIColor+TFT.h` and `UIColor+TFT.m` to your project.
* Import `UIColor+TFT.h` to your class.

### Converting from RGB hex values to UIColor

`+ (UIColor *)colorWithRGBHex:(NSString *)hexCode;`

### Converting from CMYK values to UIColor

`+ (UIColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;`

### Converting from CMYK Hex values to UIColor

`+ (UIColor *)colorWithCMYKHex:(NSString *)hexCode;`


* The beautiful part of this library is that you can input Hex values with `#`, `0x` or `0X` and the category will take care of this.
* Also you can input hex value of any length and this will be handled.
* The category also takes care of non-hex characters.
* Supporting Formats for RGB Hex:
> #B
> #BB
> #RGB
> #GGBB
> #RGGBB
> #RRGGBB 

> Supporting Formats for CMYK Hex:
> #K
> #KK
> #YKK
> #CMYK
> #MYYKK
> #MMYYKK
> #CMMYYKK
> #CCMMYYKK



