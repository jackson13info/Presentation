//
//  FifthViewController.m
//  Presentation
//
//  Created by Jackson Taylor on 7/28/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "FifthViewController.h"
#import "SixthViewController.h"

@interface FifthViewController ()

@property (nonatomic, retain) UITapGestureRecognizer *oldTap;

// Slide One
@property (nonatomic, retain) UIImageView *apiImage;

//Slide Four
@property (nonatomic, retain) NSMutableArray *documents;

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:1] /*#00ffff*/];
    
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(one)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)one {
    self.apiImage= [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2.0)-1, (self.view.frame.size.height/2.0)-1, 2, 2)];
    [self.apiImage setContentMode:UIViewContentModeScaleAspectFit];
    [self.apiImage setImage:[UIImage imageNamed:@"api"]];
    [self.view addSubview:self.apiImage];
    
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
        [self.apiImage setFrame:CGRectMake((self.view.frame.size.width/2.0)-200, (self.view.frame.size.height/2.0)-200, 400, 400)];
    } completion:^(BOOL completed) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(two)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
    
    
    
}

- (void)two {
    [UIView animateWithDuration:0.5 animations:^{
        [self.view setBackgroundColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.86 alpha:1]];
    }];
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(three)];
    [self.view addGestureRecognizer:self.oldTap];
}


- (void)three {
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
        [self.apiImage setFrame:CGRectMake(self.view.frame.size.width+50, (self.view.frame.size.height/2.0)-200, 400, 400)];
    } completion:^(BOOL completed) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(four)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)four {
    
    self.documents = [[NSMutableArray alloc] init];
    
    CGFloat y = 10;
    CGFloat x = 10;
    CGFloat xDelay = 0.0;
    CGFloat yDelay = 0.0;
    CGFloat height = 220;
    CGFloat width = 170;
    for (int index = 0; index < 30; index++) {
        UIView *document = [[UIView alloc] initWithFrame:CGRectMake(x+(width/2.0), y+(height/2.0), 2, 2)];
        [document setBackgroundColor:[UIColor whiteColor]];
        [document.layer setBorderWidth:0.5];
        [document.layer setBorderColor:[UIColor colorWithWhite:0.95 alpha:1.0].CGColor];
        [self.view addSubview:document];
        
        [self.documents addObject:document];
        
        [UIView animateWithDuration:0.5 delay:(xDelay + yDelay) usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:0 animations:^{
            [document setFrame:CGRectMake(x, y, width, height)];
        } completion:^(BOOL finished) {
            
        }];
        
        if (index % 6 == 0 && index != 0) {
            x = 10;
            y = y + (height + 20);
            xDelay = yDelay;
            yDelay += 0.1;
        }
        else {
            x += (width + 20);
            xDelay += 0.1;
        }
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(five)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)five {
    for (int index = 1; index < self.documents.count; index++) {
        UIView *document = [self.documents objectAtIndex:index];
        
        [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
            [document setFrame:CGRectMake(document.frame.origin.x, self.view.frame.size.height + 100, document.frame.size.width, document.frame.size.height)];
            [document setTransform:CGAffineTransformMakeRotation(M_PI_4 * ((double)(arc4random() % 100) / 100.0))];
        } completion:^(BOOL finished) {
            [document removeFromSuperview];
        }];
    }
    
    [self.view removeGestureRecognizer:self.oldTap];
    self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(six)];
    [self.view addGestureRecognizer:self.oldTap];
}

- (void)six {
    UIView *document = [self.documents firstObject];
    CGRect frame = document.frame;
    frame.size.width *= 2.5;
    frame.size.height *= 2.5;
    frame.origin.x = (self.view.frame.size.width/2.0)-(frame.size.width/2.0);
    frame.origin.y = (self.view.frame.size.height/2.0)-(frame.size.height/2.0);
    
    [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
        [document setFrame:frame];
    } completion:^(BOOL finished) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seven)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)seven {
    UIView *document = [self.documents firstObject];
    CGRect frame = document.frame;
    frame.size.width = 800;
    frame.size.height = 500;
    frame.origin.x = (self.view.frame.size.width/2.0)-(frame.size.width/2.0);
    frame.origin.y = (self.view.frame.size.height/2.0)-(frame.size.height/2.0);
    
    [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
        [document setFrame:frame];
    } completion:^(BOOL finished) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eight)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)eight {
    UIView *document = [self.documents firstObject];
    
    [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
        [document setBackgroundColor:[UIColor blackColor]];
        [document.layer setBorderWidth:0.0];
    } completion:^(BOOL finished) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nine)];
        [self.view addGestureRecognizer:self.oldTap];
    }];

}

- (void)nine {
    UIView *document = [self.documents firstObject];
    CGRect frame = document.frame;
    frame.size.width = 750;
    frame.size.height = 50;
    frame.origin.x = (self.view.frame.size.width/2.0)-(frame.size.width/2.0);
    frame.origin.y = (self.view.frame.size.height/2.0)-(frame.size.height/2.0);
    
    [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
        [document setBackgroundColor:[UIColor colorWithRed:1 green:0.639 blue:0.184 alpha:1] /*#ffa32f*/];
        [document setFrame:frame];
    } completion:^(BOOL finished) {
        [self.view removeGestureRecognizer:self.oldTap];
        self.oldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ten)];
        [self.view addGestureRecognizer:self.oldTap];
    }];
}

- (void)ten {
    UIView *document = [self.documents firstObject];
    CGRect frame = document.frame;
    frame.size.width = frame.size.width * 20;
    frame.size.height = frame.size.height * 20;
    frame.origin.x = (self.view.frame.size.width/2.0)-(frame.size.width/2.0);
    frame.origin.y = (self.view.frame.size.height/2.0)-(frame.size.height/2.0);
    
    [UIView animateWithDuration:0.9 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.7 options:0 animations:^{
        [document setFrame:frame];
    } completion:^(BOOL finished) {
        [self.documents removeAllObjects];
        SixthViewController *controller = [[SixthViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:controller animated:NO completion:nil];
    }];
}

@end
