//
//  SixthViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 7/29/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "SixthViewController.h"
#import "SeventhViewController.h"

@interface SixthViewController ()

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

// Slide One
@property (nonatomic, retain) UIImageView *githubImageView;
@property (nonatomic, retain) UIImageView *buildImageView;
@property (nonatomic, retain) UIImageView *slackImageView;

//Slide 6
@property (nonatomic, retain) UIImageView *treeImageView;
@property (nonatomic, retain) CAShapeLayer *treeMask;

@property (nonatomic, retain) SeventhViewController *seventh;

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
    [self.view removeGestureRecognizer:self.oldTap];
    self.githubImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.githubImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.githubImageView setImage:[UIImage imageNamed:@"github"]];
    [self.view addSubview:self.githubImageView];
    
    CGPoint centerOne = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0);
    [self.githubImageView setCenter:centerOne];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.7 options:0 animations:^{
        [self.githubImageView setFrame:CGRectMake(0, 0, 300, 300)];
        [self.githubImageView setCenter:centerOne];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(two)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)two {
    [self.view removeGestureRecognizer:self.oldTap];
    self.buildImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.buildImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.buildImageView setImage:[UIImage imageNamed:@"building"]];
    [self.view addSubview:self.buildImageView];
    
    CGPoint centerOne = CGPointMake(self.view.frame.size.width/3.0, self.view.frame.size.height/2.0);
    
    CGPoint centerTwo = CGPointMake(2*(self.view.frame.size.width/3.0), self.view.frame.size.height/2.0);
    [self.buildImageView setCenter:centerTwo];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.7 options:0 animations:^{
        [self.githubImageView setCenter:centerOne];
        
        [self.buildImageView setFrame:CGRectMake(0, 0, 300, 300)];
        [self.buildImageView setCenter:centerTwo];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(three)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)three {
    [self.view removeGestureRecognizer:self.oldTap];
    self.slackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.slackImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.slackImageView setImage:[UIImage imageNamed:@"slack"]];
    [self.view addSubview:self.slackImageView];
    
    CGPoint centerOne = CGPointMake((self.view.frame.size.width/4.0)-50, self.view.frame.size.height/2.0);
    
    CGPoint centerTwo = CGPointMake(2*(self.view.frame.size.width/4.0), self.view.frame.size.height/2.0);
    
    CGPoint centerThree = CGPointMake((3*(self.view.frame.size.width/4.0)) + 50, self.view.frame.size.height/2.0);
    [self.slackImageView setCenter:centerThree];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.7 options:0 animations:^{
        [self.githubImageView setCenter:centerOne];
        [self.buildImageView setCenter:centerTwo];
        
        [self.slackImageView setFrame:CGRectMake(0, 0, 300, 300)];
        [self.slackImageView setCenter:centerThree];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(four)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)four {
    [self.view removeGestureRecognizer:self.oldTap];
    
    CGPoint centerOne = CGPointMake(-200, self.view.frame.size.height/2.0);
    
    CGPoint centerTwo = CGPointMake((self.view.frame.size.width/2.0), -200);
    
    CGPoint centerThree = CGPointMake(self.view.frame.size.width+200, self.view.frame.size.height/2.0);
    
    [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.7 options:0 animations:^{
        [self.githubImageView setCenter:centerOne];
        [self.buildImageView setCenter:centerTwo];
        [self.slackImageView setCenter:centerThree];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(five)];
        [self.view addGestureRecognizer:self.oldTap];
        [self.githubImageView removeFromSuperview];
        [self.buildImageView removeFromSuperview];
        [self.slackImageView removeFromSuperview];
    }];
}

- (void)five {
    [self.view removeGestureRecognizer:self.oldTap];
    self.treeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, self.view.frame.size.width-80, self.view.frame.size.height-80)];
    [self.treeImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.treeImageView setImage:[UIImage imageNamed:@"tree"]];
    [self.view addSubview:self.treeImageView];
    
    self.treeMask = [CAShapeLayer layer];
    self.treeMask.frame = CGRectMake((self.treeImageView.frame.size.width/2.0)-0.5, self.treeImageView.frame.size.height-82.5, 1, 1);
    self.treeMask.fillColor = [UIColor blackColor] /*#00ffff*/.CGColor;
    self.treeMask.backgroundColor = [UIColor clearColor].CGColor;
    self.treeMask.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 1, 1)].CGPath;
    [self.treeMask setValue:@(1.0) forKeyPath:@"transform.scale"];
    self.treeImageView.layer.mask = self.treeMask;
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(six)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)six {
    [self.view removeGestureRecognizer:self.oldTap];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setFromValue:@(1.0)];
    [animation setToValue:@(60)];
    [animation setDuration:1.0];
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:NO];
    [self.treeMask addAnimation:animation forKey:@"grow"];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seven)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)seven {
    [self.view removeGestureRecognizer:self.oldTap];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setFromValue:@(60.0)];
    [animation setToValue:@(1200)];
    [animation setDuration:3.2];
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:NO];
    [self.treeMask addAnimation:animation forKey:@"grow"];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eight)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)eight {
    [self.view removeGestureRecognizer:self.oldTap];
    
    [UIView animateWithDuration:1.4 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
        [self.treeImageView setFrame:CGRectMake(-600, -600, self.view.frame.size.width+1200, self.view.frame.size.height+1200)];
        [self.treeImageView setAlpha:0.0];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nine)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)nine {
    [self.view removeGestureRecognizer:self.oldTap];
    [UIView animateWithDuration:0.4 animations:^{
        [self.view setBackgroundColor:[UIColor colorWithRed:0.96 green:0.24 blue:0.33 alpha:1]];
    } completion:^(BOOL finished) {
        self.seventh = [[SeventhViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:self.seventh animated:NO completion:nil];
    }];
}

@end
