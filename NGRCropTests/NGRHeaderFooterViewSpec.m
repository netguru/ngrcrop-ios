//
//  NGRHeaderFooterViewSpec.m
//  Carrierwave
//
//  Created by Patryk Kaczmarek on 25.02.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

SpecBegin(NGRHeaderFooterViewSpec)

describe(@"NGRHeaderFooterView", ^{
    
    __block NGRHeaderFooterView *sut;
    
    context(@"when newly created", ^{
        
        beforeEach(^{
            sut = [[NGRHeaderFooterView alloc] init];
        });
        
        afterEach(^{
            sut = nil;
        });
        
        it(@"should not be nil", ^{
            expect(sut).toNot.beNil();
        });
        
        it(@"should have an event messenger", ^{
            expect(sut.messenger).to.beKindOf([NGREventMessenger class]);
            expect(sut.messenger).toNot.beNil();
        });
    });
});

SpecEnd
