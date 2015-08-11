//
//  SixthViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 7/29/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "SixthViewController.h"

@interface SixthViewController ()

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithRed:1 green:0.639 blue:0.184 alpha:1] /*#ffa32f*/];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(one)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)one {
    
}


@end
