//
//  NGRScalableView+Math.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRScalableView+Math.h"

@implementation NGRScalableView (Math)

- (CGPoint)pointByUpdateTouchPointIfOutsideOfSuperview:(CGPoint)touchPoint {
    CGFloat border = self.borderView.borderInset;
    
    if (touchPoint.x < border) {
        touchPoint.x = border;
    }
    if (touchPoint.x > self.superview.bounds.size.width - border) {
        touchPoint.x = self.superview.bounds.size.width - border;
    }
    if (touchPoint.y < border) {
        touchPoint.y = border;
    }
    if (touchPoint.y > self.superview.bounds.size.height - border) {
        touchPoint.y = self.superview.bounds.size.height - border;
    }
    return touchPoint;
}

- (void)validateFramePositionWithX:(CGFloat *)x y:(CGFloat *)y width:(CGFloat *)width height:(CGFloat *)height deltaW:(CGFloat *)deltaW deltaH:(CGFloat *)deltaH {
    
    BOOL doesLeftEdgeExceedSuperviewLeftEdge = *x < self.superview.bounds.origin.x;
    BOOL doesTopEdgeExceedSuperviewTopEdge = *y < self.superview.bounds.origin.y;
    BOOL doesRightEdgeExceedSuperviewRightEdge = *x + *width > self.superview.bounds.origin.x + self.superview.bounds.size.width;
    BOOL doesBottomEdgeExceedSuperviewBottomEdge = *y + *height > self.superview.bounds.origin.y + self.superview.bounds.size.height;
    
    if (self.ratioEnabled) {
        if (doesLeftEdgeExceedSuperviewLeftEdge || doesTopEdgeExceedSuperviewTopEdge ||
            doesRightEdgeExceedSuperviewRightEdge || doesBottomEdgeExceedSuperviewBottomEdge) {
            
            *height = self.frame.size.height;
            *y = self.frame.origin.y;
            *width = self.frame.size.width;
            *x = self.frame.origin.x;
        }
    } else {
        if (doesLeftEdgeExceedSuperviewLeftEdge) {
            // Calculate how much to grow the width by such that the new X coordinate will align with the superview.
            *deltaW = self.frame.origin.x - self.superview.bounds.origin.x;
            *width = self.frame.size.width + *deltaW;
            *x = self.superview.bounds.origin.x;
        }
        if (doesRightEdgeExceedSuperviewRightEdge) {
            *width = self.superview.bounds.size.width - *x;
        }
        if (doesTopEdgeExceedSuperviewTopEdge) {
            // Calculate how much to grow the height by such that the new Y coordinate will align with the superview.
            *deltaH = self.frame.origin.y - self.superview.bounds.origin.y;
            *height = self.frame.size.height + *deltaH;
            *y = self.superview.bounds.origin.y;
        }
        if (doesBottomEdgeExceedSuperviewBottomEdge) {
            *height = self.superview.bounds.size.height - *y;
        }
    }
}

- (void)validateFrameSizeWithX:(CGFloat *)x y:(CGFloat *)y width:(CGFloat *)width height:(CGFloat *)height {
    
    BOOL isHeightSmallerThanMinimumHeight = *height < self.minSize.height;
    BOOL isHeightLargerThanMaximumHeight = *height > self.maxSize.height;
    BOOL isWidthSmallerThanMinimumWidth = *width < self.minSize.width;
    BOOL isWidthLargerThanMaximumWidth = *width > self.maxSize.width;
    
    if (self.ratioEnabled) {
        if (isHeightSmallerThanMinimumHeight || isHeightLargerThanMaximumHeight || isWidthSmallerThanMinimumWidth || isWidthLargerThanMaximumWidth) {
            
            *height = self.frame.size.height;
            *y = self.frame.origin.y;
            *width = self.frame.size.width;
            *x = self.frame.origin.x;
        }
    } else {
        if (isWidthSmallerThanMinimumWidth || isWidthLargerThanMaximumWidth) {
            *width = self.frame.size.width;
            *x = self.frame.origin.x;
        }
        if (isHeightSmallerThanMinimumHeight || isHeightLargerThanMaximumHeight) {
            *height = self.frame.size.height;
            *y = self.frame.origin.y;
        }
    }
}

- (CGRect)frameByCheckingBoundaries:(CGRect)frame {
    CGRect rect = frame;
    
    // rect cannot be wider than screen width
    if (CGRectGetWidth(rect) > CGRectGetWidth(self.superview.frame)) {
        rect.size.width = CGRectGetWidth(self.superview.frame);
    }
    // rect cannot be higher than screen height
    if (CGRectGetHeight(rect) > CGRectGetHeight(self.superview.frame)) {
        rect.size.height = CGRectGetHeight(self.superview.frame);
    }
    // left edge cannot go outside left screen edge
    if (CGRectGetMinX(rect) < 0.f) {
        rect.origin.x = 0.f;
    }
    // top edge cannot go outside top screen edge
    if (CGRectGetMinY(rect) < 0.f) {
        rect.origin.y = 0.f;
    }
    // right edge cannot go outside right screen edge
    if (CGRectGetMaxX(rect) > CGRectGetMaxX(self.superview.bounds)) {
        rect.origin.x -= CGRectGetMaxX(frame) - CGRectGetWidth(self.superview.bounds);
    }
    // bottom edge cannot go outside bottom screen edge
    if (CGRectGetMaxY(rect) > CGRectGetMaxY(self.superview.bounds)) {
        rect.origin.y -= CGRectGetMaxY(frame) - CGRectGetHeight(self.superview.bounds);
    }
    return rect;
}

- (CGPoint)centerWithTouchLocation:(CGPoint)touchPoint touchStart:(CGPoint)touchStart {
    CGPoint newCenter = CGPointMake(self.center.x + touchPoint.x - touchStart.x, self.center.y + touchPoint.y - touchStart.y);
    
    // Ensure the translation won't cause the view to move offscreen.
    CGFloat midPointX = CGRectGetMidX(self.bounds);
    if (newCenter.x > self.superview.bounds.size.width - midPointX) {
        newCenter.x = self.superview.bounds.size.width - midPointX;
    }
    if (newCenter.x < midPointX) {
        newCenter.x = midPointX;
    }
    CGFloat midPointY = CGRectGetMidY(self.bounds);
    if (newCenter.y > self.superview.bounds.size.height - midPointY) {
        newCenter.y = self.superview.bounds.size.height - midPointY;
    }
    if (newCenter.y < midPointY) {
        newCenter.y = midPointY;
    }
    return newCenter;
}

- (CGFloat)widthFromValue:(CGFloat)value {
    if (value > self.maxSize.width || value < self.minSize.width) {
        NSLog(@"Given width exceeds min/max width.\nChanged given width to proper one.");
        return MAX(MIN(value, self.maxSize.width), self.minSize.width);
    }
    return value;
}

- (CGFloat)heightFromValue:(CGFloat)value {
    if (value > self.maxSize.height || value < self.minSize.height) {
        NSLog(@"Given height exceeds min/max height.\nChanged given height to proper one.");
        return MAX(MIN(value, self.maxSize.height), self.minSize.height);
    }
    return value;
}

@end
