//
//  EigthViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 8/11/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "EigthViewController.h"
#import "SKBounceAnimation.h"

@interface EigthViewController ()

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

@property (nonatomic, retain) UIImageView *head;
@property (nonatomic, retain) UIImageView *torso;
@property (nonatomic, retain) UIImageView *rightLeg;
@property (nonatomic, retain) UIImageView *leftLeg;

@property (nonatomic, retain) UIImageView *bugs;
@property (nonatomic, retain) UIImageView *dashboard;
@property (nonatomic, retain) UIImageView *client;
@property (nonatomic, retain) UIImageView *calling;

@property (nonatomic, retain) CAShapeLayer *backgroundCircle;
@property (nonatomic, retain) CAShapeLayer *foregroundCircle;
@property (nonatomic, retain) UIImageView *questions;

@end

@implementation EigthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithRed:211.0/255.0 green:60.0/255.0 blue:51.0/255.0 alpha:1]];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(one)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)one {
    [self.view removeGestureRecognizer:self.oldTap];
    self.head = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.head setContentMode:UIViewContentModeScaleAspectFit];
    [self.head setImage:[UIImage imageNamed:@"baby_head"]];
    [self.head setAlpha:0.0];
    [self.view addSubview:self.head];
    
    self.torso = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.torso setContentMode:UIViewContentModeScaleAspectFit];
    [self.torso setImage:[UIImage imageNamed:@"baby_torso"]];
    [self.torso setAlpha:0.0];
    [self.view addSubview:self.torso];
    
    self.rightLeg = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.rightLeg setContentMode:UIViewContentModeScaleAspectFit];
    [self.rightLeg setImage:[UIImage imageNamed:@"baby_right_leg"]];
    [self.rightLeg setAlpha:0.0];
    [self.view addSubview:self.rightLeg];
    
    self.leftLeg = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.leftLeg setContentMode:UIViewContentModeScaleAspectFit];
    [self.leftLeg setImage:[UIImage imageNamed:@"baby_left_leg"]];
    [self.leftLeg setAlpha:0.0];
    [self.view addSubview:self.leftLeg];
    
    CGRect finalFrame = CGRectMake((self.view.frame.size.width/2.0)-300, (self.view.frame.size.height/2.0)-300, 600, 600);
    
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.head setFrame:finalFrame];
        [self.head setAlpha:1.0];
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0.05 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.torso setFrame:finalFrame];
        [self.torso setAlpha:1.0];
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.leftLeg setFrame:finalFrame];
        [self.leftLeg setAlpha:1.0];
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0.15 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.rightLeg setFrame:finalFrame];
        [self.rightLeg setAlpha:1.0];
    } completion:^(BOOL completed) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(two)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)two {
    [self.view removeGestureRecognizer:self.oldTap];
    
    self.bugs = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.bugs setContentMode:UIViewContentModeScaleAspectFit];
    [self.bugs setImage:[UIImage imageNamed:@"bugs"]];
    [self.bugs setAlpha:0.0];
    [self.view addSubview:self.bugs];
    
    CGRect finalFrame = CGRectMake((self.view.frame.size.width/2.0)-200, (self.view.frame.size.height/2.0)-200, 400, 400);
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.head setFrame:finalFrame];
        [self.torso setFrame:finalFrame];
        [self.rightLeg setFrame:finalFrame];
        [self.leftLeg setFrame:finalFrame];
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:0.6 options:0 animations:^{
        [self.bugs setFrame:CGRectMake(100, 100, 200, 200)];
        [self.bugs setAlpha:1.0];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(three)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)three {
    [self.view removeGestureRecognizer:self.oldTap];
    
    self.dashboard = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.dashboard setContentMode:UIViewContentModeScaleAspectFit];
    [self.dashboard setImage:[UIImage imageNamed:@"dashboard"]];
    [self.dashboard setAlpha:0.0];
    [self.view addSubview:self.dashboard];
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:0.6 options:0 animations:^{
        [self.dashboard setFrame:CGRectMake(100, (self.view.frame.size.height-300), 200, 200)];
        [self.dashboard setAlpha:1.0];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(four)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)four {
    [self.view removeGestureRecognizer:self.oldTap];
    
    self.client = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.client setContentMode:UIViewContentModeScaleAspectFit];
    [self.client setImage:[UIImage imageNamed:@"client"]];
    [self.client setAlpha:0.0];
    [self.view addSubview:self.client];
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:0.6 options:0 animations:^{
        [self.client setFrame:CGRectMake((self.view.frame.size.width-300), 100, 200, 200)];
        [self.client setAlpha:1.0];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(five)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)five {
    [self.view removeGestureRecognizer:self.oldTap];
    
    self.calling = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.calling setContentMode:UIViewContentModeScaleAspectFit];
    [self.calling setImage:[UIImage imageNamed:@"phone"]];
    [self.calling setAlpha:0.0];
    [self.view addSubview:self.calling];
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:0.6 options:0 animations:^{
        [self.calling setFrame:CGRectMake((self.view.frame.size.width-300), (self.view.frame.size.height-300), 200, 200)];
        [self.calling setAlpha:1.0];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(six)];
        [self.view addGestureRecognizer:self.oldTap];
        
        self.backgroundCircle = [CAShapeLayer layer];
        self.backgroundCircle.frame = CGRectMake((self.view.frame.size.width/2.0)-0.5, (self.view.frame.size.height/2.0)-0.5, 1, 1);
        self.backgroundCircle.fillColor = [UIColor colorWithRed:0.09 green:0.63 blue:0.52 alpha:1].CGColor;
        self.backgroundCircle.backgroundColor = [UIColor clearColor].CGColor;
        self.backgroundCircle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 1, 1)].CGPath;
        [self.backgroundCircle setValue:@(1.0) forKeyPath:@"transform.scale"];
        [self.view.layer addSublayer:self.backgroundCircle];
        
        self.foregroundCircle = [CAShapeLayer layer];
        self.foregroundCircle.frame = CGRectMake((self.view.frame.size.width/2.0)-0.5, (self.view.frame.size.height/2.0)-0.5, 1, 1);
        self.foregroundCircle.fillColor = [UIColor colorWithRed:0.1 green:0.74 blue:0.61 alpha:1].CGColor;
        self.foregroundCircle.backgroundColor = [UIColor clearColor].CGColor;
        self.foregroundCircle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 1, 1)].CGPath;
        [self.foregroundCircle setValue:@(1.0) forKey:@"transform.scale"];
        [self.view.layer addSublayer:self.foregroundCircle];
    }];
}

- (void)six {
    [self.view removeGestureRecognizer:self.oldTap];
    
    SKBounceAnimation *animation = [SKBounceAnimation animationWithKeyPath:@"transform.scale"];
    [animation setFromValue:@(1.0)];
    [animation setToValue:@(self.view.frame.size.width*1.5)];
    [animation setDuration:0.6];
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:NO];
    [animation setNumberOfBounces:1];
    [self.backgroundCircle addAnimation:animation forKey:@"grow"];
    
    animation = [SKBounceAnimation animationWithKeyPath:@"transform.scale"];
    [animation setFromValue:@(1.0)];
    [animation setToValue:@(self.view.frame.size.width*1.3)];
    [animation setDuration:3.0];
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:NO];
    [animation setNumberOfBounces:2];
    [self.foregroundCircle addAnimation:animation forKey:@"grow"];
    
    self.questions = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.questions setContentMode:UIViewContentModeScaleAspectFit];
    [self.questions setImage:[UIImage imageNamed:@"questions"]];
    [self.questions setAlpha:0.0];
    [self.view addSubview:self.questions];
    
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.4 initialSpringVelocity:0.7 options:0 animations:^{
        [self.questions setFrame:self.view.bounds];
        [self.questions setAlpha:1.0];
    } completion:nil];
    
}

@end
