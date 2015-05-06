//
//  NGRFooterView.h
//  NGRCrop
//
//  Created by Marcin Piesiak on 04.05.2015.
//  Copyright (c) 2015 Marcin Piesiak. All rights reserved.
//

#import "NGRHeaderFooterView.h"

/**
 *  This is default footer UIView used by NGREditImageViewController.
 *  If end-developer will not provide his own view for footer, this one will be used.
 *  Injecting own view is possible by implementing NGRImageEditViewControllerDelegate and method:
 *
 *  - (UIView *)viewForFooterInImageEditViewController:(NGRImageEditViewController *)controller;
 *
 *  Specifying header height is possible with:
 *
 *  - (CGFloat)heightForFooterInImageEditViewController:(NGRImageEditViewController *)controller;
 *
 *  Notice that this view inherits from NGRHeaderFooterView because footer view has a possibility to send messeges via event messenger.
 */

@interface NGRFooterView : NGRHeaderFooterView

@end
