//
//  UIColor+TFT.m
//  Color
//
//  Created by Burhanuddin Sunelwala on 11/18/14.
//  Copyright (c) 2014 TFT. All rights reserved.
//

#import "UIColor+TFT.h"

CGFloat const MAX_VAL = 255.0f;
NSString *const HEX_CHAR_SET = @"abcdefABCDEF1234567890";

@implementation UIColor (TFT)

#pragma mark - Helper Methods
+ (void)cleanHexString:(NSMutableString *)hexString expectedLength:(int)expectedLength {
    
    if ([hexString hasPrefix:@"#"]) {
        
        [hexString deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    else if ([hexString hasPrefix:@"0x"] ||
               [hexString hasPrefix:@"0X"]) {
        
        [hexString deleteCharactersInRange:NSMakeRange(0, 2)];
    }
    
    //Check for Special Characters. Truncate the string from first special character.
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:HEX_CHAR_SET] invertedSet];
    NSUInteger firstInvalidChar = [hexString rangeOfCharacterFromSet:characterSet].location;
    if (firstInvalidChar != NSNotFound) {
        
        [hexString deleteCharactersInRange:NSMakeRange(firstInvalidChar, hexString.length - firstInvalidChar)];
    }
    
    //Repeat each hex digit if length is half
    if (hexString.length == expectedLength/2) {
        
        for (int i = 0; i < expectedLength/2; ++i) {
            
            [hexString insertString:[hexString substringWithRange:NSMakeRange(i*2, 1)] atIndex:i*2];
        }
    }
    //Append zeros if the length is less than the expected length
    else if (hexString.length < expectedLength) {
        
        while (hexString.length != expectedLength) {
            [hexString insertString:@"0" atIndex:0];
        }
    }
    //Truncate the excess string if length is greater than expected length
    else if(hexString.length > expectedLength) {
        
        [hexString deleteCharactersInRange:NSMakeRange(expectedLength, hexString.length - expectedLength)];
    }
}

+ (NSUInteger)hexValueFromHexString:(NSString *)hexString {
    
    unsigned hexValue = 0;
    [[NSScanner scannerWithString:hexString] scanHexInt:&hexValue];
    return hexValue;
}

+ (NSArray *)rgbComponentsForColor:(UIColor *)color {
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSArray *colorComponents = @[@(red), @(green), @(blue), @(alpha)];
    return colorComponents;
}

+ (NSArray *)cmykComponentsForColor:(UIColor *)color {
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    CGFloat black = 1 - MAX(MAX(red, blue), green);
    CGFloat cyan = (1 - red - black) / (1 - black);
    CGFloat magenta = (1 - green - black) / (1 - black);
    CGFloat yellow = (1 - blue - black) / (1 - black);
    
    NSArray *colorComponents = @[@(cyan), @(magenta), @(yellow), @(black), @(alpha)];
    return colorComponents;
}

#pragma mark - Public Methods

#pragma mark RGB
+ (UIColor *)colorWithRGBHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    
    NSMutableString *mutableHexCode =  [hexString mutableCopy];
    [UIColor cleanHexString:mutableHexCode expectedLength:6];
    return [UIColor colorWithRGBHexValue:[self hexValueFromHexString:mutableHexCode] alpha:alpha];
}

+ (UIColor *)colorWithRGBHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha {

    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0];
}

+ (NSString *)rgbHexStringForColor:(UIColor *)color {

    NSArray *rgbComponents = [UIColor rgbComponentsForColor:color];
    
    NSMutableString *hexString = [NSMutableString string];
    [hexString appendFormat:@"%02x", ([rgbComponents[0] unsignedIntValue] * 255)];
    [hexString appendFormat:@"%02x", ([rgbComponents[1] unsignedIntValue] * 255)];
    [hexString appendFormat:@"%02x", ([rgbComponents[2] unsignedIntValue] * 255)];
    
    return hexString;
}

+ (NSUInteger)rgbHexValueForColor:(UIColor *)color {
    
    NSArray *rgbComponents = [UIColor rgbComponentsForColor:color];
    
    NSUInteger hexValue = [rgbComponents[0] unsignedIntValue] * 255 * 0xFFFFFF;
    hexValue += [rgbComponents[1] unsignedIntValue] * 255 * 0xFFFF;
    hexValue += [rgbComponents[2] unsignedIntValue] * 255 * 0xFF;
    
    return hexValue;
}

#pragma mark CNYK
+ (UIColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha {
    
    CGFloat red = (1.0f - cyan) * (1.0f - black);
    CGFloat green = (1.0f - magenta) * (1.0f - black);
    CGFloat blue = (1.0f - yellow) * (1.0f -black);
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithCMYKHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha {
    
    return [UIColor colorWithCyan:((float)((hexValue & 0xFF000000) >> 32))/255.0
                          magenta:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           yellow:((float)((hexValue & 0xFF00) >> 8))/255.0
                            black:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}

+ (UIColor *)colorWithCMYKHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    
    NSMutableString *mutableHexCode =  [hexString mutableCopy];
    [UIColor cleanHexString:mutableHexCode expectedLength:8];
    return [UIColor colorWithCMYKHexValue:[self hexValueFromHexString:mutableHexCode] alpha:alpha];
}

+ (NSString *)cmykHexStringForColor:(UIColor *)color {
    
    NSArray *cmykComponents = [UIColor cmykComponentsForColor:color];
    
    NSMutableString *hexString = [NSMutableString string];
    [hexString appendFormat:@"%02x", ([cmykComponents[0] unsignedIntValue] * 255)];
    [hexString appendFormat:@"%02x", ([cmykComponents[1] unsignedIntValue] * 255)];
    [hexString appendFormat:@"%02x", ([cmykComponents[2] unsignedIntValue] * 255)];
    [hexString appendFormat:@"%02x", ([cmykComponents[3] unsignedIntValue] * 255)];
    
    return hexString;
}

+ (NSUInteger)cmykHexValueForColor:(UIColor *)color {
    
    NSArray *cmykComponents = [UIColor cmykComponentsForColor:color];
    
    NSUInteger hexValue = [cmykComponents[0] unsignedIntValue] * 255 * 0xFFFFFFFF;
    hexValue += [cmykComponents[1] unsignedIntValue] * 255 * 0xFFFFFF;
    hexValue += [cmykComponents[2] unsignedIntValue] * 255 * 0xFFFF;
    hexValue += [cmykComponents[3] unsignedIntValue] * 255 * 0xFF;
    
    return hexValue;
}

@end