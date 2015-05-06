//
//  NGRAlertController.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import UIKit;

typedef void (^NGRActionHandler)(CGFloat ratio);

@interface NGRAlertController : UIAlertController

- (instancetype)initWithList:(NSArray *)list actionHandler:(NGRActionHandler)handler;

@end
