//
//  NGRRatioItemSpec.m
//  Carrierwave
//
//  Created by Patryk Kaczmarek on 25.02.2015.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

SpecBegin(NGRRatioItemSpec)

describe(@"NGRRatioItem", ^{
   
    __block NGRRatioItem *sut;
    
    context(@"when newly created", ^{
        
        beforeEach(^{
            sut = [[NGRRatioItem alloc] initWithTitle:@"Fixture Value" ratio:1.f];
        });
        
        afterEach(^{
            sut = nil;
        });
        
        it(@"should not be nil", ^{
            expect(sut).toNot.beNil();
        });
        
        it(@"should have proper set title", ^{
            expect(sut.title).to.equal(@"Fixture Value");
        });
        
        it(@"should have proper set ratio", ^{
            expect(sut.ratio).to.equal(1.f);
        });
    });
});

SpecEnd
