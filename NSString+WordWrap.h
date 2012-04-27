//
//  NSString+WordWrap.h
//  WordWrapKata
//
//  Created by John Richardson on 4/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSString (WordWrap) 

- (NSString*) wrapToLength: (size_t) len;
@end
