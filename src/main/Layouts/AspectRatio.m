#import "AspectRatio.h"


@implementation AspectRatio
@synthesize ratio = _ratio;


- (AspectRatio *)initWithWidth:(CGFloat)aWidth height:(CGFloat)aHeight {
    self = [super init];
    self.ratio = aWidth / aHeight;
    return self;
}

- (CGFloat)heightFromWidth:(CGFloat)width {
    return width/self.ratio;
}

+ (AspectRatio *)fromView:(UIView *)view {
    return [[[AspectRatio alloc] initWithWidth:view.frame.size.width height:view.frame.size.height] autorelease];
}
@end