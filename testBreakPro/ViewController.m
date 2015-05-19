//
//  ViewController.m
//  testBreakPro
//
//  Created by jin on 15/5/17.
//  Copyright (c) 2015年 jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)NSString* varString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView
{
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake(100, 100, 100, 120);
    button1.backgroundColor = [UIColor redColor];
    [self.view addSubview:button1];
    
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(100, 250, 100, 120);
    [button2 addTarget:self action:@selector(buttonAction2:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button2];
    
    self.varString = @"123456";
}

- (void)buttonAction1:(id)sender
{
    NSInteger varA = 8;
    varA = varA + 5;
    
    NSInteger varB;
    varB = varA - 3;
    
    NSLog(@"var is %@",[NSString stringWithFormat:@"varA is %d varB is %d",varA,varB]);
    
    
    NSString* resaultString = self.varString;
    NSString* resaultString1 = [self varString];
    
    NSLog(@"resaultString is %@ resaultString1 is %@",resaultString,resaultString1);
}

- (void)buttonAction2:(id)sender
{
    NSString* actionStr = @"abcdef";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSString* str = @"123456";
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:str message:actionStr delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
            [alertView show];
            
        });
    });
}

@end
