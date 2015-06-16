//
//  UIButton+Spec.m
//  Carrierwave
//
//  Created by Patryk Kaczmarek on 25.02.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

#import "UIButton+Spec.h"

@implementation UIButton (Spec)

- (void)specsSimulateTap {
    for (id target in [self allTargets]) {
        for (NSString *stringSEL in [self actionsForTarget:target forControlEvent:UIControlEventTouchUpInside]) {
            [target performSelector:NSSelectorFromString(stringSEL) withObject:self afterDelay:0];
        }
    }
}


@end
