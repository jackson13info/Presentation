//
//  ThirdViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 7/14/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "ThirdViewController.h"
#import "PostView.h"
#import "FourthViewController.h"

@interface ThirdViewController ()

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

//Scene One
@property (nonatomic, retain) UIImageView *browserImage;
@property (nonatomic, retain) UIImageView *reactImage;

//Scene Two
@property (nonatomic, retain) UILabel *addressLabel;

//Scene Three
@property (nonatomic, retain) UILabel *quickOverView;
@property (nonatomic, retain) NSMutableArray *posts;

@property (nonatomic, retain) CAShapeLayer *greenCircle;
@property (nonatomic, retain) CAShapeLayer *purpleCircle;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.56 green:0.27 blue:0.68 alpha:1]];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(one)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)one {
    self.browserImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, (self.view.frame.size.height/2.0)-300, 700, 600)];
    [self.browserImage setContentMode:UIViewContentModeScaleAspectFit];
    [self.browserImage setBackgroundColor:[UIColor clearColor]];
    [self.browserImage setImage:[UIImage imageNamed:@"browser_chrome"]];
    [self.view addSubview:self.browserImage];
    
    [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:0 animations:^{
        [self.browserImage setFrame:CGRectMake((self.view.frame.size.width/2.0)-350, (self.view.frame.size.height/2.0)-300, 700, 600)];
    } completion:^(BOOL finished) {
        self.reactImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)-500, (self.view.frame.size.height/2.0)-500, 1000, 1000)];
        [self.reactImage setContentMode:UIViewContentModeScaleAspectFit];
        [self.reactImage setBackgroundColor:[UIColor clearColor]];
        [self.reactImage setImage:[UIImage imageNamed:@"react"]];
        [self.reactImage setAlpha:0.0];
        [self.view addSubview:self.reactImage];
        
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.8 options:0 animations:^{
            [self.reactImage setFrame:CGRectMake((self.view.frame.size.width/2.0)-150, (self.view.frame.size.height/2.0)-100, 300, 300)];
            [self.reactImage setAlpha:1.0];
        } completion:^(BOOL finished) {
            
        }];
    }];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(two)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)two {
    [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:0 animations:^{
        [self.browserImage setFrame:CGRectMake(0, (self.view.frame.size.height/2.0)-300, self.view.frame.size.width, 900)];
        [self.reactImage setAlpha:0.0];
    } completion:^(BOOL finished) {
        self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 210, 300, 40)];
        [self.addressLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:30.0]];
        [self.addressLabel setTextColor:[UIColor lightGrayColor]];
        [self.browserImage addSubview:self.addressLabel];
        
        NSString *label = @"http://www.readit.com";
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            for (int index = 0; index <= label.length; index++) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.addressLabel setText:[label substringToIndex:index]];
                });
                [NSThread sleepForTimeInterval:0.01];
            }
        });
        
        
    }];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(three)];
    [self.view addGestureRecognizer:self.oldTap];
    
}

- (void)three {
    
    self.quickOverView = [[UILabel alloc] initWithFrame:self.view.bounds];
    [self.quickOverView setBackgroundColor:[UIColor clearColor]];
    [self.quickOverView setTextAlignment:NSTextAlignmentCenter];
    [self.quickOverView setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:60.0]];
    [self.quickOverView setTextColor:[UIColor whiteColor]];
    [self.quickOverView setText:@"Quick Overview"];
    [self.view insertSubview:self.quickOverView belowSubview:self.browserImage];
    
    [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:0 animations:^{
        [self.browserImage setFrame:CGRectMake(0, self.view.frame.size.height + 100, self.view.frame.size.width, 900)];
        [self.addressLabel setAlpha:0.0];
    } completion:^(BOOL finished) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(four)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)four {
    [UIView animateWithDuration:0.3 animations:^{
        [self.quickOverView setAlpha:0.0];
    }];
    self.posts = [[NSMutableArray alloc] init];
    CGRect startFrame = CGRectMake(((self.view.frame.size.width)/2.0)-280.0, 47, 560, 100);
    for (int index = 0; index < 7; index++) {
        CGRect finalFrame = CGRectMake(((self.view.frame.size.width)/2.0)-280.0, 47 + (105 * index), 560, 100);
        PostView *post = [[PostView alloc] initWithFrame:startFrame];
        [post setAlpha:0.0];
        [self.view addSubview:post];
        [self.posts addObject:post];
        
        [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.4 options:0 animations:^{
            [post setFrame:finalFrame];
            [post setAlpha:1.0];
        } completion:^(BOOL completed) {
            
        }];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(five)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)five {
    for (int index = 0; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [post animateLinesIn];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(six)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)six {
    for (int index = 0; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [post animateImageIn];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seven)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)seven {
    for (int index = 0; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        if (index == 0) {
            [UIView animateWithDuration:0.5 delay:0.1 * index usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
                CGRect frame = post.frame;
                frame.size.width *= 1.5;
                frame.size.height *= 1.5;
                frame.origin.x = (self.view.frame.size.width/2.0) - (frame.size.width/2.0);
                frame.origin.y = (self.view.frame.size.height/2.0) - (frame.size.height/2.0);
                [post setFrame:frame];
            } completion:nil];
        }
        else {
            [UIView animateWithDuration:0.5 delay:0.1 * index usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
                [post setFrame:CGRectMake(-post.frame.size.width - 50, post.frame.origin.y, post.frame.size.width, post.frame.size.height)];
            } completion:^(BOOL finished) {
                [post removeFromSuperview];
                [self.posts removeObject:post];
            }];
        }
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eight)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)eight {
    PostView *bigPost = [self.posts firstObject];
    CGRect startFrame = CGRectMake(((self.view.frame.size.width)/2.0) - (bigPost.frame.size.width * 0.45), bigPost.frame.origin.y, bigPost.frame.size.width * 0.9, bigPost.frame.size.height * 0.9);
    for (int index = 0; index < 3; index++) {
        CGRect finalFrame = CGRectMake(((self.view.frame.size.width)/2.0) - (bigPost.frame.size.width * 0.45), bigPost.frame.origin.y + bigPost.frame.size.height + 5 + (((bigPost.frame.size.height * 0.9) + 5) * index), bigPost.frame.size.width * 0.9, bigPost.frame.size.height * 0.9);
        PostView *post = [[PostView alloc] initWithFrame:startFrame];
        [post setAlpha:0.0];
        [self.view addSubview:post];
        [self.posts addObject:post];
        
        [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.4 options:0 animations:^{
            [post setFrame:finalFrame];
            [post setAlpha:1.0];
        } completion:^(BOOL completed) {
            [post animateLinesIn];
        }];
    }
    [self.view bringSubviewToFront:bigPost];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nine)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)nine {
    PostView *bigPost = [self.posts firstObject];
    for (int index = 1; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        CGRect startFrame = CGRectMake(post.frame.origin.x, bigPost.frame.origin.y, post.frame.size.width, post.frame.size.height);
        [UIView animateWithDuration:0.5 delay:0.1 * index usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
            [post setFrame:startFrame];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
                [post setFrame:CGRectMake(startFrame.origin.x, self.view.frame.size.height + 50, startFrame.size.width, startFrame.size.height)];
                if (index == 1) {
                    [bigPost setFrame:CGRectMake(bigPost.frame.origin.x, self.view.frame.size.height + 50, bigPost.frame.size.width, bigPost.frame.size.height)];
                }
            } completion:^(BOOL finished) {
                [post removeFromSuperview];
                [self.posts removeObject:post];
                if (index == 1) {
                    [bigPost removeFromSuperview];
                }
            }];
        }];
    }
    
    self.greenCircle = [CAShapeLayer layer];
    self.greenCircle.fillColor = [UIColor colorWithRed:0 green:0.63 blue:0.53 alpha:1].CGColor;
    self.greenCircle.backgroundColor = [UIColor clearColor].CGColor;
    self.greenCircle.frame = CGRectMake((self.view.frame.size.width/2.0)-60, (self.view.frame.size.height/2.0)-30, 60, 60);
    self.greenCircle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 60, 60)].CGPath;
    self.greenCircle.anchorPoint = CGPointMake(0.0, 0.5);
    [self.view.layer insertSublayer:self.greenCircle below:((PostView *)[self.posts lastObject]).layer];
    
    self.purpleCircle = [CAShapeLayer layer];
    self.purpleCircle.fillColor = [UIColor colorWithRed:0.56 green:0.27 blue:0.68 alpha:1].CGColor;
    self.purpleCircle.backgroundColor = [UIColor clearColor].CGColor;
    self.purpleCircle.frame = CGRectMake((self.view.frame.size.width/2.0)-30.0, (self.view.frame.size.height/2.0)-30, 60, 60);
    self.purpleCircle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 60, 60)].CGPath;
    self.purpleCircle.anchorPoint = CGPointMake(1.0, 0.5);
    [self.view.layer insertSublayer:self.purpleCircle atIndex:0];

    [self.purpleCircle setValue:@(120.0) forKeyPath:@"transform.scale"];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ten)];
    [self.view addGestureRecognizer:self.oldTap];
    
}

- (void)ten {
    
    [self performSelector:@selector(eleven) withObject:nil afterDelay:0.3];
    
    CABasicAnimation *position = [CABasicAnimation animationWithKeyPath:@"position.x"];
    position.fromValue = @((self.view.frame.size.width/2.0) - 30.0);
    position.toValue = @((self.view.frame.size.width/2.0));
    position.duration = 0.3;
    position.removedOnCompletion = NO;
    position.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @(1);
    scale.toValue = @(200);
    scale.duration = 0.5;
    scale.removedOnCompletion = NO;
    scale.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[position, scale]];
    [group setDuration:0.8];
    [group setFillMode:kCAFillModeForwards];
    [group setRemovedOnCompletion:NO];
    [self.greenCircle addAnimation:group forKey:@"group"];
}

- (void)eleven {
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0.63 blue:0.53 alpha:1]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CABasicAnimation *position = [CABasicAnimation animationWithKeyPath:@"position.x"];
        position.fromValue = @((self.view.frame.size.width/2.0));
        position.toValue = @((self.view.frame.size.width/2.0) - 30.0);
        position.duration = 0.3;
        position.removedOnCompletion = NO;
        position.fillMode = kCAFillModeForwards;
        
        CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scale.fromValue = @(200);
        scale.toValue = @(1);
        scale.duration = 0.5;
        scale.removedOnCompletion = NO;
        scale.fillMode = kCAFillModeForwards;
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        [group setAnimations:@[position, scale]];
        [group setDuration:0.7];
        [group setDelegate:self];
        [group setFillMode:kCAFillModeForwards];
        [group setRemovedOnCompletion:NO];
        [self.purpleCircle addAnimation:group forKey:@"group"];
    });
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        FourthViewController *controller = [[FourthViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:controller animated:NO completion:nil];
    }];
    CABasicAnimation *position = [CABasicAnimation animationWithKeyPath:@"opacity"];
    position.fromValue = @(1.0);
    position.toValue = @(0.0);
    position.duration = 0.3;
    position.removedOnCompletion = NO;
    position.fillMode = kCAFillModeForwards;
    [self.purpleCircle addAnimation:position forKey:@"op"];
    [CATransaction commit];
}

@end
