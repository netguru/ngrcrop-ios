//
//  NGREventMessenger.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import Foundation;

/**
 *  Event messenger is responsible for posting messages to imageEditViewController or transformViewController.
 */

@interface NGREventMessenger : NSObject

/**
 *  Tells NGRImageEditViewController to perform imageEditViewControllerDidCancelEditing: delegate.
 */
- (void)postCancelMessage;

/**
 *  Tells NGRImageEditViewController to perform imageEditViewController:didFinishEditingWithImageAsset: delegate.
 */
- (void)postDoneMessage;

/**
 *  Tells NGRImageEditViewController to show UIAlertController with ratio selection.
 */
- (void)postShowRatioSheetMessage;

/**
 *  Tells NGRTransformViewController to reset all transformation made by user.
 */
- (void)postResetTransformationMessage;

@end
