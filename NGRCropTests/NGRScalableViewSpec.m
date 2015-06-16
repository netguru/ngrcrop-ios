//
//  NGRScalableViewSpec.m
//  Carrierwave
//
//  Created by Paweł Białecki on 09.02.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

SpecBegin(NGRScalableViewSpec)

describe(@"NGRScalableViewSpec", ^{
    
    __block NGRScalableView *scalableView = nil;
    
    beforeEach(^{
        scalableView = [[NGRScalableView alloc] init];
    });
    
    afterEach(^{
        scalableView = nil;
    });
    
    it(@"when newly created, should be initialized properly", ^{
        expect(scalableView).toNot.beNil();
        expect(scalableView.borderView).toNot.beNil();
        expect(scalableView.ratioEnabled).to.beFalsy();
        expect(scalableView.minSize).to.equal(CGSizeMake(50.f, 50.f));
        expect(scalableView.maxSize).to.equal(CGSizeMake(300.f, 300.f));
        expect(scalableView.animationDuration).to.equal(1.0f);
        expect(scalableView.animationCurve).to.equal(UIViewAnimationOptionCurveEaseInOut);
        expect(scalableView.springDamping).to.equal(0.9f);
        expect(scalableView.springVelocity).to.equal(13.f);
    });
    
    context(@"when setting square frame", ^{
        
        beforeEach(^{
            [scalableView setFrame:CGRectMake(100, 100, 100, 100)];
        });
        
        it(@"should return correct ratio", ^{
            expect([scalableView currentRatio]).to.equal(1.f);
        });
    });
    
    context(@"when setting rectangle frame", ^{
        
        beforeEach(^{
            [scalableView setFrame:CGRectMake(100, 100, 100, 133)];
        });
        
        it(@"should return correct ratio", ^{
            expect([scalableView currentRatio]).to.beCloseToWithin(0.75f, 0.01f); // exact expected value: 0,7518796992...
        });
    });
    
    context(@"when setting minimum size", ^{
        
        it(@"with negative width value, should raise an exception", ^{
            expect(^{
                scalableView.minSize = CGSizeMake(-5.f, -10.f);
            }).to.raiseWithReason(NSInternalInconsistencyException, @"Min width cannot be smaller or equal to 0!");
        });
        
        it(@"with negative height value, should raise an exception", ^{
            expect(^{
                scalableView.minSize = CGSizeMake(10.f, -5.f);
            }).to.raiseWithReason(NSInternalInconsistencyException, @"Min height cannot be smaller or equal to 0!");
        });
        
        it(@"with zero width value, should raise an exception", ^{
            expect(^{
                scalableView.minSize = CGSizeMake(0, 10.f);
            }).to.raiseWithReason(NSInternalInconsistencyException, @"Min width cannot be smaller or equal to 0!");
        });
        
        it(@"with zero height value, should raise an exception", ^{
            expect(^{
                scalableView.minSize = CGSizeMake(30.f, 0);
            }).to.raiseWithReason(NSInternalInconsistencyException, @"Min height cannot be smaller or equal to 0!");
        });
        
        it(@"with positive values, should set minimal size properly", ^{
            expect(^{
                scalableView.minSize = CGSizeMake(10.f, 20.f);
            }).toNot.raise(NSInternalInconsistencyException);
            
            expect(scalableView.minSize).to.equal(CGSizeMake(10.f, 20.f));
        });
    });
    
    context(@"when setting maximum size", ^{
        
        it(@"with negative width value, should raise an exception", ^{
            expect(^{
                scalableView.maxSize = CGSizeMake(-5.f, -10.f);
            }).to.raiseWithReason(NSInternalInconsistencyException, @"Max width cannot be smaller or equal to 0!");
        });
        
        it(@"with negative height value, should raise an exception", ^{
            expect(^{
                scalableView.maxSize = CGSizeMake(10.f, -5.f);
            }).to.raiseWithReason(NSInternalInconsistencyException, @"Max height cannot be smaller or equal to 0!");
        });
        
        it(@"with zero width value, should raise an exception", ^{
            expect(^{
                scalableView.maxSize = CGSizeMake(0, 10.f);
            }).to.raiseWithReason(NSInternalInconsistencyException, @"Max width cannot be smaller or equal to 0!");
        });
        
        it(@"with zero height value, should raise an exception", ^{
            expect(^{
                scalableView.maxSize = CGSizeMake(30.f, 0);
            }).to.raiseWithReason(NSInternalInconsistencyException, @"Max height cannot be smaller or equal to 0!");
        });
        
        it(@"smaller than minimum size, should set maximum size same as minimum size", ^{
            scalableView.minSize = CGSizeMake(100.f, 100.f);
            scalableView.maxSize = CGSizeMake(30.f, 30.f);
            expect(scalableView.maxSize).to.equal(CGSizeMake(100.f, 100.f));
        });
        
        it(@"greater than minimum size, should set maximum size properly", ^{
            scalableView.minSize = CGSizeMake(100.f, 100.f);
            scalableView.maxSize = CGSizeMake(200.f, 200.f);
            expect(scalableView.maxSize).to.equal(CGSizeMake(200.f, 200.f));
        });
    });
});

SpecEnd
