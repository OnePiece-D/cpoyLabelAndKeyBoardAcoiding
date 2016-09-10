//
//  ViewController.m
//  testDemo
//
//  Created by ycd15 on 16/8/15.
//  Copyright © 2016年 YCD_WYL. All rights reserved.
//

#import "ViewController.h"

#import "TPKeyboardAvoidingScrollView.h"
#import "WYLResponseLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WYLResponseLabel * label = [WYLResponseLabel.alloc initWithFrame:CGRectMake(100, 100, 200, 20)];
    label.text = @"asdasdasdas";
    [label attachTapHandle];
    
    //[label addTitle:@"秋天" action:@selector(action)];
    [self.view addSubview:label];
}

- (void)action {
    NSLog(@"12312312314124");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
