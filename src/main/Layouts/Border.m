#import "Border.h"

@implementation Border
@synthesize left;
@synthesize top;
@synthesize right;
@synthesize bottom;

- (Border *)initWithLeft:(CGFloat)leftBorder top:(CGFloat)topBorder right:(CGFloat)rightBorder bottom:(CGFloat)bottomBorder {
    self = [super init];
    self.left = leftBorder;
    self.top = topBorder;
    self.right = rightBorder;
    self.bottom = bottomBorder;
    return self;
}

+ (Border *)allSides:(CGFloat)borderWidth {
    return [Border left:borderWidth top:borderWidth right:borderWidth bottom:borderWidth];
}

+ (Border *)left:(CGFloat)leftBorder top:(CGFloat)topBorder right:(CGFloat)rightBorder bottom:(CGFloat)bottomBorder {
    return [[[Border alloc] initWithLeft:leftBorder top:topBorder right:rightBorder bottom:bottomBorder] autorelease];
}

+ (Border *)none {
    return [Border allSides:0];
}
@end