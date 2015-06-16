//
//  NGRScalableBorderSpec.m
//  Carrierwave
//
//  Created by Paweł Białecki on 03.02.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

#import "NGRScalableBorder.h"

SpecBegin(NGRScalableBorderSpec)

describe(@"NGRScalableBorderSpec", ^{
    
    __block NGRScalableBorder *scalableBorder = nil;
    
    beforeEach(^{
        scalableBorder = [[NGRScalableBorder alloc] init];
    });
    
    afterEach(^{
        scalableBorder = nil;
    });
    
    context(@"when newly created", ^{
        
        it(@"should be initialized", ^{
            expect(scalableBorder).toNot.beNil();
        });
        
        it(@"should have exactly 3 available grid drawing modes", ^{
            expect(NGRGridDrawingModeNever).to.equal(2); // 2, because 1st enum is indexed as 0.
        });
        
        it(@"should have exactly 3 available anchor drawing modes", ^{
            expect(NGRAnchorsDrawingModeNever).to.equal(2);
        });
        
        it(@"should have exactly 3 available grid styles", ^{
            expect(NGRGridStyleDotted).to.equal(2);
        });
        
        it(@"should have exactly 3 available border styles", ^{
            expect(NGRBorderStyleDotted).to.equal(2);
        });
        
        it(@"should be initialized properly", ^{
            expect(scalableBorder.gridColor).to.equal([[UIColor whiteColor] colorWithAlphaComponent:0.5f]);
            expect(scalableBorder.gridDrawingMode).to.equal(NGRGridDrawingModeOnResizing);
            expect(scalableBorder.gridStyle).to.equal(NGRGridStyleContinuous);
            expect(scalableBorder.gridThickness).to.equal(1);
            expect(scalableBorder.numberOfGridlines).to.equal(4);
            
            expect(scalableBorder.borderColor).to.equal([UIColor colorWithWhite:0.9f alpha:1]);
            expect(scalableBorder.borderStyle).to.equal(NGRBorderStyleContinuous);
            expect(scalableBorder.borderThickness).to.equal(1);
            expect(scalableBorder.borderInset).to.equal(5);
            
            expect(scalableBorder.anchorsColor).to.equal([UIColor whiteColor]);
            expect(scalableBorder.anchorsDrawingMode).to.equal(NGRAnchorsDrawingModeAlways);
            expect(scalableBorder.anchorThickness).to.equal(2);
        });
    });
    
    describe(@"setting number of gridlines", ^{
        
        context(@"with negative value", ^{
            
            it(@"should be done properly", ^{
                [scalableBorder setNumberOfGridlines:-5];
                
                expect(scalableBorder.numberOfGridlines).toNot.equal(-5);
                expect(scalableBorder.numberOfGridlines).to.equal(0);
            });
        });
        
        context(@"with zero value", ^{
            
            it(@"should be done properly", ^{
                [scalableBorder setNumberOfGridlines:0];
                
                expect(scalableBorder.numberOfGridlines).to.equal(0);
            });
        });
        
        context(@"with positive value", ^{
            
            it(@"should be done properly", ^{
                [scalableBorder setNumberOfGridlines:8];
                
                expect(scalableBorder.numberOfGridlines).to.equal(8);
            });
        });
    });
});

SpecEnd
