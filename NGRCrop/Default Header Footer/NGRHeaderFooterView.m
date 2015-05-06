//
//  NGRHeaderFooterView.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRHeaderFooterView.h"

@implementation NGRHeaderFooterView

- (instancetype)init {
    self = [super init];
    if (self) {
        _messenger = [[NGREventMessenger alloc] init];
    }
    return self;
}

@end

