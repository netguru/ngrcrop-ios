//
//  NGRTransformView.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import UIKit;

#import "NGRScalableView.h"

@interface NGRTransformView : UIView

/**
 *  A crop declaring bounds for croping image.
 */
@property (strong, nonatomic, readonly) NGRScalableView *cropView;

/**
 *  Holds image which will be transformed and cropped.
 */
@property (strong, nonatomic, readonly) UIImageView *imageView;

/**
 *  Indicates whether tapped view is crop view or not.
 */
@property (assign, nonatomic) BOOL allowToUseGestures;

@end
