//
//  NGRScalableBorder.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSInteger, NGRBorderDrawingMode) {
    NGRBorderDrawingModeAlways,
    NGRBorderDrawingModeNever
};

typedef NS_ENUM(NSInteger, NGRGridDrawingMode) {
    NGRGridDrawingModeAlways,
    NGRGridDrawingModeOnResizing,
    NGRGridDrawingModeNever
};

typedef NS_ENUM(NSInteger, NGRAnchorsDrawingMode) {
    NGRAnchorsDrawingModeAlways,
    NGRAnchorsDrawingModeOnResizing,
    NGRAnchorsDrawingModeNever
};

typedef NS_ENUM(NSInteger, NGRGridStyle) {
    NGRGridStyleContinuous,
    NGRGridStyleDashed,
    NGRGridStyleDotted
};

typedef NS_ENUM(NSInteger, NGRBorderStyle) {
    NGRBorderStyleContinuous,
    NGRBorderStyleDashed,
    NGRBorderStyleDotted
};

@protocol NGRScalableBorderDelegate;

@interface NGRScalableBorder : UIView

/**
 *  Whether user currenly resize border. Property managed and set by NGRScalableBorder.
 *  Do not change if it is not necessary.
 */
@property (assign, nonatomic, getter=isResizing) BOOL resizing;

#pragma mark - Grid

/**
 *  Defines behaviour of grid drawing. Default set to NGRGridDrawingModeOnResizing.
 */
@property (assign, nonatomic) NGRGridDrawingMode gridDrawingMode;

/**
 *  Style of grid line. Default set to NGRGridStyleContinuous.
 */
@property (assign, nonatomic) NGRGridStyle gridStyle;

/**
 *  Color of gridline. Default is white color with 0.5 alpha.
 */
@property (strong, nonatomic) UIColor *gridColor;

/**
 *  The thickness of grid lines. Default is 1 point.
 */
@property (assign, nonatomic) NSUInteger gridThickness;

/**
 *  Number of drawn gridlines in one direction (x axis). In second direction (y axis) number will be same.
 *  Default value: 2 - it means 4 gridlines will be drawn: 2 horizontally and 2 vertically.
 *  Notice that big number of gridlines can affect performance.
 */
@property (assign, nonatomic) NSInteger numberOfGridlines;

#pragma mark - Border

/**
 *  The margin of border draw relative to it's superview (NGRScalableBorder). Default is 5 points.
 */
@property (assign, nonatomic) NSUInteger borderInset;

/**
 *  The thickness of border. Default is 1 point.
 */
@property (assign, nonatomic) NSUInteger borderThickness;

/**
 *  Style of border line. Default set to NGRBorderStyleContinuous.
 */
@property (assign, nonatomic) NGRBorderStyle borderStyle;

/**
 *  Defines behaviour of border drawing. Default set to NGRBorderDrawingModeAlways.
 */
@property (assign, nonatomic) NGRBorderDrawingMode borderDrawinMode;

/**
 *  Color of border. Default is [UIColor colorWithWhite:0.9f alpha:1] color.
 */
@property (strong, nonatomic) UIColor *borderColor;

#pragma mark - Anchors

/**
 *  The thickness of anchors. Default is 2 points.
 */
@property (assign, nonatomic) NSUInteger anchorThickness;

/**
 *  Defines behaviour of anchors drawing. Default set to NGRAnchorsDrawingModeAlways.
 */
@property (assign, nonatomic) NGRAnchorsDrawingMode anchorsDrawingMode;

/**
 *  Color of anchors. Default is white color.
 */
@property (strong, nonatomic) UIColor *anchorsColor;

/**
 *  The receiver's delegate used to customize draws in scalable view.
 */
@property (weak, nonatomic) id<NGRScalableBorderDelegate> delegate;

@end

@protocol NGRScalableBorderDelegate <NSObject>

@required

/**
 *  Calls in drawRect: method. Used to customize draw. NOTICE: Draw always in prepared context.
 */
- (void)drawRect:(CGRect)rect withinContext:(CGContextRef)context;

@end
