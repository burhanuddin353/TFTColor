//
//  UIColor+TFT.h
//  Color
//
//  Created by Burhanuddin Sunelwala on 11/18/14.
//  Copyright (c) 2014 TFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TFT)

+ (UIColor *)colorWithRGBHex:(NSString *)hexCode;

+ (UIColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;

+ (UIColor *)colorWithCMYKHex:(NSString *)hexCode;

@end
