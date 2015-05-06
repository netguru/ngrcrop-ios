//
//  NGRAssetType.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import Foundation;

/**
 * The NGRAssetType protocol provides a common interface for assets which can be
 * uploaded to the carrierwave-powered server backend.
 */
@protocol NGRAssetType <NSObject> @required

/**
 * The MIME type of the object represented by the asset.
 */
@property (strong, nonatomic, readonly) NSString *mimeType;

/**
 * The file name of the object represented by the asset.
 */
@property (strong, nonatomic, readonly) NSString *fileName;

/**
 * The data stream of the object represented by the asset.
 */
@property (strong, nonatomic, readonly) NSInputStream *dataStream;

/**
 * The length of data stream.
 */
@property (strong, nonatomic, readonly) NSNumber *dataLength;

@end
