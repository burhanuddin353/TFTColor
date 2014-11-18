//
//  UIColor+TFT.m
//  Color
//
//  Created by Burhanuddin Sunelwala on 11/18/14.
//  Copyright (c) 2014 TFT. All rights reserved.
//

#import "UIColor+TFT.h"

@implementation UIColor (TFT)

+ (UIColor *)colorWithHex:(NSString *)hexCode {
    
    NSMutableString *mutableHexCode =  [hexCode mutableCopy];
    
    if (!mutableHexCode.length) {
        
        return [UIColor blackColor];
    }
    
    if ([mutableHexCode hasPrefix:@"#"]) {
        
        [mutableHexCode deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    
    if ([mutableHexCode hasPrefix:@"0x"] ||
        [mutableHexCode hasPrefix:@"0X"]) {
        
        [mutableHexCode deleteCharactersInRange:NSMakeRange(0, 2)];
    }
    
    //Check for Special Characters. Truncate the string from first special character.
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"] invertedSet];
    
    NSUInteger firstInvalidChar = [mutableHexCode rangeOfCharacterFromSet:characterSet].location;
    if (firstInvalidChar != NSNotFound) {
        
        [mutableHexCode deleteCharactersInRange:NSMakeRange(firstInvalidChar, mutableHexCode.length - firstInvalidChar)];
    }
    
    if (!mutableHexCode.length) {
        
        return [UIColor blackColor];
    }
    
    //Truncate the excess string if length is greater than 6
    if (mutableHexCode.length > 6) {
        
        [mutableHexCode deleteCharactersInRange:NSMakeRange(6, mutableHexCode.length - 6)];
    }
    
    //Repeat each hex digit if length is half
    if (mutableHexCode.length == 3) {
        
        [mutableHexCode insertString:[mutableHexCode substringWithRange:NSMakeRange(0, 1)] atIndex:0];
        [mutableHexCode insertString:[mutableHexCode substringWithRange:NSMakeRange(2, 1)] atIndex:2];
        [mutableHexCode insertString:[mutableHexCode substringWithRange:NSMakeRange(4, 1)] atIndex:4];
    }
    
    //Appending 0s if the length is less than 6
    if (mutableHexCode.length != 3 &&
        mutableHexCode.length <= 6) {
        
        while (mutableHexCode.length != 6) {
            [mutableHexCode insertString:@"0" atIndex:0];
        }
    }
    
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

@end
