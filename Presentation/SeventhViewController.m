//
//  SeventhViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 8/11/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "SeventhViewController.h"
#import "EigthViewController.h"

@interface SeventhViewController ()

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

@property (nonatomic, retain) UIImageView *gearOne;
@property (nonatomic, retain) UIImageView *gearTwo;
@property (nonatomic, retain) UIImageView *gearThree;

@property (nonatomic, retain) UIImageView *walleImage;

@end

@implementation SeventhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.96 green:0.24 blue:0.33 alpha:1]];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(one)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)one {
    [self.view removeGestureRecognizer:self.oldTap];
    
    self.gearOne = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)-100, 450, 0, 0)];
    [self.gearOne setContentMode:UIViewContentModeScaleAspectFit];
    [self.gearOne setImage:[UIImage imageNamed:@"gear"]];
    [self.gearOne setAlpha:0.0];
    [self.view addSubview:self.gearOne];
    
    self.gearTwo = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)+125, 275, 0, 0)];
    [self.gearTwo setContentMode:UIViewContentModeScaleAspectFit];
    [self.gearTwo setImage:[UIImage imageNamed:@"gear"]];
    [self.gearTwo setAlpha:0.0];
    [self.view addSubview:self.gearTwo];
    
    self.gearThree = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)+100, 600, 0, 0)];
    [self.gearThree setContentMode:UIViewContentModeScaleAspectFit];
    [self.gearThree setImage:[UIImage imageNamed:@"gear"]];
    [self.gearThree setAlpha:0.0];
    [self.view addSubview:self.gearThree];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = @(0.0);
    animation.toValue = @(M_PI);
    animation.duration = 3.0;
    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.gearOne.layer addAnimation:animation forKey:@"rotation"];
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = @(0.0);
    animation.toValue = @(-M_PI);
    animation.duration = 3.0;
    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self.gearTwo.layer addAnimation:animation forKey:@"rotation"];
    [self.gearThree.layer addAnimation:animation forKey:@"rotation"];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.gearOne setFrame:CGRectMake((self.view.frame.size.width/2.0)-300, 250, 400, 400)];
        [self.gearOne setAlpha:1.0];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.4 delay:0.1 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.gearTwo setFrame:CGRectMake((self.view.frame.size.width/2.0)-25, 125, 300, 300)];
        [self.gearTwo setAlpha:1.0];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.4 delay:0.2 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.gearThree setFrame:CGRectMake((self.view.frame.size.width/2.0), 500, 200, 200)];
        [self.gearThree setAlpha:1.0];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(two)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

/* But what happens if something breaks. you want to make sure everyone knows that something
 * went wrong. And that's where slack comes in.
 */
- (void)two {
    [self.gearOne.layer removeAllAnimations];
    [self.gearTwo.layer removeAllAnimations];
    [self.gearThree.layer removeAllAnimations];
    
    double currentValue = [[self.gearOne.layer valueForKeyPath:@"transform.rotation"] doubleValue];
    double currentValueTwo = [[self.gearTwo.layer valueForKeyPath:@"transform.rotation"] doubleValue];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = @(currentValue);
    animation.toValue = @(currentValue + 0.1);
    animation.duration = 0.3;
    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.gearOne.layer addAnimation:animation forKey:@"rotation"];
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = @(currentValueTwo);
    animation.toValue = @(currentValueTwo - 0.1);
    animation.duration = 0.3;
    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.gearTwo.layer addAnimation:animation forKey:@"rotation"];
    [self.gearThree.layer addAnimation:animation forKey:@"rotation"];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(three)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)three {
    self.walleImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0), (self.view.frame.size.height/2.0), 0, 0)];
    [self.walleImage setContentMode:UIViewContentModeScaleAspectFit];
    [self.walleImage setImage:[UIImage imageNamed:@"walle"]];
    [self.walleImage setAlpha:0.0];
    [self.view addSubview:self.walleImage];
    
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.6 options:0 animations:^{
        [self.gearOne setAlpha:0.0];
        [self.gearTwo setAlpha:0.0];
        [self.gearThree setAlpha:0.0];
        
        [self.walleImage setFrame:CGRectMake((self.view.frame.size.width/2.0)-300, (self.view.frame.size.height/2.0)-300, 600, 600)];
        [self.walleImage setAlpha:1.0];
    } completion:^(BOOL finished) {
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(four)];
        [self.view addGestureRecognizer:self.oldTap];
        
        [self.gearOne removeFromSuperview];
        [self.gearTwo removeFromSuperview];
        [self.gearThree removeFromSuperview];
    }];
}

- (void)four {
    UIView *redView = [[UIView alloc] initWithFrame:self.view.bounds];
    [redView setBackgroundColor:[UIColor colorWithRed:211.0/255.0 green:60.0/255.0 blue:51.0/255.0 alpha:1]];
    
    [UIView transitionFromView:self.walleImage toView:redView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
        EigthViewController *eigth = [[EigthViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:eigth animated:NO completion:nil];
    }];
}

@end
