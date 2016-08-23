//
//  ViewController.m
//  Color
//
//  Created by Burhanuddin Sunelwala on 11/18/14.
//  Copyright (c) 2014 TFT. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+TFT.h"

@interface ViewController () {
    
    __weak IBOutlet UIView *viewRGBHex;
    __weak IBOutlet UIView *viewCMYKHex;
    __weak IBOutlet UIView *viewCMYK;
    
    CGFloat cyan;
    CGFloat magenta;
    CGFloat yellow;
    CGFloat black;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIColor *color = [UIColor brownColor];
    NSLog(@"Hex Value: %06lx", (unsigned long)[UIColor rgbHexValueForColor:color]);
    NSLog(@"Hex String: %@", [UIColor rgbHexStringForColor:color]);
}

- (IBAction)rgbHexTextChanged:(UITextField *)sender {
    
    [viewRGBHex setBackgroundColor:[UIColor colorWithRGBHexString:sender.text alpha:1.0]];
    NSLog(@"Hex String: %@", [UIColor rgbHexStringForColor:viewRGBHex.backgroundColor]);
}

- (IBAction)cmykHexTextChanged:(UITextField *)sender {
    
    [viewCMYKHex setBackgroundColor:[UIColor colorWithRGBHexString:sender.text alpha:1.0]];
}

- (IBAction)cyanTextChanged:(UITextField *)sender {
    
    cyan = [sender.text floatValue];
    [self updateCMYK];
}
- (IBAction)magentaTextChanged:(UITextField *)sender {
    
    magenta = [sender.text floatValue];
    [self updateCMYK];
}
- (IBAction)yellowTextChanged:(UITextField *)sender {
    
    yellow = [sender.text floatValue];
    [self updateCMYK];
}
- (IBAction)blackTextChanged:(UITextField *)sender {
    
    black = [sender.text floatValue];
    [self updateCMYK];
}

- (void)updateCMYK {
    
    [viewCMYK setBackgroundColor:[UIColor colorWithCyan:cyan/255.0 magenta:magenta/255.0f yellow:yellow/255.0f black:black/255.0f alpha:1.0f]];
}

@end
