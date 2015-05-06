//
//  NGRAssertTyoeUtils.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 05.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import CoreFoundation;
@import MobileCoreServices;
@import UIKit;

@interface NGRAssertTypeUtils : NSObject

/**
 *  Determines file extension from mime type.
 *
 *  @param mimeType Mime type used to determine file extension.
 *
 *  @return File extension.
 */
+ (NSString *)fileExtensionByGuessingFromMimeType:(NSString *)mimeType;

/**
 *  Creates and returns an new file name.
 *
 *  @param mimeType Mime type used to determine file name.
 *
 *  @return New file name.
 */
+ (NSString *)fileNameForMimeType:(NSString *)mimeType;

@end
