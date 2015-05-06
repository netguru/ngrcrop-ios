//
//  NGRImageAsset.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import Foundation;
@import MobileCoreServices;
@import UIKit;

#import "NGRAssetType.h"

/**
 * The NGRImageAsset class is used to represent images which can be uploaded to
 * the carrierwave-powered server backend.
 *
 * The NGRImageAsset class can represent the following image types:
 *   - image/gif (.gif)
 *   - image/jpeg (.jpeg, .jpg)
 *   - image/tiff (.tiff, .tif)
 *   - image/png (.png)
 */
@interface NGRImageAsset : NSObject <NGRAssetType>

/**
 * Creates the image asset using the data of an image.
 *
 * @param image The data of the image to be represented by the asset.
 *
 * @return An initialized receiver.
 */
- (instancetype)initWithData:(NSData *)data NS_DESIGNATED_INITIALIZER;

/**
 * Creates the image asset using the existing image instance.
 *
 * As the image's original type cannot be determined, it is implicitly
 * converted to a png file.
 *
 * @param image The image to be represented by the asset.
 *
 * @return An initialized receiver.
 */
- (instancetype)initWithImage:(UIImage *)image;

/**
 * Creates the image asset by loading a local image under the specified URL.
 *
 * @param url The URL of a local image file to be represented by the asset.
 *
 * @return An initialized receiver.
 */
- (instancetype)initWithLocalURL:(NSURL *)url;

/**
 * The image represented by the asset.
 */
@property (strong, nonatomic, readonly) UIImage *image;

/**
 * Compresses the image asset and returns it as a new one.
 *
 * As certain image types cannot be compressed (such as png), this method
 * automatically converts the image into a jpeg file.
 *
 * @param quality The compression quality.
 *
 * @return An asset representing a compressed image.
 */
- (instancetype)compressedImageAssetWithQuality:(CGFloat)quality;

@end
