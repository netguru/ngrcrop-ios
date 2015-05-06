//
//  NGRHeaderView.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRHeaderView.h"

@implementation NGRHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.text = NSLocalizedString(@"Tap twice anywhere to lock/unlock crop rectangle", nil);
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:13.f];
    }
    return self;
}

@end
