//
//  NGREventMessenger.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGREventMessenger.h"
#import "NGRNotificationIdentifiers.h"

@implementation NGREventMessenger

- (void)postCancelMessage {
    [self postNotificationWithName:NGRImageEditViewControllerWillCancelEditingNotification];
}

- (void)postDoneMessage {
    [self postNotificationWithName:NGRImageEditViewControllerWillFinishEditingWithImageAssetNotification];
}

- (void)postShowRatioSheetMessage {
    [self postNotificationWithName:NGRImageEditViewControllerWillShowRatioAlertControllerNotification];
}

- (void)postResetTransformationMessage {
    [self postNotificationWithName:NGRTransformViewControllerWillResetTransformationNotification];
}

#pragma mark - Private methods

- (void)postNotificationWithName:(NSString *)name {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
}

@end
