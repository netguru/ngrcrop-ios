//
//  NGRAnchorPoint.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import Foundation;
@import UIKit;

typedef NS_ENUM(NSInteger, NGRAnchorPointLocation) {
    NGRAnchorPointLocationCenter,
    NGRAnchorPointLocationTopLeft,
    NGRAnchorPointLocationMiddleLeft,
    NGRAnchorPointLocationBottomLeft,
    NGRAnchorPointLocationTopRight,
    NGRAnchorPointLocationMiddleRight,
    NGRAnchorPointLocationBottomRight,
    NGRAnchorPointLocationTopMiddle,
    NGRAnchorPointLocationBottomMiddle,
    //do not use, for enumeration only:
    NGRAnchorPointLocationPointsCount
};

@interface NGRAnchorPoint : NSObject

/**
 *  Initialize anchor with specified location. Designed initializer for class.
 *
 *  @param location The location where anchor should take a place.
 *
 *  @return Instance of NGRAnchorPoint class.
 */
- (instancetype)initWithLocation:(NGRAnchorPointLocation)location NS_DESIGNATED_INITIALIZER;

/**
 *  Sets reference point calculated on basis of superview size.
 *
 *  @param size The size of superview.
 */
- (void)setReferencePointWithSize:(CGSize)size;

/**
 *  Measures distance between two points and return it.
 *
 *  @param point The point from which the distance is calculated.
 *
 *  @return Distance between reference point and given point.
 */
- (CGFloat)distanceFromReferencePointToPoint:(CGPoint)point;

/**
 *  Indicates whether border is stretched.
 */
- (BOOL)isStretched;

/**
 *  Helper method which returns name of anchor location based on location enum.
 *
 *  @return Location name.
 */
- (NSString *)locationName;

/**
 *  Location of anchor.
 */
@property (assign, nonatomic, readonly) NGRAnchorPointLocation location;

#pragma Scaling factors:

@property (assign, nonatomic, readonly) CGPoint referencePoint;
@property (assign, nonatomic, readonly) CGFloat adjustsX;
@property (assign, nonatomic, readonly) CGFloat adjustsY;
@property (assign, nonatomic, readonly) CGFloat adjustsH;
@property (assign, nonatomic, readonly) CGFloat adjustsW;

#pragma Ratio factors:

@property (assign, nonatomic, readonly) CGFloat ratioX1;
@property (assign, nonatomic, readonly) CGFloat ratioX2;
@property (assign, nonatomic, readonly) CGFloat ratioY1;
@property (assign, nonatomic, readonly) CGFloat ratioY2;
@property (assign, nonatomic, readonly) CGFloat ratioW;
@property (assign, nonatomic, readonly) CGFloat ratioH;

@end
