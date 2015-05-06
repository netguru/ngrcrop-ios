//
//  NGRGeometry.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#ifndef NGRCrop_NGRGeometry_h
#define NGRCrop_NGRGeometry_h

CG_INLINE CGPoint CGPointAddition(CGPoint point1, CGPoint point2) {
    return CGPointMake(point1.x + point2.x, point1.y + point2.y);
}

CG_INLINE CGRect CGRectScale(CGRect rect, CGFloat x) {
    return CGRectMake(CGRectGetMinX(rect) * x, CGRectGetMinY(rect) * x, CGRectGetWidth(rect) * x, CGRectGetHeight(rect) * x);
}

CG_INLINE CGRect CGRectMakeCenter(CGRect rect, CGFloat x, CGFloat y) {
    return CGRectMake(CGRectGetMidX(rect) - x * .5f, CGRectGetMidY(rect) - y * .5f, x, y);
}

CG_INLINE BOOL CGSizeIsNull(CGSize size) {
    return size.width == 0.f && size.height == 0.f;
}

#endif
