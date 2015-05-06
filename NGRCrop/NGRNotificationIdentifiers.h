//
//  NGRNofgificationIdentifiers.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#ifndef NGRCrop_NGRNotificationIdentifiers_h
#define NGRCrop_NGRNotificationIdentifiers_h

// Notifications observed by NGRImageEditViewController:
static NSString *const NGRImageEditViewControllerWillShowRatioAlertControllerNotification = @"NGRImageEditViewControllerWillShowRatioAlertControllerNotification";
static NSString *const NGRImageEditViewControllerWillCancelEditingNotification = @"NGRImageEditViewControllerWillCancelEditingNotification";
static NSString *const NGRImageEditViewControllerWillFinishEditingWithImageAssetNotification = @"NGRImageEditViewControllerWillFinishEditingWithImageAssetNotification";

// Notifications observed by NGRTransformViewController:
static NSString *const NGRTransformViewControllerWillResetTransformationNotification = @"NGRTransformViewControllerWillResetTransformationNotification";

#endif
