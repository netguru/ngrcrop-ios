//
//  NGRScalableBorder+Anchors.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRScalableBorder+Anchors.h"


@implementation NGRScalableBorder (Anchors)


- (void)drawAppleStyleAnchorsInContext:(CGContextRef)context {
    
    CGFloat lineWidth = MIN(self.anchorThickness, self.borderInset); //cannot be larger than border inset.
    CGFloat anchorWidth = MIN(self.borderInset * 5.f, CGRectGetWidth(self.bounds)/3.f) - self.borderInset;
    CGFloat anchorHeight = MIN(self.borderInset * 5.f, CGRectGetHeight(self.bounds)/3.f) - self.borderInset;
    
    CGColorRef aColor = self.anchorsColor.CGColor;
    CGContextSetFillColorWithColor(context, aColor);
    CGContextSetStrokeColorWithColor(context, aColor);
    CGContextSetLineWidth(context, lineWidth);
    
    /*top left:
     A*-------*B
     |  D    |
     |  *----*C
     |  |
     F*--*E
     */
    /*D*/CGContextMoveToPoint(context, self.borderInset, self.borderInset);
    /*C*/CGContextAddLineToPoint(context, anchorWidth, self.borderInset);
    /*B*/CGContextAddLineToPoint(context, anchorWidth, self.borderInset - lineWidth);
    /*A*/CGContextAddLineToPoint(context, self.borderInset - lineWidth, self.borderInset - lineWidth);
    /*F*/CGContextAddLineToPoint(context, self.borderInset - lineWidth, anchorHeight);
    /*E*/CGContextAddLineToPoint(context, self.borderInset, anchorHeight);
    
    /*top right:
     A*-------*B
     |    E  |
     F*----*  |
     |  |
     D*--*C
     */
    /*A*/CGContextMoveToPoint(context, CGRectGetWidth(self.bounds) - anchorWidth, self.borderInset - lineWidth);
    /*B*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset + lineWidth, self.borderInset - lineWidth);
    /*C*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset + lineWidth, anchorHeight);
    /*D*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset, anchorHeight);
    /*E*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset, self.borderInset);
    /*F*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - anchorWidth, self.borderInset);
    
    /*bottom right:
     B*--*C
     |  |
     F*----*  |
     |    A  |
     E*-------*D
     */
    /*A*/CGContextMoveToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset, CGRectGetHeight(self.bounds) - self.borderInset);
    /*B*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset, CGRectGetHeight(self.bounds) - anchorHeight);
    /*C*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset + lineWidth, CGRectGetHeight(self.bounds) - anchorHeight);
    /*D*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset + lineWidth, CGRectGetHeight(self.bounds) - self.borderInset + lineWidth);
    /*E*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - anchorWidth, CGRectGetHeight(self.bounds) - self.borderInset + lineWidth);
    /*F*/CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - anchorWidth, CGRectGetHeight(self.bounds) - self.borderInset);
    
    /*bottom left:
     E*--*F
     |  |
     |  *----*B
     |  A    |
     D*-------*C
     */
    /*A*/CGContextMoveToPoint(context, self.borderInset, CGRectGetHeight(self.bounds) - self.borderInset);
    /*B*/CGContextAddLineToPoint(context, anchorWidth, CGRectGetHeight(self.bounds) - self.borderInset);
    /*C*/CGContextAddLineToPoint(context, anchorWidth, CGRectGetHeight(self.bounds) - self.borderInset + lineWidth);
    /*D*/CGContextAddLineToPoint(context, self.borderInset - lineWidth, CGRectGetHeight(self.bounds) - self.borderInset + lineWidth);
    /*E*/CGContextAddLineToPoint(context, self.borderInset - lineWidth, CGRectGetHeight(self.bounds) - anchorHeight);
    /*F*/CGContextAddLineToPoint(context, self.borderInset, CGRectGetHeight(self.bounds) - anchorHeight);
    
    // top middle:
    CGContextMoveToPoint(context, CGRectGetMidX(self.bounds) - anchorWidth * 0.5f, self.borderInset - lineWidth);
    CGContextAddLineToPoint(context, CGRectGetMidX(self.bounds) + anchorWidth * 0.5f, self.borderInset - lineWidth);
    CGContextAddLineToPoint(context, CGRectGetMidX(self.bounds) + anchorWidth * 0.5f, self.borderInset);
    CGContextAddLineToPoint(context, CGRectGetMidX(self.bounds) - anchorWidth * 0.5f, self.borderInset);
    
    // bottom middle
    CGContextMoveToPoint(context, CGRectGetMidX(self.bounds) - anchorWidth * 0.5f, CGRectGetHeight(self.bounds) - self.borderInset);
    CGContextAddLineToPoint(context, CGRectGetMidX(self.bounds) + anchorWidth * 0.5f, CGRectGetHeight(self.bounds) - self.borderInset);
    CGContextAddLineToPoint(context, CGRectGetMidX(self.bounds) + anchorWidth * 0.5f, CGRectGetHeight(self.bounds) - self.borderInset + lineWidth);
    CGContextAddLineToPoint(context, CGRectGetMidX(self.bounds) - anchorWidth * 0.5f, CGRectGetHeight(self.bounds) - self.borderInset + lineWidth);
    
    // left middle
    CGContextMoveToPoint(context, self.borderInset - lineWidth, CGRectGetMidY(self.bounds) - anchorHeight * 0.5f);
    CGContextAddLineToPoint(context, self.borderInset, CGRectGetMidY(self.bounds) - anchorHeight * 0.5f);
    CGContextAddLineToPoint(context, self.borderInset, CGRectGetMidY(self.bounds) + anchorHeight * 0.5f);
    CGContextAddLineToPoint(context, self.borderInset - lineWidth, CGRectGetMidY(self.bounds) + anchorHeight * 0.5f);
    
    // right middle
    CGContextMoveToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset, CGRectGetMidY(self.bounds) - anchorHeight * 0.5f);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset + lineWidth, CGRectGetMidY(self.bounds) - anchorHeight * 0.5f);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset + lineWidth, CGRectGetMidY(self.bounds) + anchorHeight * 0.5f);
    CGContextAddLineToPoint(context, CGRectGetWidth(self.bounds) - self.borderInset, CGRectGetMidY(self.bounds) + anchorHeight * 0.5f);
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}

@end
