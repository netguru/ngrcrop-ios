//
//  NGRRatioItem.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//


#import "NGRRatioItem.h"

@implementation NGRRatioItem

- (instancetype)initWithTitle:(NSString *)title ratio:(CGFloat)ratio {
    self = [super init];
    if (self) {
        _title = title;
        _ratio = ratio;
    }
    return self;
}

@end
