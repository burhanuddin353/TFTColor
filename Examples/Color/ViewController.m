//
//  ViewController.m
//  Color
//
//  Created by Burhanuddin Sunelwala on 11/18/14.
//  Copyright (c) 2014 TFT. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+TFT.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)textChanged:(UITextField *)sender {
    
    [self.view setBackgroundColor:[UIColor colorWithHex:sender.text]];
}

@end
