//
//  NGRAnchorPoint.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRAnchorPoint.h"

static CGFloat NGR_distanceBetweenTwoPoints(CGPoint point1, CGPoint point2) {
    return (CGFloat)sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2));
};

@interface NGRAnchorPoint ()

@property (assign, nonatomic) CGFloat multiplierX;
@property (assign, nonatomic) CGFloat multiplierY;
@property (assign, nonatomic, readwrite) CGPoint referencePoint;
@property (assign, nonatomic, readwrite) CGFloat adjustsX;
@property (assign, nonatomic, readwrite) CGFloat adjustsY;
@property (assign, nonatomic, readwrite) CGFloat adjustsH;
@property (assign, nonatomic, readwrite) CGFloat adjustsW;
@property (assign, nonatomic, readwrite) CGFloat ratioX1;
@property (assign, nonatomic, readwrite) CGFloat ratioX2;
@property (assign, nonatomic, readwrite) CGFloat ratioY1;
@property (assign, nonatomic, readwrite) CGFloat ratioY2;
@property (assign, nonatomic, readwrite) CGFloat ratioW;
@property (assign, nonatomic, readwrite) CGFloat ratioH;

@property (assign, nonatomic, readwrite) NGRAnchorPointLocation location;

@end

@implementation NGRAnchorPoint

- (instancetype)initWithLocation:(NGRAnchorPointLocation)location {
    self = [super init];
    if (self) {
        self.location = location;
        [self assignAdjustsWithLocation:location];
    }
    return self;
}

- (void)assignAdjustsWithLocation:(NGRAnchorPointLocation)location {
    
    switch (location) {
            
        case NGRAnchorPointLocationTopLeft: {
            self.adjustsX = 1.f, self.adjustsY = 1.f, self.adjustsH = -1.f, self.adjustsW = 1.f, self.multiplierX = 0.f, self.multiplierY = 0.f;
            self.ratioX1 = 0.f; self.ratioX2 = 0.f; self.ratioY1 = -1.f; self.ratioY2 = 0.f; self.ratioW = 0.f; self.ratioH = 1.f;
            break;
        }
        case NGRAnchorPointLocationMiddleLeft: {
            self.adjustsX = 1.f, self.adjustsY = 0.f, self.adjustsH = 0.f, self.adjustsW = 1.f, self.multiplierX = 0.f, self.multiplierY = 0.5f;
            self.ratioX1 = -1.f; self.ratioX2 = 0.f; self.ratioY1 = -0.5f; self.ratioY2 = 0.f; self.ratioW = 0.f; self.ratioH = 1.f;
            break;
        }
        case NGRAnchorPointLocationBottomLeft: {
            self.adjustsX = 1.f, self.adjustsY = 0.f, self.adjustsH = 1.f, self.adjustsW = 1.f, self.multiplierX = 0.f, self.multiplierY = 1.f;
            self.ratioX1 = 0.f; self.ratioX2 = 0.f; self.ratioY1 = 0.f; self.ratioY2 = 0.f; self.ratioW = 0.f; self.ratioH = 1.f;
            break;
        }
        case NGRAnchorPointLocationTopRight: {
            self.adjustsX = 0.f, self.adjustsY = 1.f, self.adjustsH = -1.f, self.adjustsW = -1.f, self.multiplierX = 1.f, self.multiplierY = 0.f;
            self.ratioX1 = 0.f; self.ratioX2 = 0.f; self.ratioY1 = -1.f; self.ratioY2 = 0.f; self.ratioW = 0.f; self.ratioH = 1.f;
            break;
        }
        case NGRAnchorPointLocationMiddleRight: {
            self.adjustsX = 0.f, self.adjustsY = 0.f, self.adjustsH = 0.f, self.adjustsW = -1.f, self.multiplierX = 1.f, self.multiplierY = 0.5f;
            self.ratioX1 = 0.f; self.ratioX2 = 0.f; self.ratioY1 = -0.5f; self.ratioY2 = 0.f; self.ratioW = 0.f; self.ratioH = 1.f;
            break;
        }
        case NGRAnchorPointLocationBottomRight: {
            self.adjustsX = 0.f, self.adjustsY = 0.f, self.adjustsH = 1.f, self.adjustsW = -1.f, self.multiplierX = 1.f, self.multiplierY = 1.f;
            self.ratioX1 = 0.f; self.ratioX2 = 0.f; self.ratioY1 = 0.f; self.ratioY2 = 0.f; self.ratioW = 0.f; self.ratioH = 1.f;
            break;
        }
        case NGRAnchorPointLocationTopMiddle: {
            self.adjustsX = 0.f, self.adjustsY = 1.f, self.adjustsH = -1.f, self.adjustsW = 0.f, self.multiplierX = 0.5f, self.multiplierY = 0.f;
            self.ratioX1 = 0.f; self.ratioX2 = -0.5f; self.ratioY1 = 0.f; self.ratioY2 = -1.f; self.ratioW = 1.f; self.ratioH = 0.f;
            break;
        }
        case NGRAnchorPointLocationBottomMiddle: {
            self.adjustsX = 0.f, self.adjustsY = 0.f, self.adjustsH = 1.f, self.adjustsW = 0.f, self.multiplierX = 0.5f, self.multiplierY = 1.f;
            self.ratioX1 = 0.f; self.ratioX2 = -0.5f; self.ratioY1 = 0.f; self.ratioY2 = 0.f; self.ratioW = 1.f; self.ratioH = 0.f;
            break;
        }
            
        case NGRAnchorPointLocationPointsCount:
        case NGRAnchorPointLocationCenter:
        default: {
            self.adjustsX = 0.f, self.adjustsY = 0.f, self.adjustsH = 0.f, self.adjustsW = 0.f, self.multiplierX = 0.5f, self.multiplierY = 0.5f;
            self.ratioX1 = 0.f; self.ratioX2 = 0.f; self.ratioY1 = 0.f; self.ratioY2 = 0.f; self.ratioW = 0.f; self.ratioH = 0.f;
            break;
        }
    }
}

- (void)setReferencePointWithSize:(CGSize)size {
    self.referencePoint = CGPointMake(size.width * self.multiplierX, size.height * self.multiplierY);
}

- (CGFloat)distanceFromReferencePointToPoint:(CGPoint)point {
    return NGR_distanceBetweenTwoPoints(point, self.referencePoint);
}

- (BOOL)isStretched {
    return (self.adjustsH || self.adjustsW || self.adjustsX || self.adjustsY);
}

- (NSString *)locationName {
    switch (self.location) {
        case NGRAnchorPointLocationCenter:
            return @"Center";
        case NGRAnchorPointLocationTopLeft:
            return @"Top Left";
        case NGRAnchorPointLocationMiddleLeft:
            return @"Middle Left";
        case NGRAnchorPointLocationBottomLeft:
            return @"Bottom Left";
        case NGRAnchorPointLocationTopRight:
            return @"Top Right";
        case NGRAnchorPointLocationMiddleRight:
            return @"Middle Right";
        case NGRAnchorPointLocationBottomRight:
            return @"Bottom Right";
        case NGRAnchorPointLocationTopMiddle:
            return @"Top Middle";
        case NGRAnchorPointLocationBottomMiddle:
            return @"Bottom Middle";
        case NGRAnchorPointLocationPointsCount:
            return @"count";
            
        default:
            return nil;
    }
}

@end

