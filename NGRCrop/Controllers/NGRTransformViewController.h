//
//  NGRTransformViewController.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import UIKit;

@class NGRScalableView;

@interface NGRTransformViewController : UIViewController

/**
 *  Sets image used in transformation.
 *
 *  @param image Image to transform.
 */
- (void)setImage:(UIImage *)image;

/**
 *  A crop view which declares bounds for croping image.
 *
 *  @return Instance of NGRScalableView.
 */
- (NGRScalableView *)cropView;

/**
 *  Crops an image within crop view.
 *
 *  @return Cropped image.
 */
- (UIImage *)cropImage;

@end
