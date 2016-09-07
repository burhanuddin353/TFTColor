TFTColor
========

A simple UIColor category to get UIColor object from RGB hex string, RGB hex value, CMYK hex string, CMYK hex value or CMYK values. You can also retrieve back RGB hex string, RGB hex value, CMYK hex string or CMYK hex value.

## Objective-C
---

* Add `UIColor+TFT.h` and `UIColor+TFT.m` to your project.
* Import `UIColor+TFT.h` to your class.

#### Get UIColor from RGB Hex String

```
[UIColor colorWithRGBHexString:@"FF34AE" alpha:1.0f]
[UIColor colorWithRGBHexString:@"#ea" alpha:1.0f]
```

#### Get UIColor from RGB Hex Value

``` 
[UIColor colorWithRGBHexValue:0xFF34AE alpha:1.0f]
``` 
#### Get RGB Hex String from UIColor

``` 
[UIColor rgbHexStringForColor:[UIColor redColor]] //This will return @"FF0000"
``` 
#### Get RGB Hex Value from UIColor

``` 
[UIColor rgbHexValueForColor:[UIColor redColor]] //This will return 0xFF0000
``` 

#### Get UIColor from CMYK component values
``` 
[UIColor colorWithCyan:0.5f magenta:0.5 yellow:0.5f black:0.5f alpha:1.0f];
``` 
Creates and returns a color object using the specified opacity and CMYK component values.
The components of the color object, specified as a value from 0.0 to 1.0.

#### Get UIColor from CMYK Hex String
 
``` 
[UIColor colorWithCMYKHexString:@"FF34AE34" alpha:1.0f]
[UIColor colorWithCMYKHexString:@"#EA" alpha:1.0f]
``` 

#### Get UIColor from CMYK Hex Value
 
``` 
[UIColor colorWithCMYKHexValue:0xFF34AE34 alpha:1.0f]
``` 

#### Get CMYK Hex String from UIColor
 
``` 
[UIColor cmykHexStringForColor:[UIColor redColor]] //This will return @"00646400"
``` 

#### Get CMYK Hex Value from UIColor

``` 
[UIColor cmykHexValueForColor:[UIColor redColor]] //This will return 0x00646400
``` 
## Swift
---

* Add `TFTColor.swift` to your project.

#### Get UIColor from RGB Hex String

```
UIColor.color(rgbHexString: "FF34AE" alpha: 1.0)
UIColor.color(rgbHexString: "#ea" alpha: 1.0)
```

#### Get UIColor from RGB Hex Value


```
UIColor.color(rgbHexValue: 0xFF34AE alpha: 1.0)
```
#### Get RGB Hex String from UIColor

 
``` 
UIColor.rgbHexString(for: UIColor.redColor()) //This will return @"FF0000"
``` 
#### Get RGB Hex Value from UIColor

 
``` 
UIColor.rgbHexValue(for: UIColor.redColor()) //This will return 0xFF0000
``` 

#### Get UIColor from CMYK component values
``` 
UIColor(cyan:0.5, magenta: 0.5, yellow: 0.5, black: 0.5, alpha: 1.0)
``` 
Creates and returns a color object using the specified opacity and CMYK component values.
The components of the color object, specified as a value from 0.0 to 1.0.

#### Get UIColor from CMYK Hex String

 
``` 
UIColor.color(cmykHexString: "FF34AE34" alpha:1.0)
UIColor.color(cmykHexString: "#ea" alpha:1.0)
``` 

#### Get UIColor from CMYK Hex Value

 
``` 
UIColor.color(cmykHexValue: 0xFF34AE34 alpha:1.0f)
``` 

#### Get CMYK Hex String from UIColor

 
``` 
UIColor.cmykHexString(for: UIColor.redColor()) //This will return @"00646400"
``` 

#### Get CMYK Hex Value from UIColor


``` 
UIColor.cmykHexValue(forColor: UIColor.redColor()) //This will return 0x00646400
``` 
* The beautiful part of this library is that you can input Hex values with `#`, `0x` or `0X` and the it will take care of this.
* Also you can input hex value of any length and this will be handled.
* The library also takes care of non-hex characters.

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



