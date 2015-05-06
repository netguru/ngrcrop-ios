//
//  NGRScalableBorder+Anchors.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRScalableBorder.h"

@interface NGRScalableBorder (Anchors)

/**
 *  Draws apple photo-app like style anchors.
 *
 *  @param context The context where anchors should be drawn.
 */
- (void)drawAppleStyleAnchorsInContext:(CGContextRef)context;

@end

