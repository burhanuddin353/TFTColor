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

+ (void)cleanHexString:(NSMutableString *)hexString expectedLength:(int)length {
    
    if ([hexString hasPrefix:@"#"]) {
        
        [hexString deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    
    if ([hexString hasPrefix:@"0x"] ||
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
    if (length % 2 == 0 && hexString.length == length/2) {
        
        for (int i = 0; i < length/2; ++i) {
            
            [hexString insertString:[hexString substringWithRange:NSMakeRange(i*2, 1)] atIndex:i*2];
        }
    } else if (hexString.length < length) {
        
        while (hexString.length != length) {
            [hexString insertString:@"0" atIndex:0];
        }
    } else if(hexString.length > length) {
         //Truncate the excess string if length is greater than expected length
        
        [hexString deleteCharactersInRange:NSMakeRange(length, hexString.length - length)];
    }
}

+ (NSArray *)colorComponentsWithHexcode:(NSMutableString *)hexcode components:(int)components {
    
    //Actual code converting each two hex digits into int
    
    NSMutableArray *colorComponents = [NSMutableArray array];
    for (int i = 0; i < components * 2; i += 2) {
        
        NSString *hex = [hexcode substringWithRange:NSMakeRange(i, 2)];
        unsigned int color = 0;
        [[NSScanner scannerWithString:hex] scanHexInt:&color];
        [colorComponents addObject:[NSNumber numberWithFloat:color / MAX_VAL]];
    }
    return colorComponents;
}

+ (UIColor *)colorWithRGBHex:(NSString *)hexCode {
    
    NSMutableString *mutableHexCode =  [hexCode mutableCopy];
    
    [UIColor cleanHexString:mutableHexCode expectedLength:6];
    NSArray *color = [self colorComponentsWithHexcode:mutableHexCode components:3];
    return [UIColor colorWithRed:[color[0] floatValue] green:[color[1] floatValue] blue:[color[2] floatValue] alpha:1.0f];
}

+ (UIColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha {
    
    CGFloat red = (1.0f - cyan) * (1.0f - black);
    CGFloat green = (1.0f - magenta) * (1.0f - black);
    CGFloat blue = (1.0f - yellow) * (1.0f -black);
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithCMYKHex:(NSString *)hexCode {
    
    NSMutableString *mutableHexCode =  [hexCode mutableCopy];
    
    [UIColor cleanHexString:mutableHexCode expectedLength:8];
    NSArray *color = [self colorComponentsWithHexcode:mutableHexCode components:4];
    return [UIColor colorWithCyan:[color[0] floatValue] magenta:[color[1] floatValue] yellow:[color[2] floatValue] black:[color[3] floatValue] alpha:1.0f];
}

+ (NSString *)hexStringForColor:(UIColor *)color {
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSString *redHex = [NSString stringWithFormat:@"%02x", (int)(red * 255)];
    NSString *greenHex = [NSString stringWithFormat:@"%02x", (int)(green * 255)];
    NSString *blueHex = [NSString stringWithFormat:@"%02x", (int)(blue * 255)];
    
    return [NSString stringWithFormat:@"%@%@%@", redHex, greenHex, blueHex];
}

@end