//
//  ViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 7/13/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "ViewController.h"
#import "SKBounceAnimation.h"
#import "SecondViewController.h"

@interface ViewController ()

//Scene 1
@property (nonatomic, retain) UILabel *authorLabel;

//Scene 2
@property (nonatomic, retain) CAShapeLayer *backgroundCircle;
@property (nonatomic, retain) CAShapeLayer *foregroundCircle;
@property (nonatomic, retain) UIImageView *profileView;
@property (nonatomic, retain) UILabel *scene2Author;

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

@property (nonatomic, retain) UIView *scene1;
@property (nonatomic, retain) SecondViewController *second;

@end

@implementation ViewController

/*
 * Introduction
 * Who you are and what team you worked on
 * How you heard about WillowTree
 * Why you decided to do your presentation as an iPad App
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scene1 = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.scene1 setBackgroundColor:[UIColor whiteColor]];
    [self.scene1 setClipsToBounds:YES];
    [self.view addSubview:self.scene1];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height/2.0)-100, self.view.frame.size.width, 200)];
    [titleLabel setFont:[UIFont systemFontOfSize:40.0]];
    [titleLabel setText:@"What I Learned at WillowTree"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self.scene1 addSubview:titleLabel];
    
    self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height/2.0)-70, self.view.frame.size.width, 200)];
    [self.authorLabel setFont:[UIFont systemFontOfSize:30.0]];
    [self.authorLabel setText:@"Jackson Taylor"];
    [self.authorLabel setTextAlignment:NSTextAlignmentCenter];
    [self.authorLabel setTextColor:[UIColor blackColor]];
    [self.scene1 addSubview:self.authorLabel];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(one)];
    [self.scene1 addGestureRecognizer:self.oldTap];
}

/*
 * Learned a couple of things when I first got here
 * and the first one was design from Jordan. Line spacing.
 */
- (void)one {
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.authorLabel setFrame:CGRectMake(0, (self.view.frame.size.height/2.0)-50, self.view.frame.size.width, 200)];
    }];
    
    
    self.backgroundCircle = [CAShapeLayer layer];
    self.backgroundCircle.frame = CGRectMake((self.view.frame.size.width/2.0)-0.5, (self.view.frame.size.height/2.0)-0.5, 1, 1);
    self.backgroundCircle.fillColor = [UIColor colorWithRed:0.16 green:0.5 blue:0.73 alpha:1].CGColor;
    self.backgroundCircle.backgroundColor = [UIColor clearColor].CGColor;
    self.backgroundCircle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 1, 1)].CGPath;
    [self.backgroundCircle setValue:@(1.0) forKeyPath:@"transform.scale"];
    [self.scene1.layer addSublayer:self.backgroundCircle];
    
    self.foregroundCircle = [CAShapeLayer layer];
    self.foregroundCircle.frame = CGRectMake((self.view.frame.size.width/2.0)-0.5, (self.view.frame.size.height/2.0)-0.5, 1, 1);
    self.foregroundCircle.fillColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.86 alpha:1].CGColor;
    self.foregroundCircle.backgroundColor = [UIColor clearColor].CGColor;
    self.foregroundCircle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 1, 1)].CGPath;
    [self.foregroundCircle setValue:@(1.0) forKey:@"transform.scale"];
    [self.scene1.layer addSublayer:self.foregroundCircle];
    
    self.profileView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)-20, (self.view.frame.size.height/2.0) + 50, 40, 40)];
    [self.profileView setImage:[UIImage imageNamed:@"profile"]];
    [self.profileView setBackgroundColor:[UIColor whiteColor]];
    [self.profileView setClipsToBounds:YES];
    [self.profileView setContentMode:UIViewContentModeScaleAspectFit];
    [self.profileView.layer setCornerRadius:20.0];
    [self.profileView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.profileView.layer setBorderWidth:4.0];
    [self.profileView setAlpha:0.0];
    [self.scene1 addSubview:self.profileView];
    
    self.scene2Author = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height/2.0)+40, self.view.frame.size.width, 70)];
    [self.scene2Author setFont:[UIFont fontWithName:@"HelveticaNeue" size:50.0]];
    [self.scene2Author setTextColor:[UIColor whiteColor]];
    [self.scene2Author setTextAlignment:NSTextAlignmentCenter];
    [self.scene2Author setText:@"Jackson Taylor"];
    [self.scene2Author setAlpha:0.0];
    [self.scene1 addSubview:self.scene2Author];
    
    [self.scene1 removeGestureRecognizer:self.oldTap];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(two)];
    [self.scene1 addGestureRecognizer:self.oldTap];
}

/*
 * And then I started to learn how to make some pretty apps. So let's just change this from 
 * blank and add in some material design.
 */
- (void)two {
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
    
    [UIView animateWithDuration:1.0 delay:0.3 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:0 animations:^{
        [self.profileView setAlpha:1.0];
        [self.profileView setFrame:CGRectMake((self.view.frame.size.width/2.0)-150, (self.view.frame.size.height/2.0) - 200, 300, 300)];
        [self.profileView.layer setCornerRadius:150.0];
        [self.profileView.layer setBorderWidth:10.0];
    } completion:^(BOOL complete) {
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:0 animations:^{
            [self.scene2Author setAlpha:1.0];
            [self.scene2Author setFrame:CGRectMake(0, (self.view.frame.size.height/2.0)+140, self.view.frame.size.width, 50)];
        } completion:nil];
    }];
    
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(three)];
    [self.scene1 addGestureRecognizer:self.oldTap];
}

- (void)three {
    
    self.second = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [self.second.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIView *tempSecond = [self.second.view snapshotViewAfterScreenUpdates:YES];
    [tempSecond setFrame:CGRectMake(self.view.frame.size.width + 60, 60, self.view.frame.size.width-120, self.view.frame.size.height-120)];
    [self.view addSubview:tempSecond];
    
    [self.second.view setHidden:YES];
    [self.view addSubview:self.second.view];
    
    UIView *tempView = [self.scene1 snapshotViewAfterScreenUpdates:NO];
    [tempView setFrame:self.scene1.frame];
    [tempView setClipsToBounds:YES];
    [tempView.layer setCornerRadius:5.0];
    [self.view addSubview:tempView];
    [self.scene1 removeFromSuperview];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
        [tempView setFrame:CGRectMake(60, 60, tempView.frame.size.width-120, tempView.frame.size.height-120)];
    } completion:^(BOOL completed) {
        [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:0 animations:^{
            [tempView setFrame:CGRectMake(-(tempView.frame.size.width + 60), 60, tempView.frame.size.width, tempView.frame.size.height)];
            [tempSecond setFrame:CGRectMake(60, 60, tempSecond.frame.size.width, tempSecond.frame.size.height)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
                [tempSecond setFrame:self.second.view.frame];
                [tempView removeFromSuperview];
            } completion:^(BOOL finished) {
                [self.second.view setHidden:NO];
                [tempSecond removeFromSuperview];
            }];
        }];
    }];
    [self.view removeGestureRecognizer:self.oldTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
