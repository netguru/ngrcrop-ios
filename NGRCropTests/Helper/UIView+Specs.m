//
//  UIView+Specs.m
//  Carrierwave
//
//  Created by Patryk Kaczmarek on 25.02.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

#import "UIView+Specs.h"

@implementation UIView (Specs)

- (UIButton *)specsFindButtonWithTitle:(NSString *)title {
    for (id object in self.subviews) {
        if ([object isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)object;
            if ([[button titleForState:UIControlStateNormal] isEqualToString:title]) {
                return button;
            }
        }
    }
    return nil;
}

@end
