//
//  NGRAlertController.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRAlertController.h"
#import "NGRRatioItem.h"

@interface NGRAlertController ()

@property (copy, nonatomic) NGRActionHandler actionHandler;
@property (strong, nonatomic) NSArray *list;

@end

@implementation NGRAlertController

- (instancetype)initWithList:(NSArray *)list actionHandler:(NGRActionHandler)handler {
    self = [[self class] alertControllerWithTitle:NSLocalizedString(@"Select crop rectangle ratio:", nil) message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    if (self) {
        _actionHandler = handler;
        _list = list;
        
        for (NGRRatioItem *item in list) {
            [self addActionWithTitle:item.title];
        }
        
        [self addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:nil]];
    }
    return self;
}

- (void)addActionWithTitle:(NSString *)title {
    
    [self addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (self.actionHandler) {
            self.actionHandler([self ratioForTitle:title]);
        }
    }]];
}

- (CGFloat)ratioForTitle:(NSString *)title {
    for (NGRRatioItem *item in self.list) {
        if ([item.title isEqualToString:title]) {
            return item.ratio;
        }
    }
    return 0.f;
}

@end
