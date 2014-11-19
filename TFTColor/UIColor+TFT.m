//
//  UIColor+TFT.m
//  Color
//
//  Created by Burhanuddin Sunelwala on 11/18/14.
//  Copyright (c) 2014 TFT. All rights reserved.
//

#import "UIColor+TFT.h"

@implementation UIColor (TFT)

+ (void)cleanHexString:(NSMutableString *)hexString expectedLength:(int)length {
    
    if ([hexString hasPrefix:@"#"]) {
        
        [hexString deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    
    if ([hexString hasPrefix:@"0x"] ||
        [hexString hasPrefix:@"0X"]) {
        
        [hexString deleteCharactersInRange:NSMakeRange(0, 2)];
    }
    
    //Check for Special Characters. Truncate the string from first special character.
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefABCDEF1234567890"] invertedSet];
    
    NSUInteger firstInvalidChar = [hexString rangeOfCharacterFromSet:characterSet].location;
    if (firstInvalidChar != NSNotFound) {
        
        [hexString deleteCharactersInRange:NSMakeRange(firstInvalidChar, hexString.length - firstInvalidChar)];
    }
    
    //Truncate the excess string if length is greater than expected length
    if (hexString.length > length) {
        
        [hexString deleteCharactersInRange:NSMakeRange(length, hexString.length - length)];
    }
    
    //Repeat each hex digit if length is half
    if (hexString.length == length/2) {
        
        for (int i = 0; i < length/2; ++i) {
            
            [hexString insertString:[hexString substringWithRange:NSMakeRange(i*2, 1)] atIndex:i*2];
        }
    }
    
    //Appending 0s if the length is less than expected length
    if (hexString.length != length/2 &&
        hexString.length <= length) {
        
        while (hexString.length != length) {
            [hexString insertString:@"0" atIndex:0];
        }
    }
}

+ (UIColor *)colorWithRGBHex:(NSString *)hexCode {
    
    NSMutableString *mutableHexCode =  [hexCode mutableCopy];
    
    [UIColor cleanHexString:mutableHexCode expectedLength:6];
    
    //Actual code converting each two hex digits into int
    NSString *redHex = [mutableHexCode substringWithRange:NSMakeRange(0, 2)];
    NSString *greenHex = [mutableHexCode substringWithRange:NSMakeRange(2, 2)];
    NSString *blueHex = [mutableHexCode substringWithRange:NSMakeRange(4, 2)];
    
    unsigned int red = 0;
    unsigned int green = 0;
    unsigned int blue = 0;
    
    [[NSScanner scannerWithString:redHex] scanHexInt:&red];
    [[NSScanner scannerWithString:greenHex] scanHexInt:&green];
    [[NSScanner scannerWithString:blueHex] scanHexInt:&blue];
    
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}

+ (UIColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha {
    
    CGFloat red = 255 * (1-cyan) * (1-black);
    CGFloat green = 255 * (1-magenta) * (1-black);
    CGFloat blue = 255 * (1-yellow) * (1-black);
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithCMYKHex:(NSString *)hexCode {
    
    NSMutableString *mutableHexCode =  [hexCode mutableCopy];
    
    [UIColor cleanHexString:mutableHexCode expectedLength:8];
    
    //Actual code converting each two hex digits into int
    NSString *cyanHex = [mutableHexCode substringWithRange:NSMakeRange(0, 2)];
    NSString *magentaHex = [mutableHexCode substringWithRange:NSMakeRange(2, 2)];
    NSString *yellowHex = [mutableHexCode substringWithRange:NSMakeRange(4, 2)];
    NSString *blackHex = [mutableHexCode substringWithRange:NSMakeRange(6, 2)];
    
    unsigned int cyan = 0;
    unsigned int magenta = 0;
    unsigned int yellow = 0;
    unsigned int black = 0;
    
    [[NSScanner scannerWithString:cyanHex] scanHexInt:&cyan];
    [[NSScanner scannerWithString:magentaHex] scanHexInt:&magenta];
    [[NSScanner scannerWithString:yellowHex] scanHexInt:&yellow];
    [[NSScanner scannerWithString:blackHex] scanHexInt:&black];
    
    return [UIColor colorWithCyan:cyan/255.0f magenta:magenta/255.0f yellow:yellow/255.0f black:black/255.0f alpha:1.0f];
}

@end
