TFTColor
========

A simple UIColor category to get UIColor object from RGB hex string, RGB hex value, CMYK hex string, CMYK hex value or CMYK values. You can also retrieve back RGB hex string, RGB hex value, CMYK hex string or CMYK hex value.

## Usage
---

* Add `UIColor+TFT.h` and `UIColor+TFT.m` to your project.
* Import `UIColor+TFT.h` to your class.

#### Get UIColor from RGB Hex String.
```
+ (UIColor *)colorWithRGBHexString:(NSString *)hexString alpha:(CGFloat)alpha;
```
Ex:
```
[UIColor colorWithRGBHexString:@"FF34AE" alpha:1.0f]
[UIColor colorWithRGBHexString:@"#EA" alpha:1.0f]
```

#### Get UIColor from RGB Hex Value.
``` 
+ (UIColor *)colorWithRGBHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;
```
Ex:
``` 
[UIColor colorWithRGBHexValue:0xFF34AE alpha:1.0f]
``` 
#### Get RGB Hex String from UIColor.
``` 
+ (NSString *)rgbHexStringForColor:(UIColor *)color;
``` 
Ex: 
``` 
[UIColor rgbHexStringForColor:[UIColor redColor]] //This will return @"FF0000"
``` 
#### Get RGB Hex Value from UIColor.
``` 
+ (NSUInteger)rgbHexValueForColor:(UIColor *)color;
``` 
Ex: 
``` 
[UIColor rgbHexValueForColor:[UIColor redColor]] //This will return 0xFF0000
``` 

#### Get UIColor from CMYK component values.
``` 
+ (UIColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;
``` 
Creates and returns a color object using the specified opacity and CMYK component values.
The components of the color object, specified as a value from 0.0 to 1.0.

#### Get UIColor from CMYK Hex String.
``` 
+ (UIColor *)colorWithCMYKHexString:(NSString *)hexString alpha:(CGFloat)alpha;
``` 
Ex: 
``` 
[UIColor colorWithCMYKHexString:@"FF34AE34" alpha:1.0f]
[UIColor colorWithCMYKHexString:@"#EA" alpha:1.0f]
``` 

#### Get UIColor from CMYK Hex Value.
``` 
+ (UIColor *)colorWithCMYKHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;
``` 
Ex: 
``` 
[UIColor colorWithCMYKHexValue:0xFF34AE34 alpha:1.0f]
``` 

#### Get CMYK Hex String from UIColor.
``` 
+ (NSString *)cmykHexStringForColor:(UIColor *)color;
``` 
Ex: 
``` 
[UIColor cmykHexStringForColor:[UIColor redColor]] //This will return @"00646400"
``` 

#### Get CMYK Hex Value from UIColor.
``` 
+ (NSUInteger)cmykHexValueForColor:(UIColor *)color;
``` 
Ex:
``` 
[UIColor cmykHexValueForColor:[UIColor redColor]] //This will return 0x00646400
``` 

* The beautiful part of this library is that you can input Hex values with `#`, `0x` or `0X` and the category will take care of this.
* Also you can input hex value of any length and this will be handled.
* The category also takes care of non-hex characters.

#### Supporting Formats for RGB Hex Strings:
1. #B
2. #BB
3. #RGB
4. #GGBB
5. #RGGBB
6. #RRGGBB 

#### Supporting Formats for CMYK Hex Strings:
1. #K
2. #KK
3. #YKK
4. #CMYK
5. #MYYKK
6. #MMYYKK
7. #CMMYYKK
8. #CCMMYYKK



