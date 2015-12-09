//
//  UIColor+TFT.h
//  Color
//
//  Created by Burhanuddin Sunelwala on 11/18/14.
//  Copyright (c) 2014 TFT. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ColorWithRGBHex(hex)    [UIColor colorWithRGBHex:hex]

@interface UIColor (TFT)

///-----------------------------------------------------------
/// @name RGB Methods
///-----------------------------------------------------------

/**
@param hexString RGB Hex String. Can optionally be prefixed with #, 0x or 0X.
@param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
*/
+ (UIColor *)colorWithRGBHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 @param hexValue RGB Hex Value. Should be prefixed with 0x.
 @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 */
+ (UIColor *)colorWithRGBHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;

/**
 @return Returns a RGB Hex String for a specified UIColor.
 */
+ (NSString *)rgbHexStringForColor:(UIColor *)color;

/**
 @return Returns a RGB Hex Value for a specified UIColor.
 */
+ (NSUInteger)rgbHexValueForColor:(UIColor *)color;


///-----------------------------------------------------------
/// @name CNYK Methods
///-----------------------------------------------------------

/**
 @param cyan The cyan component of the color object, specified as a value from 0.0 to 1.0.
 @param magenta The magenta component of the color object, specified as a value from 0.0 to 1.0.
 @param yellow The yellow component of the color object, specified as a value from 0.0 to 1.0.
 @param black The black component of the color object, specified as a value from 0.0 to 1.0.
 @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 */
+ (UIColor *)colorWithCyan:(CGFloat)cyan magenta:(CGFloat)magenta yellow:(CGFloat)yellow black:(CGFloat)black alpha:(CGFloat)alpha;

/**
 @param hexString CMYK Hex String. Can optionally be prefixed with #, 0x or 0X.
 @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 */
+ (UIColor *)colorWithCMYKHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 @param hexValue CMYK Hex Value. Should be prefixed with 0x.
 @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 */
+ (UIColor *)colorWithCMYKHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;

/**
 @return Returns a CMYK Hex String for a specified UIColor.
 */
+ (NSString *)cmykHexStringForColor:(UIColor *)color;

/**
 @return Returns a CMYK Hex Value for a specified UIColor.
 */
+ (NSUInteger)cmykHexValueForColor:(UIColor *)color;

@end
