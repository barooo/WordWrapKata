#import "NSString+WordWrap.h"

NSString * trimLeadingSpace(NSString *str);
void backtrackToSpace(NSString **thisLine, NSString **theRest, NSString *str);
BOOL didSplitMidword(size_t len, NSString *str);

@implementation NSString (WordWrap)

-(NSString*) wrapToLength: (size_t) len {
	if ([self length] <= len) {
		return self;
	} else {
		NSString *thisLine = [self substringToIndex: len];
		NSString *theRest = trimLeadingSpace([self substringFromIndex: len]);
		
		if (didSplitMidword(len,self)) {
			backtrackToSpace(&thisLine,&theRest,self);
		}
		return [NSString stringWithFormat: @"%@\n%@", thisLine, [theRest wrapToLength: len]];
	}
}

NSString * trimLeadingSpace(NSString *str) {
	NSString *trimmed=str;
	if ([str characterAtIndex: 0] == ' ') {
		trimmed = [str substringFromIndex: 1];
	}
	return trimmed;
}

void backtrackToSpace(NSString **thisLine, NSString **theRest, NSString *str) {
	NSRange rangeOfLastSpace = [*thisLine rangeOfString: @" " options: NSBackwardsSearch];
	if (rangeOfLastSpace.length > 0) {
		*thisLine = [str substringToIndex: rangeOfLastSpace.location];
		*theRest = trimLeadingSpace([str substringFromIndex: rangeOfLastSpace.location]);
	}
	
}
BOOL didSplitMidword(size_t len,NSString *str) {
	return [str characterAtIndex: len] != ' ';
	
}
@end
