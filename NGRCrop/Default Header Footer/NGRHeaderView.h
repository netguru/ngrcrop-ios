//
//  NGRHeaderView.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

@import UIKit;

/**
 *  This is default header UIView used by NGREditImageViewController.
 *  If end-developer will not provide his own view for header, this one will be used.
 *  Injecting own view is possible by implementing NGRImageEditViewControllerDelegate and method:
 *
 *  - (UIView *)viewForHeaderInImageEditViewController:(NGRImageEditViewController *)controller;
 *
 *  Specifying header height is possible with:
 *
 *  - (CGFloat)heightForHeaderInImageEditViewController:(NGRImageEditViewController *)controller;
 */

@interface NGRHeaderView : UILabel

@end
