//
//  NGRAnchorPointSpec.m
//  Carrierwave
//
//  Created by Patryk Kaczmarek on 29.01.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//


NSString *const NGRAnchorPointKey = @"NGRAnchorPointKey";
NSString *const NGRAnchorPointLocationKey = @"NGRAnchorPointLocationKey";
NSString *const NGRAnchorPointLocationNameKey = @"NGRAnchorPointLocationNameKey";

SharedExamplesBegin(NGRAnchorPointSharedExamples)

sharedExamplesFor(@"NGRAnchorPoint", ^(NSDictionary *data) {
    
    __block NGRAnchorPoint *anchorPoint = nil;
    __block NSString *anchorPointName = nil;
    __block NGRAnchorPointLocation location;
    
    beforeEach(^{
        anchorPointName = data[NGRAnchorPointLocationNameKey];
        anchorPoint = data[NGRAnchorPointKey];
        location = [data[NGRAnchorPointLocationKey] integerValue];
    });
    
    it(@"should not be nil", ^{
        expect(anchorPoint).toNot.beNil();
    });
        
    it([NSString stringWithFormat:@"should be initialized with %@ location", [anchorPoint locationName]], ^{
        expect(anchorPoint.location).to.equal(location);
    });
    
    it([NSString stringWithFormat:@"should have a %@ name", [anchorPoint locationName]], ^{
        expect([anchorPoint locationName]).to.equal(anchorPointName);
    });
    
    it(@"should have a proper adjusts and ratios", ^{
        expect(anchorPoint).to.ngr_hasProperFactors();
    });
});

SharedExamplesEnd

SpecBegin(NGRAnchorPointSpec)

describe(@"NGRAnchorPointSpec", ^{
    
    __block NGRAnchorPoint *anchorPoint = nil;
    
    it(@"should have 9 NGRAnchorPointLocation enum elements", ^{
        expect(NGRAnchorPointLocationPointsCount).to.equal(9);
    });
    
    context(@"when initialized with a center", ^{
  
        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationCenter];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationCenter),
                     NGRAnchorPointLocationNameKey : @"Center"};
        });
        
        describe(@"distance between reference point and touch point", ^{
            
            CGPoint expectedPoint = CGPointMake(25.f, 50.f);
            
            beforeEach(^{
                CGSize size = CGSizeMake(50.f, 100.f);
                [anchorPoint setReferencePointWithSize:size];
            });
            
            it(@"should be calculated properly", ^{
                expect(anchorPoint.referencePoint).to.equal(expectedPoint);
            });
        });
        
        describe(@"calculating distance from reference point to point", ^{
            
            __block CGPoint point;
            __block CGFloat distance;
            
            beforeEach(^{
                point = CGPointMake(20.f, 30.f);
            });
            
            it(@"should be calculated properly", ^{
                distance = [anchorPoint distanceFromReferencePointToPoint:point];
                expect(distance).to.beCloseToWithin(36.f, 0.1f); // exact expected value: 36.05551275...
            });
        });
    });
    
    context(@"when initialized with a top left", ^{
        
        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationTopLeft];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationTopLeft),
                     NGRAnchorPointLocationNameKey : @"Top Left"};
        });
    });
    
    context(@"when initialized with a middle left", ^{
        
        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationMiddleLeft];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationMiddleLeft),
                     NGRAnchorPointLocationNameKey : @"Middle Left"};
        });
    });
    
    context(@"when initialized with a bottom left", ^{
        
        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationBottomLeft];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationBottomLeft),
                     NGRAnchorPointLocationNameKey : @"Bottom Left"};
        });
    });
    
    context(@"when initialized with a top right", ^{

        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationTopRight];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationTopRight),
                     NGRAnchorPointLocationNameKey : @"Top Right"};
        });
    });
    
    context(@"when initialized with a middle right", ^{
        
        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationMiddleRight];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationMiddleRight),
                     NGRAnchorPointLocationNameKey : @"Middle Right"};
        });
    });
    
    context(@"when initialized with a bottom right", ^{
        
        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationBottomRight];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationBottomRight),
                     NGRAnchorPointLocationNameKey : @"Bottom Right"};
        });
    });
    
    context(@"when initialized with a top middle", ^{

        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationTopMiddle];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationTopMiddle),
                     NGRAnchorPointLocationNameKey : @"Top Middle"};
        });
    });
    
    context(@"when initialized with a bottom middle", ^{
        
        beforeEach(^{
            anchorPoint = [[NGRAnchorPoint alloc] initWithLocation:NGRAnchorPointLocationBottomMiddle];
        });
        
        itShouldBehaveLike(@"NGRAnchorPoint", ^{
            return @{NGRAnchorPointKey : anchorPoint,
                     NGRAnchorPointLocationKey : @(NGRAnchorPointLocationBottomMiddle),
                     NGRAnchorPointLocationNameKey : @"Bottom Middle"};
        });
    });
});

SpecEnd
