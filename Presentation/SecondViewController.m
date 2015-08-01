//
//  SecondViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 7/13/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "SecondViewController.h"
#import "PostView.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@property (nonatomic, retain) UIImageView *redditImageView;

//Scene One
@property (nonatomic, retain) UIView *redView;

//Screne Two
@property (nonatomic, retain) UIImageView *iPhoneImage;

//Screen Three
@property (nonatomic, retain) NSMutableArray *posts;

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

@end

@implementation SecondViewController


/*
 * When I first started things were hectic
 * came in late
 * they didn't know what I should do
 * they said practice
 * and my first practice was using reddit
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.96 green:0.64 blue:0.36 alpha:1]];
    
    self.redditImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)-150, (self.view.frame.size.height/2.0)-150, 300, 300)];
    [self.redditImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.redditImageView setImage:[UIImage imageNamed:@"reddit"]];
    [self.redditImageView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.redditImageView];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(one)];
    [self.view addGestureRecognizer:self.oldTap];
}

/*
 * So they said why not make a reddit client
 * for the iphone.
 * use some core data
 * table view
 * auto layout
 * these things called storyboards
 * don't like drag and drop
 */
- (void)one {
    self.redView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)-140, (self.view.frame.size.height/2.0)-140, 280, 280)];
    [self.redView setBackgroundColor:[UIColor colorWithRed:0.96 green:0.36 blue:0.36 alpha:1]];
    [self.redView setClipsToBounds:YES];
    [self.redView.layer setCornerRadius:140.0];
    [self.redView setAlpha:0.0];
    [self.view addSubview:self.redView];
    
    
    self.iPhoneImage = [[UIImageView alloc] initWithFrame:CGRectMake(((self.view.frame.size.width-100)/2.0)-100.0, 100, 200, self.view.frame.size.height-300)];
    [self.iPhoneImage setContentMode:UIViewContentModeScaleAspectFit];
    [self.iPhoneImage setImage:[UIImage imageNamed:@"iPhone"]];
    [self.iPhoneImage setAlpha:0.0];
    [self.redView addSubview:self.iPhoneImage];
    
    
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.6 options:0 animations:^{
        [self.redView setAlpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:0 animations:^{
            [self.redView setFrame:CGRectMake((self.view.frame.size.width/2.0)-140, 50, 280, self.view.frame.size.height-100)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:0 animations:^{
                [self.redView setFrame:CGRectMake(50, 50, self.view.frame.size.width-100, self.view.frame.size.height-100)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:0 animations:^{
                    [self.iPhoneImage setAlpha:1.0];
                    [self.iPhoneImage setFrame:CGRectMake(((self.view.frame.size.width-100)/2.0)-150.0, 50, 300, self.view.frame.size.height-200)];
                } completion:^(BOOL finished) {
                    [self.view removeGestureRecognizer:self.oldTap];
                    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(two)];
                    [self.view addGestureRecognizer:self.oldTap];
                }];
            }];
        }];
    }];
}

/*
 * So I started to work and made the basic feed that everyone sees
 * Simple table view
 * some nice auto layouts
 * and of course a storyboard
 */
- (void)two {
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.6 options:0 animations:^{
        [self.iPhoneImage setFrame:CGRectMake(((self.view.frame.size.width-100)/2.0)-250.0, -100, 500, self.redView.frame.size.height+200)];
    } completion:^(BOOL finished) {
        
        self.posts = [[NSMutableArray alloc] init];
        CGRect startFrame = CGRectMake(((self.view.frame.size.width-100)/2.0)-180.0, 47, 359, 100);
        for (int index = 0; index < 6; index++) {
            CGRect finalFrame = CGRectMake(((self.view.frame.size.width-100)/2.0)-180.0, 47 + (105 * index), 359, 100);
            PostView *post = [[PostView alloc] initWithFrame:startFrame];
            [post setAlpha:0.0];
            [self.redView addSubview:post];
            [self.posts addObject:post];
            
            [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.4 options:0 animations:^{
                [post setFrame:finalFrame];
                [post setAlpha:1.0];
            } completion:^(BOOL completed) {
                [post animateLinesIn];
            }];
        }
        
        [self.redView bringSubviewToFront:self.iPhoneImage];
        
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(three)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

/*
 * Then add in some AFNetworking and maybe you'll get 
 * a nice image.
 */
- (void)three {
    for (int index = 0; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [post animateImageIn];
    }
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(four)];
    [self.view addGestureRecognizer:self.oldTap];
    
}

/*
 * But then here came the challenging part. So every part of this used Core Data.
 * It essentially was a syncing mechanism to cache the most recent posts.
 */
- (void)four {
    for (int index = 0; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
            [post setFrame:CGRectMake(post.frame.origin.x, self.redView.frame.size.height + 100, post.frame.size.width, post.frame.size.height)];
            [post setTransform:CGAffineTransformMakeRotation(M_PI_4)];
        } completion:^(BOOL finished) {
            [post removeFromSuperview];
        }];
    }
    
    [self.posts removeAllObjects];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(five)];
    [self.view addGestureRecognizer:self.oldTap];
}

/*
 * And then came the comments.
 * These things were a little tricky from the start.
 * And they stumped me for a little while.
 */
- (void)five {
    CGRect startFrame = CGRectMake(((self.view.frame.size.width-100)/2.0)-180.0, 47, 359, 100);
    for (int index = 0; index < 6; index++) {
        CGRect finalFrame = CGRectMake(((self.view.frame.size.width-100)/2.0)-180.0, 47 + (105 * index), 359, 100);
        PostView *post = [[PostView alloc] initWithFrame:startFrame];
        [post setAlpha:0.0];
        [self.redView addSubview:post];
        [self.posts addObject:post];
        
        [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.4 options:0 animations:^{
            [post setFrame:finalFrame];
            [post setAlpha:1.0];
        } completion:^(BOOL completed) {
            [post animateLinesIn];
        }];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(six)];
    [self.view addGestureRecognizer:self.oldTap];
}

/*
 * It seemed like the way of storing the comments wasn't helping with core data
 * because people could respond to each other's comments creating this cascading structure.
 */
- (void)six {
    for (int index = 1; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [post setIndentLevel:index];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seven)];
    [self.view addGestureRecognizer:self.oldTap];
}

/*
 * But the database stored them like this.
 */
- (void)seven {
    for (int index = 0; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [post setIndentLevel:0];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eight)];
    [self.view addGestureRecognizer:self.oldTap];
}

/*
 * Luckily I was able to figure out how to do it after some drawing,
 * and now no matter what it will work with Reddit comments. Even if they
 * look like this.
 */
- (void)eight {
    for (int index = 1; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [post setIndentLevel:index];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nine)];
    [self.view addGestureRecognizer:self.oldTap];
}

/*
 * or even worse. This
 */
- (void)nine {
    NSArray *numbers = @[@(4),@(5),@(6),@(1),@(2),@(2),@(1)];
    for (int index = 0; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [post setIndentLevel:[numbers[index] integerValue]];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ten)];
    [self.view addGestureRecognizer:self.oldTap];
}

/*
 * So that was my first introduction to CoreData
 * and storyboards. In the end I learned that CoreData was actually
 * very nice but I still don't like storyboards haha.
 */
- (void)ten {
    for (int index = 0; index < self.posts.count; index++) {
        PostView *post = (PostView *)[self.posts objectAtIndex:index];
        [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
            [post setFrame:CGRectMake(post.frame.origin.x, self.redView.frame.size.height + 150, post.frame.size.width, post.frame.size.height)];
            [post setTransform:CGAffineTransformMakeRotation(M_PI_4)];
        } completion:^(BOOL finished) {
            [post removeFromSuperview];
        }];
    }
    
    [self.posts removeAllObjects];
    
    [UIView animateWithDuration:0.7 delay:0.5 usingSpringWithDamping:0.6 initialSpringVelocity:0.4 options:0 animations:^{
        [self.iPhoneImage setAlpha:0.0];
        [self.iPhoneImage setFrame:CGRectMake(((self.view.frame.size.width-100)/2.0)-400.0, -300, 800, self.redView.frame.size.height+400)];
    } completion:^(BOOL finished) {
        [self.iPhoneImage removeFromSuperview];
    }];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eleven)];
    [self.view addGestureRecognizer:self.oldTap];
}

/* And the transition */
- (void)eleven {
    UIView *purpleView = [[UIView alloc] initWithFrame:CGRectMake(0, -self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    [purpleView setBackgroundColor:[UIColor colorWithRed:0.56 green:0.27 blue:0.68 alpha:1]];
    [self.view addSubview:purpleView];
    
    [UIView animateWithDuration:0.3 animations:^{
        [purpleView setFrame:self.view.bounds];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            [purpleView setFrame:CGRectMake(0, -20, purpleView.frame.size.width, purpleView.frame.size.height)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.05 animations:^{
                [purpleView setFrame:CGRectMake(0, 0, purpleView.frame.size.width, purpleView.frame.size.height)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.05 animations:^{
                    [purpleView setFrame:CGRectMake(0, -10, purpleView.frame.size.width, purpleView.frame.size.height)];
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.05 animations:^{
                        [purpleView setFrame:CGRectMake(0, 0, purpleView.frame.size.width, purpleView.frame.size.height)];
                    } completion:^(BOOL finished) {
                        [self presentViewController:[[ThirdViewController alloc] initWithNibName:nil bundle:nil] animated:NO completion:nil];
                    }];
                }];
            }];
        }];
    }];
}

@end
