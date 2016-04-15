//
//  DemoFrameworkPublicView.m
//  DemoFramework
//
//  Created by Claris on 2016.04.15.Friday.
//  Copyright © 2016 tickCoder. All rights reserved.
//

#import "DemoFrameworkPublicView.h"
#import "DemoFrameworkPrivateShow.h"

@interface DemoFrameworkPublicView ()
@property (nonatomic, strong) DemoFrameworkPrivateShow *privateShow;
@end

@implementation DemoFrameworkPublicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)init {
    self = [super init];
    if (self) {
        [self _demo_init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _demo_init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _demo_init];
    }
    return self;
}

- (void)_demo_init {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    _showLabel = [[UILabel alloc] init];
    _showLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _showLabel.numberOfLines = 0;
    _showLabel.backgroundColor = [UIColor brownColor];
    [self addSubview:_showLabel];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_showLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_showLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *leadConstraint = [NSLayoutConstraint constraintWithItem:_showLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15];
    [self addConstraints:@[centerXConstraint, centerYConstraint, leadConstraint]];
    
    _privateShow = [[DemoFrameworkPrivateShow alloc] init];
    _showLabel.text = [_privateShow somethingPrivate];
}

@end
