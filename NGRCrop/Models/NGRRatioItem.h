//
//  NGRRatioItem.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import UIKit;

@interface NGRRatioItem : NSObject

- (instancetype)initWithTitle:(NSString *)title ratio:(CGFloat)ratio NS_DESIGNATED_INITIALIZER;

@property (strong, nonatomic, readonly) NSString *title;
@property (assign, nonatomic, readonly) CGFloat ratio;

@end
