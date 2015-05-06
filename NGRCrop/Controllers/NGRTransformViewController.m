//
//  NGRTransformViewController.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRTransformViewController.h"
#import "NGRTransformView.h"

#import "NGRGeometry.h"
#import "NGRNotificationIdentifiers.h"

static CGFloat const NGRMinMarginOnPan = 80.f;
static CGFloat const NGRMinPixelSizeOnZoom = 50.f;


@interface NGRTransformViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) NGRTransformView *aView;
@property (assign, nonatomic) CGFloat scale;
@property (assign, nonatomic) CGFloat previousScale;

@end

@implementation NGRTransformViewController

- (void)loadView {
    NGRTransformView *view = [[NGRTransformView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    
    _aView = view;
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scale = 1.f;
    
    void (^configureGesture)(UIGestureRecognizer *) = ^(UIGestureRecognizer *gesture) {
        gesture.cancelsTouchesInView = NO;
        gesture.delegate = self;
    };
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    configureGesture(panGesture);
    [self.aView addGestureRecognizer:panGesture];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureAction:)];
    configureGesture(pinchGesture);
    [self.aView addGestureRecognizer:pinchGesture];
    
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateGestureAction:)];
    configureGesture(rotateGesture);
    [self.aView addGestureRecognizer:rotateGesture];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    configureGesture(tapGesture);
    tapGesture.numberOfTapsRequired = 2;
    [self.aView addGestureRecognizer:tapGesture];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetTransform) name:NGRTransformViewControllerWillResetTransformationNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Public Methods

- (void)setImage:(UIImage *)image {
    [self.aView.imageView setImage:image];
}

- (NGRScalableView *)cropView {
    return self.aView.cropView;
}

- (UIImage *)cropImage {
    
    [self cropView].hidden = YES;
    
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
    UIImage *sourceImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGFloat screenScale = [UIScreen mainScreen].scale;
    CGFloat inset = [self cropView].borderView.borderInset + [self cropView].borderView.borderThickness;
    CGRect finalFrame = CGRectScale(CGRectInset([self cropView].frame, inset, inset), screenScale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([sourceImage CGImage], finalFrame);
    
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef scale:sourceImage.scale orientation:sourceImage.imageOrientation];
    CGImageRelease(imageRef);
    
    return croppedImage;
}

- (void)resetTransform {
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.9f initialSpringVelocity:13.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.aView.imageView.transform = CGAffineTransformIdentity;
        self.aView.imageView.frame = CGRectMakeCenter(self.aView.bounds, CGRectGetWidth(self.aView.imageView.frame), CGRectGetHeight(self.aView.imageView.frame));
    } completion:nil];
}

#pragma mark - Gesture Recognizers

- (void)rotateGestureAction:(UIRotationGestureRecognizer *)recognizer {
    
    if (!self.aView.allowToUseGestures) {
        return;
    }
    
    self.aView.imageView.transform = CGAffineTransformRotate(self.aView.imageView.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (void)pinchGestureAction:(UIPinchGestureRecognizer *)recognizer {
    
    if (!self.aView.allowToUseGestures) {
        return;
    } else if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.previousScale = self.scale;
    }
    
    CGFloat currentScale = recognizer.scale * self.scale;
    //X axis:
    BOOL isScaledImageViewXDimensionSmallerThanAllowed = (CGRectGetWidth(self.aView.imageView.frame) * currentScale) < NGRMinPixelSizeOnZoom;
    if (isScaledImageViewXDimensionSmallerThanAllowed) {
        currentScale = NGRMinPixelSizeOnZoom / CGRectGetWidth(self.aView.imageView.frame);
    }
    //Y axis:
    BOOL isScaledImageViewYDimensionSmallerThanAllowed = (CGRectGetHeight(self.aView.imageView.frame) * currentScale) < NGRMinPixelSizeOnZoom;
    if (isScaledImageViewYDimensionSmallerThanAllowed) {
        currentScale = NGRMinPixelSizeOnZoom / CGRectGetHeight(self.aView.imageView.frame);
    }
    
    CGFloat scaleStep = currentScale / self.previousScale;
    self.aView.imageView.transform = CGAffineTransformScale(self.aView.imageView.transform, scaleStep, scaleStep);
    self.previousScale = currentScale;
    
    BOOL didGestureFail = (recognizer.state == UIGestureRecognizerStateEnded) || (recognizer.state == UIGestureRecognizerStateCancelled) || (recognizer.state == UIGestureRecognizerStateFailed);
    if (didGestureFail) {
        self.scale = currentScale;
    }
}

- (void)panGestureAction:(UIPanGestureRecognizer *)recognizer {
    
    if (!self.aView.allowToUseGestures) {
        return;
    }
    
    CGPoint translation = [recognizer translationInView:self.aView];
    
    BOOL willLeftEdgeMoveOutsideRightScreenEdge = (CGRectGetMaxX(self.aView.imageView.frame) + translation.x - NGRMinMarginOnPan) < CGRectGetMinX(self.aView.frame);
    BOOL willRightEdgeMoveOutsideLeftScreenEdge = (CGRectGetMinX(self.aView.imageView.frame) + translation.x + NGRMinMarginOnPan) > CGRectGetMaxX(self.aView.frame);
    
    if (willLeftEdgeMoveOutsideRightScreenEdge || willRightEdgeMoveOutsideLeftScreenEdge) {
        translation.x = 0;
    }
    
    BOOL willBottomEdgeMoveOutsideTopScreenEdge = (CGRectGetMaxY(self.aView.imageView.frame) + translation.y) - NGRMinMarginOnPan < CGRectGetMinY(self.aView.frame);
    BOOL willTopEdgeMoveOutsideBottomScreenEdge = (CGRectGetMinY(self.aView.imageView.frame) + translation.y) + NGRMinMarginOnPan > CGRectGetMaxY(self.aView.frame);
    
    if (willTopEdgeMoveOutsideBottomScreenEdge || willBottomEdgeMoveOutsideTopScreenEdge) {
        translation.y = 0;
    }
    
    // Change location
    self.aView.imageView.center = CGPointAddition(self.aView.imageView.center, translation);
    
    [recognizer setTranslation:CGPointZero inView:self.aView];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)recognizer {
    
    NGRScalableView *cropView = [self cropView];
    cropView.active = !cropView.active;
    
    NGRAnchorsDrawingMode drawingMode = cropView.active ? NGRAnchorsDrawingModeAlways : NGRAnchorsDrawingModeNever;
    cropView.borderView.anchorsDrawingMode = drawingMode;
    [cropView.borderView setResizing:NO];
}

#pragma mark - UIGestureRecognizerDelegate Methods

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end

