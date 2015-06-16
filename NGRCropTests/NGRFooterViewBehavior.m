//
//  NGRFooterViewBehavior.m
//  Carrierwave
//
//  Created by Patryk Kaczmarek on 25.02.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

SharedExamplesBegin(NGRFooterViewBehavior)

sharedExamplesFor(@"button did tap", ^(NSDictionary *data) {
    
    __block UIButton *button;
    
    beforeEach(^{
        UIView *view = data[@"view"];
        NSString *buttonTitle = data[@"title"];
        button = [view specsFindButtonWithTitle:buttonTitle];
    });
    
    it(@"should post correct notification", ^{
        NSString *notificationName = data[@"notificationName"];
        expect(^{
            [button specsSimulateTap];
        }).will.notify(notificationName);
    });
});

SharedExamplesEnd
