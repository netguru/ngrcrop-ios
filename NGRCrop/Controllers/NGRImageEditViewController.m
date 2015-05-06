//
//  NGRImageEditViewController.m
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRImageEditViewController.h"
#import "NGRTransformViewController.h"
#import "NGRAlertController.h"

#import "NGRImageEditView.h"
#import "NGRHeaderView.h"
#import "NGRFooterView.h"

#import "NGRImageAsset.h"
#import "NGRNotificationIdentifiers.h"

@interface NGRImageEditViewController ()

@property (weak, nonatomic) NGRImageEditView *aView;
@property (weak, nonatomic) NGRTransformViewController *transformViewController;
@property (strong, nonatomic, readwrite) NSArray *ratioItemList;

@end

@implementation NGRImageEditViewController

#pragma mark - Object Lifecycle

- (instancetype)initWithImageAsset:(NGRImageAsset *)asset {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.imageAsset = asset;
    }
    return self;
}

- (instancetype)init {
    return [self initWithImageAsset:nil];
}

- (void)dealloc {
    [self removeContainerTransformViewController];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - View Lifecycle

- (void)loadView {
    NGRImageEditView *view = [[NGRImageEditView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    
    _aView = view;
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNotifications];
    [self createRatioList];
    
    if ([self.delegate respondsToSelector:@selector(heightForHeaderInImageEditViewController:)]) {
        self.aView.headerHeight= [self.delegate heightForHeaderInImageEditViewController:self];
    }
    
    if ([self.delegate respondsToSelector:@selector(heightForFooterInImageEditViewController:)]) {
        self.aView.footerHeight = [self.delegate heightForFooterInImageEditViewController:self];
    }
    
    if ([self.delegate respondsToSelector:@selector(viewForHeaderInImageEditViewController:)]) {
        self.aView.headerView = [self.delegate viewForHeaderInImageEditViewController:self];
    } else {
        self.aView.headerView = [[NGRHeaderView alloc] init];
    }
    
    if ([self.delegate respondsToSelector:@selector(viewForFooterInImageEditViewController:)]) {
        self.aView.footerView = [self.delegate viewForFooterInImageEditViewController:self];
    } else {
        self.aView.footerView = [[NGRFooterView alloc] init];
    }
    
    NGRTransformViewController *containerTransformViewController = [self addContainerTransformViewController];
    [containerTransformViewController setImage:[self.imageAsset image]];
}

#pragma mark - Public Methods

- (UIView *)headerView {
    return self.aView.headerView;
}

- (UIView *)footerView {
    return self.aView.footerView;
}

- (void)addRatioItemToList:(NGRRatioItem *)ratioItem {
    NSMutableArray *array = [self.ratioItemList mutableCopy];
    [array addObject:ratioItem];
    self.ratioItemList = [array copy];
}

#pragma mark - NSNotifications Listeners

- (void)onCancelAction {
    if ([self.delegate respondsToSelector:@selector(imageEditViewControllerDidCancelEditing:)]) {
        [self.delegate imageEditViewControllerDidCancelEditing:self];
    }
}

- (void)onRatioAction {
    NGRAlertController *ratioAlertController = [[NGRAlertController alloc] initWithList:self.ratioItemList actionHandler:^(CGFloat ratio) {
        if (ratio != 0.f) {
            [self.cropView animateToRatio:ratio completion:^(BOOL finished) {
                self.cropView.ratioEnabled = YES;
            }];
        } else {
            self.cropView.ratioEnabled = NO;
        }
    }];
    [self presentViewController:ratioAlertController animated:YES completion:nil];
}

- (void)onDoneAction {
    if ([self.delegate respondsToSelector:@selector(imageEditViewController:didFinishEditingWithImageAsset:)]) {
        UIImage *croppedImage = [self.transformViewController cropImage];
        NGRImageAsset *asset = [[NGRImageAsset alloc] initWithImage:croppedImage];
        [self.delegate imageEditViewController:self didFinishEditingWithImageAsset:asset];
    }
}

#pragma mark - Accessors

- (NGRScalableView *)cropView {
    return [self.transformViewController cropView];
}

- (void)setImageAsset:(NGRImageAsset *)imageAsset {
    if (![self.imageAsset isEqual:imageAsset]) {
        _imageAsset = imageAsset;
    }
}

#pragma mark - Private Methods

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (NGRTransformViewController *)addContainerTransformViewController {
    
    NGRTransformViewController *controller = [[NGRTransformViewController alloc] init];
    controller.view.frame = [self.aView rectForContainerView];
    [self addChildViewController:controller];
    [self.aView addSubview:controller.view];
    [controller didMoveToParentViewController:self];
    
    self.transformViewController = controller;
    return controller;
}

- (void)removeContainerTransformViewController {
    
    UIViewController *controller = [self.childViewControllers lastObject];
    [controller willMoveToParentViewController:nil];
    [controller.view removeFromSuperview];
    [controller removeFromParentViewController];
}

- (void)registerNotifications {
    
    void (^registerNotification)(SEL, NSString *) = ^(SEL selector, NSString *name) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:selector name:name object:nil];
    };
    
    registerNotification(@selector(onRatioAction), NGRImageEditViewControllerWillShowRatioAlertControllerNotification);
    registerNotification(@selector(onCancelAction), NGRImageEditViewControllerWillCancelEditingNotification);
    registerNotification(@selector(onDoneAction), NGRImageEditViewControllerWillFinishEditingWithImageAssetNotification);
}

- (void)createRatioList {
    
    NGRRatioItem * (^createCropRatio)(NSString *, CGFloat) = ^(NSString *title, CGFloat ratio) {
        return [[NGRRatioItem alloc] initWithTitle:title ratio:ratio];
    };
    
    self.ratioItemList = @[createCropRatio(NSLocalizedString(@"None (free form)", nil), 0.f),
                           createCropRatio(NSLocalizedString(@"1:1", nil), 1.f),
                           createCropRatio(NSLocalizedString(@"1:2", nil), .5f),
                           createCropRatio(NSLocalizedString(@"2:1", nil), 2.f),
                           createCropRatio(NSLocalizedString(@"3:4", nil), 0.75f),
                           createCropRatio(NSLocalizedString(@"4:3", nil), 1.3333f)];
}

@end
