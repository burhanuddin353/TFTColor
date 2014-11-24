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
}

- (IBAction)rgbHexTextChanged:(UITextField *)sender {
    
    [viewRGBHex setBackgroundColor:[UIColor colorWithRGBHex:sender.text]];
    NSLog(@"%@", [UIColor hexStringForColor:viewRGBHex.backgroundColor]);
}

- (IBAction)cmykHexTextChanged:(UITextField *)sender {
    
    [viewCMYKHex setBackgroundColor:[UIColor colorWithCMYKHex:sender.text]];
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
