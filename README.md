# ngrcrop-ios
## UI Component
UI component for editing selected photos. `NGRImageEditViewController` is responsible for scaling, rotating and croping them. Here is some preview how it looks in demo app:

![crop view example](https://github.com/netguru/ngrcrop-ios/blob/master/doc/2_crop_view.jpg "Crop view example")

### Usage

Usage is very simple, just create new instance and show it:

```objc
NGRImageEditViewController *controller =  [[NGRImageEditViewController alloc] initWithImageAsset:imageAsset];
controller.delegate = self;
[self presentViewController:controller animated:YES completion:nil];
```

If you are using storyboards, you can also drag new empty view controller in InterfaceBuilder and set its class to `NGRImageEditViewController`.

## UI configurability

We did our best to make `NGRImageEditViewController` as configurable as possible, that's why its interface expose bunch of useful properties to fit any app.

### Delegate

Setting `NGRImageEditViewControllerDelegate` gives possibility to inject own UI components in:

- header view - layouted at the top of the screen.
- footer view - layouted at the bottom of the screen.

The rest of the space is designed for scaling, rotating and cropping image. 


Bringing own UI components is available via implementation of methods:
```objc
- (UIView *)viewForHeaderInImageEditViewController:(NGRImageEditViewController *)controller;
- (UIView *)viewForFooterInImageEditViewController:(NGRImageEditViewController *)controller;
```
To create a view with communication feature, you have to sublass `NGRHeaderFooterView` class and use `eventMessenger` to post messages:

```objc
- (void)postCancelMessage;
- (void)postDoneMessage;
- (void)postShowRatioSheetMessage;
- (void)postResetTransformationMessage;
```
[Here](https://github.com/netguru/ngrcrop-ios/blob/master/NGRCrop/Default%20Header%20Footer/NGRFooterView.m) is an example.

Specifying header and footer height is also possible:
```objc
- (CGFloat)heightForHeaderInImageEditViewController:(NGRImageEditViewController *)controller; //default 20 points
- (CGFloat)heightForFooterInImageEditViewController:(NGRImageEditViewController *)controller; //default 60 points
```

### Crop border

Crop border is customizable as well. It has bunch of options which help its to fit your app style. For more info please refer to [NGRScalableView](https://github.com/netguru/ngrcrop-ios/blob/master/NGRCrop/CropFrame/NGRScalableView.h) and [NGRScalableBorder](https://github.com/netguru/ngrcrop-ios/blob/master/NGRCrop/CropFrame/CRVScalableBorder.h)

#### Animation options
```
@property (assign, nonatomic) NSTimeInterval animationDuration;
@property (assign, nonatomic) UIViewAnimationOptions animationCurve;
@property (assign, nonatomic) CGFloat springDamping;
@property (assign, nonatomic) CGFloat springVelocity;
```

#### Border grid

```objc
@property (assign, nonatomic) NGRGridDrawingMode gridDrawingMode;
@property (assign, nonatomic) NGRGridStyle gridStyle;
@property (strong, nonatomic) UIColor *gridColor;
@property (assign, nonatomic) NSUInteger gridThickness;
@property (assign, nonatomic) NSInteger numberOfGridlines;
```

#### Border
```objc
@property (assign, nonatomic) NGRBorderDrawingMode borderDrawinMode;
@property (assign, nonatomic) NGRBorderStyle borderStyle;
@property (strong, nonatomic) UIColor *borderColor;
@property (assign, nonatomic) NSUInteger borderThickness;
@property (assign, nonatomic) NSUInteger borderInset;
```

#### Anchors
```objc
@property (assign, nonatomic) NGRAnchorsDrawingMode anchorsDrawingMode;
@property (strong, nonatomic) UIColor *anchorsColor;
@property (assign, nonatomic) NSUInteger anchorThickness;
```

#### Custom drawing 
Although exposed properties are able to customize crop border a lot, there is special method provided to make your own drawing within existing context:
```objc
- (void)drawRect:(CGRect)rect withinContext:(CGContextRef)context;
```

#### Following on screen changes 

There is also a possibility to receive user events and react on them. Only thing you have to do, is to confirm `NGRScalableViewDelegate` protocol and implement methods your're interested in:
```objc
- (void)scalableViewDidBeginScaling:(NGRScalableView *)view;
- (void)scalableViewDidEndScaling:(NGRScalableView *)view;
- (void)scalableViewDidBeginMoving:(NGRScalableView *)view;
- (void)scalableViewDidEndMoving:(NGRScalableView *)view;
- (void)scalableViewDidMove:(NGRScalableView *)view;
- (void)scalableViewDidScale:(NGRScalableView *)view;
```

### Crop border animations

Animate crop view to given frame:
```objc
- (void)animateToFrame:(CGRect)frame completion:(void (^)(BOOL finished))completion;
```

Animate crop view to given size around its center:
```objc
- (void)animateToSize:(CGSize)size completion:(void (^)(BOOL finished))completion;
```

Animates crop view to given ratio around its center. Final dimensions are maximum possible values depending on superview bounds:
```objc
- (void)animateToRatio:(CGFloat)ratio completion:(void (^)(BOOL finished))completion;
```

Animations algorithm is smart enough to validate if given/calculated frame is located in the superview or not. If not origin and/or size will be changed to valid one. So you do not have to worry that crop view will move outside the boundaries of its superview.


## License
**carrierwave-ios** is available under the [MIT license](https://github.com/netguru/carrierwave-ios/blob/master/LICENSE.md).

## Contribution
First, thank you for contributing!

Here's a few guidelines to follow:

- we follow [Ray Wenderlich Style Guide](https://github.com/raywenderlich/objective-c-style-guide).
- write tests
- make sure the entire test suite passes

## More Info

Have a question? Please [open an issue](https://github.com/netguru/carrierwave-ios/issues/new)!

## Authors

**Adrian Kashivskyy**

- [https://github.com/akashivskyy](https://github.com/akashivskyy)
- [https://twitter.com/akashivskyy](https://twitter.com/akashivskyy)

**Patryk Kaczmarek**

- [https://github.com/PatrykKaczmarek](https://github.com/PatrykKaczmarek)

**Wojciech Trzasko**

- [https://github.com/WojciechTrzasko](https://github.com/WojciechTrzasko)

**Grzegorz Lesiak**

- [https://github.com/glesiak](https://github.com/glesiak)

**Paweł Białecki**

- [https://github.com/ecler](https://github.com/ecler)

**Marcin Piesiak**

- [https://github.com/marcinpiesiak](https://github.com/marcinpiesiak)

Copyright © 2014-2015 [Netguru](https://netguru.co)
