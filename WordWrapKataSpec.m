//
//  untitled.m
//  WordWrapKata
//
//  Created by John Richardson on 4/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSString+WordWrap.h"

@interface WordWrapKataSpec : SenTestCase 
@end

@implementation WordWrapKataSpec

- (void) test_x_1_is_x {
	STAssertEqualObjects([@"x" wrapToLength: 1], @"x", nil);
}

- (void) test_xx_1_is_xNx {
	STAssertEqualObjects([@"xx" wrapToLength: 1], @"x\nx", nil);
}

- (void) test_xx_2_is_xx {
	STAssertEqualObjects([@"xx" wrapToLength: 2], @"xx", nil);
}

- (void) test_xxx_1_is_xNxNx {
	STAssertEqualObjects([@"xxx" wrapToLength: 1], @"x\nx\nx", nil);
}

- (void) test_xx_x_2_is_xxNx {
	STAssertEqualObjects([@"xx x" wrapToLength: 2], @"xx\nx", nil);
}

- (void) test_x_xx_2_is_xNxx {
	STAssertEqualObjects([@"x xx" wrapToLength: 2], @"x\nxx", nil);
}

- (void) test_xx_xxxx_4_is_xxNxxxx {
	STAssertEqualObjects([@"xx xxxx" wrapToLength: 4], @"xx\nxxxx", nil);
}

- (void) test_xx_xx_xxxx_4_is_xx_xxNxxxx {
	STAssertEqualObjects([@"x xx xxxx" wrapToLength: 4], @"x xx\nxxxx", nil);
}

- (void) testFullAcceptance {
	NSString *source = @"And when he came back to, he was flat on his back on the beach in the freezing sand, and it was raining out of a low sky, and the tide was way out.";
    NSString *wrapped = @"And when he came\nback to, he was flat\non his back on the\nbeach in the\nfreezing sand, and\nit was raining out\nof a low sky, and\nthe tide was way\nout.";
	
	STAssertEqualObjects([source wrapToLength: 20], wrapped, nil);
}

- (void) testRandyAcceptance {
	NSString *source = @"Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.";
	NSString *wrapped = @"Four score and seven\nyears ago our\nfathers brought\nforth on this\ncontinent, a new\nnation, conceived in\nLiberty, and\ndedicated to the\nproposition that all\nmen are created\nequal.";
	
	STAssertEqualObjects([source wrapToLength: 20], wrapped, nil);
}


@end
