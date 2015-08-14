//
//  FourthViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 7/15/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "FourthViewController.h"
#import "FifthViewController.h"

@interface FourthViewController ()

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

// Slide One
@property (nonatomic, retain) UILabel *botsLabel;

// Slide Two
@property (nonatomic, retain) UIImageView *androidBot;

// Slide Three
@property (nonatomic, retain) UIImageView *xcodeBot;

// Slide Four
@property (nonatomic, retain) CAShapeLayer *leftEye;
@property (nonatomic, retain) CAShapeLayer *rightEye;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0.63 blue:0.53 alpha:1]];
    
    self.botsLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.botsLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:50.0]];
    [self.botsLabel setTextAlignment:NSTextAlignmentCenter];
    [self.botsLabel setTextColor:[UIColor whiteColor]];
    [self.botsLabel setText:@"Xcode Server"];
    [self.view addSubview:self.botsLabel];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(one)];
    [self.view addGestureRecognizer:self.oldTap];
    
}

- (void)one {
    [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
        [self.botsLabel setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    } completion:nil];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(two)];
    [self.view addGestureRecognizer:self.oldTap];
}


- (void)two {
    self.androidBot = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)-100, -200, 200, 200)];
    [self.androidBot setContentMode:UIViewContentModeScaleAspectFit];
    [self.androidBot setImage:[UIImage imageNamed:@"android"]];
    [self.view addSubview:self.androidBot];
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.9 initialSpringVelocity:0.7 options:0 animations:^{
        [self.androidBot setFrame:CGRectMake((self.view.frame.size.width/2.0)-100, 200, 200, 200)];
    } completion:nil];
    
    [UIView animateWithDuration:0.2 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:0.9 options:0 animations:^{
        [self.botsLabel setFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height)];
    } completion:^(BOOL completed) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(three)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)three {
    UIView *window = self.view;
    
    self.xcodeBot = [[UIImageView alloc] initWithFrame:CGRectMake(0, -self.view.frame.size.height-40, self.view.frame.size.width, self.view.frame.size.height-40)];
    [self.xcodeBot setContentMode:UIViewContentModeScaleAspectFit];
    [self.xcodeBot setImage:[UIImage imageNamed:@"xcode_bot"]];
    [self.view addSubview:self.xcodeBot];
    
    [UIView animateKeyframesWithDuration:0.6 delay:0.0 options:0 animations:^(void) {
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.05 animations:^(void) {
            [self.xcodeBot setFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-40)];
            [self.androidBot setAlpha:0.0];
            [self.botsLabel setAlpha:0.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.07 relativeDuration:0.1 animations:^(void) {
            window.frame = CGRectMake(0, 30, window.frame.size.width, window.frame.size.height);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.1 relativeDuration:0.1 animations:^(void) {
            window.frame = CGRectMake(0, -30, window.frame.size.width, window.frame.size.height);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.1 animations:^(void) {
            window.frame = CGRectMake(0, 20, window.frame.size.width, window.frame.size.height);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.1 animations:^(void) {
            window.frame = CGRectMake(0, -20, window.frame.size.width, window.frame.size.height);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.1 animations:^(void) {
            window.frame = CGRectMake(0, 10, window.frame.size.width, window.frame.size.height);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.1 animations:^(void) {
            window.frame = CGRectMake(0, -10, window.frame.size.width, window.frame.size.height);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.2 animations:^(void) {
            window.frame = CGRectMake(0, 0, window.frame.size.width, window.frame.size.height);
        }];
    } completion:^(BOOL completed) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(four)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)four {
    
    UIView *blankView = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:blankView];
    
    self.leftEye = [CAShapeLayer layer];
    self.leftEye.frame = CGRectMake((self.view.frame.size.width/2.0)-17, 124, 1, 1);
    self.leftEye.fillColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1] /*#00ffff*/.CGColor;
    self.leftEye.backgroundColor = [UIColor clearColor].CGColor;
    self.leftEye.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 1, 1)].CGPath;
    [self.leftEye setValue:@(1.0) forKeyPath:@"transform.scale"];
    [blankView.layer addSublayer:self.leftEye];
    
    self.rightEye = [CAShapeLayer layer];
    self.rightEye.frame = CGRectMake((self.view.frame.size.width/2.0)+12, 124, 1, 1);
    self.rightEye.fillColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1] /*#00ffff*/.CGColor;
    self.rightEye.backgroundColor = [UIColor clearColor].CGColor;
    self.rightEye.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 1, 1)].CGPath;
    [self.rightEye setValue:@(1.0) forKeyPath:@"transform.scale"];
    [blankView.layer addSublayer:self.rightEye];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setFromValue:@(1.0)];
    [animation setToValue:@(self.view.frame.size.width*1.9)];
    [animation setDuration:1.2];
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:NO];
    [self.leftEye addAnimation:animation forKey:@"grow"];
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setFromValue:@(1.0)];
    [animation setToValue:@(self.view.frame.size.width*1.9)];
    [animation setDuration:1.2];
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:NO];
    [self.rightEye addAnimation:animation forKey:@"grow"];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(five)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)five {
    FifthViewController *controller = [[FifthViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:controller animated:NO completion:nil];
}

@end
