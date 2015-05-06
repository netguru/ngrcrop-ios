//
//  NGRImageAsset.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRImageAsset.h"

#import "NGRAssertTypeUtils.h"

@interface NGRImageAsset ()

@property (strong, nonatomic, readwrite) NSString *fileName;
@property (strong, nonatomic, readwrite) NSString *mimeType;
@property (strong, nonatomic, readwrite) NSInputStream *dataStream;
@property (strong, nonatomic, readwrite) NSNumber *dataLength;

@property (strong, nonatomic) NSData *data;

@end

#pragma mark -

@implementation NGRImageAsset

#pragma mark - Object lifecycle

- (instancetype)initWithData:(NSData *)data {
    NSParameterAssert(data != nil && [self mimeTypeByGuessingFromData:data] != nil);
    self = [super init];
    if (self == nil) return nil;
    self.data = data;
    return self;
}

- (instancetype)initWithImage:(UIImage *)image {
    return [self initWithData:UIImagePNGRepresentation(image)];
}

- (instancetype)initWithLocalURL:(NSURL *)url {
    NSParameterAssert([url isFileURL] && [url checkResourceIsReachableAndReturnError:nil]);
    return [self initWithData:[[NSData alloc] initWithContentsOfURL:url]];
}

- (instancetype)init {
    return [self initWithData:nil];
}

#pragma mark - Mime type helpers

- (NSString *)mimeTypeByGuessingFromData:(NSData *)data {
    
    // inspired by php/php-src/ext/standard/image.c
    
    // read bytes
    char bytes[12] = {0};
    [data getBytes:&bytes length:12];
    
    // initialize signatures
    const char gif[3] = {'G', 'I', 'F'};
    const char jpg[3] = {0xff, 0xd8, 0xff};
    const char tif_ii[4] = {'I','I', 0x2A, 0x00};
    const char tif_mm[4] = {'M','M', 0x00, 0x2A};
    const char png[8] = {0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a};
    
    // try to guess by signatures
    if (!memcmp(bytes, gif, 3)) {
        return @"image/gif";
    } else if (!memcmp(bytes, jpg, 3)) {
        return @"image/jpeg";
    } else if (!memcmp(bytes, tif_ii, 4) || !memcmp(bytes, tif_mm, 4)) {
        return @"image/tiff";
    } else if (!memcmp(bytes, png, 8)) {
        return @"image/png";
    }
    
    // default
    return nil;
    
}

#pragma mark - Compressing images

- (instancetype)compressedImageAssetWithQuality:(CGFloat)quality {
    NSData *compressedData = UIImageJPEGRepresentation(self.image, quality);
    return [[[self class] alloc] initWithData:compressedData];
}

#pragma mark - Property accessors

- (NSString *)fileName {
    if (_fileName != nil) return _fileName;
    return _fileName = [NGRAssertTypeUtils fileNameForMimeType:self.mimeType];
}

- (NSString *)mimeType {
    if (_mimeType != nil) return _mimeType;
    return _mimeType = [self mimeTypeByGuessingFromData:self.data];
}

- (NSInputStream *)dataStream {
    return [[NSInputStream alloc] initWithData:self.data];
}

- (NSNumber *)dataLength {
    return @(self.data.length);
}

- (UIImage *)image {
    return [UIImage imageWithData:self.data];
}

@end
