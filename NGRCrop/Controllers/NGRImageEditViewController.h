//
//  NGRImageEditViewController.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import UIKit;

#import "NGRScalableView.h"
#import "NGRHeaderFooterView.h"
#import "NGRRatioItem.h"

@class NGRImageAsset;
@protocol NGRImageEditViewControllerDelegate;

/**
 *  The NGRImageCropViewController provides an easy user interface to move and
 *  crop an image asset, similar to the build-in Photos app.
 */
IB_DESIGNABLE @interface NGRImageEditViewController : UIViewController

/**
 *  Creates the edit view controller with an image asset.
 *
 *  @param asset The image asset to be cropped.
 *
 *  @return An initialized receiver.
 */
- (instancetype)initWithImageAsset:(NGRImageAsset *)asset NS_DESIGNATED_INITIALIZER;

/**
 *  The original image asset to be edited.
 */
@property (strong, nonatomic) NGRImageAsset *imageAsset;

/**
 *  The scalable crop view that crops portion of the screen.
 */
@property (weak, nonatomic, readonly) NGRScalableView *cropView;

/**
 *  The crop view controller's delegate object.
 */
@property (weak, nonatomic) IBOutlet id<NGRImageEditViewControllerDelegate> delegate;

/**
 *  An array populated with NGRRatioItem objects used to display UIAlertController.
 */
@property (strong, nonatomic, readonly) NSArray *ratioItemList;

/**
 *  Adds an item to list which populates UIAlertController actions. Use it to add your own ratios to crop view should scale.
 *
 *  @param ratioItem An item added to list. Provide ratio and title as well.
 */
- (void)addRatioItemToList:(NGRRatioItem *)ratioItem;

/**
 *  Header view layouted at the top of NGRImageEditViewController's view. By default returns UILabel with short info.
 */
- (UIView *)headerView;

/**
 *  Footer view layouted at the bottom of NGRImageEditViewController's view. By default returns UIView with events buttons.
 */
- (UIView *)footerView;

@end

@protocol NGRImageEditViewControllerDelegate <NSObject>

@optional

/**
 *  Called when the user finishes editing the image.
 *
 *  @param controller The edit view controller sending the delegate message.
 *  @param asset      The new image asset representing the edited image.
 */
- (void)imageEditViewController:(NGRImageEditViewController *)controller didFinishEditingWithImageAsset:(NGRImageAsset *)asset;

/**
 *  Called when the user cancels editing the image.
 *
 *  @param controller The edit view controller sending the delegate message.
 */
- (void)imageEditViewControllerDidCancelEditing:(NGRImageEditViewController *)controller;

/**
 *  Asks the delegate for a view to display as header view (at the top of NGRImageEditViewController's view).
 *  If not implemented, the default one will be used. Pass nil if header view should not be initialized.
 *  To create a view with communication feature, sublass NGRHeaderFooterView and use eventMessenger to post messages.
 *
 *  @param controller The edit view controller which will display header view.
 */
- (UIView *)viewForHeaderInImageEditViewController:(NGRImageEditViewController *)controller;

/**
 *  Asks the delegate for a view to display as footer view (at the bottom of NGRImageEditViewController's view).
 *  If not implemented, the default one will be used. Pass nil if footer view should not be initialized.
 *  To create a view with communication feature, sublass NGRHeaderFooterView and use eventMessenger to post messages.
 *
 *  @param controller The edit view controller which will display footer view.
 */
- (UIView *)viewForFooterInImageEditViewController:(NGRImageEditViewController *)controller;

/**
 *  Allows the delegate to specify header view height. If this method is implemented, the value it returns overrides default value which is equal to 20 points.
 *
 *  @param controller The edit view controller sending the delegate message.
 */
- (CGFloat)heightForHeaderInImageEditViewController:(NGRImageEditViewController *)controller;

/**
 *  Allows the delegate to specify footer height. If this method is implemented, the value it returns overrides default value which is equal to 60 points.
 *
 *  @param controller The edit view controller sending the delegate message.
 */
- (CGFloat)heightForFooterInImageEditViewController:(NGRImageEditViewController *)controller;

@end

