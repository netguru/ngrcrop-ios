//
//  NGRAlertControllerSpec.m
//  Carrierwave
//
//  Created by Patryk Kaczmarek on 02.03.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

SpecBegin(NGRAlertControllerSpec)

describe(@"NGRAlertController", ^{
    
    __block NGRAlertController *sut;
    
    context(@"when initialized with empty list", ^{
        
        beforeEach(^{
            sut = [[NGRAlertController alloc] initWithList:nil actionHandler:nil];
        });
        
        afterEach(^{
            sut = nil;
        });
        
        it(@"should title be set properly.", ^{
            expect(sut.title).to.equal(@"Select crop rectangle ratio:");
        });
        
        it(@"should have 1 action", ^{
            expect(sut.actions).to.haveCountOf(1);
        });
        
        it(@"should 1st button have proper title", ^{
            UIAlertAction *action = sut.actions[0];
            expect(action.title).to.equal(@"Cancel");
        });
    });
    
    context(@"when initialized with list", ^{
        
        beforeEach(^{
            NSArray *array = @[[[NGRRatioItem alloc] initWithTitle:@"Fixture Title" ratio:0.75f]];
            sut = [[NGRAlertController alloc] initWithList:array actionHandler:nil];
        });
        
        afterEach(^{
            sut = nil;
        });
        
        it(@"should have 2 action", ^{
            expect(sut.actions).to.haveCountOf(2);
        });
        
        it(@"should have proper title", ^{
            UIAlertAction *action = sut.actions[0];
            expect(action.title).to.equal(@"Fixture Title");
        });
        
    });
});

SpecEnd
