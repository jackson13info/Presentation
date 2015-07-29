//
//  PostView.m
//  Presentation
//
//  Created by Jackson Taylor on 7/13/15.
//  Copyright (c) 2015 WillowTree Apps. All rights reserved.
//

#import "PostView.h"

@interface PostView ()

@property (nonatomic, retain) UIView *imageView;
@property (nonatomic, retain) UIView *titleView;
@property (nonatomic, retain) UIView *contentViewLineOne;
@property (nonatomic, retain) UIView *contentViewLineTwo;
@property (nonatomic, retain) UIView *contentViewLineThree;

@end

@implementation PostView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
        [self setClipsToBounds:YES];
        
        self.titleView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 5, 5)];
        [self.titleView setClipsToBounds:YES];
        [self.titleView.layer setCornerRadius:3.0];
        [self.titleView setBackgroundColor:[UIColor colorWithRed:0.788 green:0.788 blue:0.788 alpha:1] /*#c9c9c9*/];
        [self.titleView setAlpha:0.0];
        [self addSubview:self.titleView];
        
        self.contentViewLineOne = [[UIView alloc] initWithFrame:CGRectMake(20, 40, 5, 5)];
        [self.contentViewLineOne setClipsToBounds:YES];
        [self.contentViewLineOne.layer setCornerRadius:3.0];
        [self.contentViewLineOne setBackgroundColor:[UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1] /*#eeeeee*/];
        [self.contentViewLineOne setAlpha:0.0];
        [self addSubview:self.contentViewLineOne];
        
        self.contentViewLineTwo = [[UIView alloc] initWithFrame:CGRectMake(20, 60, 5, 5)];
        [self.contentViewLineTwo setClipsToBounds:YES];
        [self.contentViewLineTwo.layer setCornerRadius:3.0];
        [self.contentViewLineTwo setBackgroundColor:[UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1] /*#eeeeee*/];
        [self.contentViewLineTwo setAlpha:0.0];
        [self addSubview:self.contentViewLineTwo];
        
        self.contentViewLineThree = [[UIView alloc] initWithFrame:CGRectMake(20, 80, 5, 5)];
        [self.contentViewLineThree setClipsToBounds:YES];
        [self.contentViewLineThree.layer setCornerRadius:3.0];
        [self.contentViewLineThree setBackgroundColor:[UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1] /*#eeeeee*/];
        [self.contentViewLineThree setAlpha:0.0];
        [self addSubview:self.contentViewLineThree];
        
        self.imageView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, frame.size.height-20, frame.size.height-20)];
        [self.imageView setClipsToBounds:YES];
        [self.imageView.layer setCornerRadius:10.0];
        [self.imageView setBackgroundColor:[UIColor colorWithRed:0.788 green:0.788 blue:0.788 alpha:1] /*#c9c9c9*/];
        [self.imageView setAlpha:0.0];
        [self addSubview:self.imageView];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    [self.imageView setFrame:CGRectMake(10, 10, self.frame.size.height-20, self.frame.size.height-20)];
    [self.titleView setFrame:CGRectMake(self.frame.size.height, 10, self.frame.size.width-(self.frame.size.height + 10), 15)];
    [self.contentViewLineOne setFrame:CGRectMake(self.frame.size.height + 10, 40, self.frame.size.width-(self.frame.size.height + 20), 10)];
    [self.contentViewLineTwo setFrame:CGRectMake(self.frame.size.height + 10, 60, self.frame.size.width-(self.frame.size.height + 20), 10)];
    [self.contentViewLineThree setFrame:CGRectMake(self.frame.size.height + 10, 80, self.frame.size.width-(self.frame.size.height + 20), 10)];
}

- (void)animateLinesIn {
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:0 animations:^{
        [self.titleView setFrame:CGRectMake(10, 10, self.frame.size.width-20, 15)];
        [self.titleView setAlpha:1.0];
        [self.contentViewLineOne setFrame:CGRectMake(20, 40, self.frame.size.width-30, 10)];
        [self.contentViewLineOne setAlpha:1.0];
        [self.contentViewLineTwo setFrame:CGRectMake(20, 60, self.frame.size.width-30, 10)];
        [self.contentViewLineTwo setAlpha:1.0];
        [self.contentViewLineThree setFrame:CGRectMake(20, 80, self.frame.size.width-30, 10)];
        [self.contentViewLineThree setAlpha:1.0];
    } completion:nil];
}

- (void)animateImageIn {
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:0 animations:^{
        [self.titleView setFrame:CGRectMake(self.frame.size.height, 10, self.frame.size.width-(self.frame.size.height + 10), 15)];
        [self.contentViewLineOne setFrame:CGRectMake(self.frame.size.height + 10, 40, self.frame.size.width-(self.frame.size.height + 20), 10)];
        [self.contentViewLineTwo setFrame:CGRectMake(self.frame.size.height + 10, 60, self.frame.size.width-(self.frame.size.height + 20), 10)];
        [self.contentViewLineThree setFrame:CGRectMake(self.frame.size.height + 10, 80, self.frame.size.width-(self.frame.size.height + 20), 10)];
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:0.0 animations:^{
        [self.imageView setAlpha:1.0];
    } completion:nil];
}

- (void)setIndentLevel:(NSInteger)indentLevel {
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:0 animations:^{
        CGFloat x = 10 + (20 * indentLevel);
        [self.titleView setFrame:CGRectMake(x, 10, self.frame.size.width - (10 + x), 15)];
        [self.contentViewLineOne setFrame:CGRectMake(x + 10, 40, self.frame.size.width-(x + 20), 10)];
        [self.contentViewLineTwo setFrame:CGRectMake(x + 10, 60, self.frame.size.width-(x + 20), 10)];
        [self.contentViewLineThree setFrame:CGRectMake(x + 10, 80, self.frame.size.width-(x + 20), 10)];
    } completion:nil];
}

@end
