#import "HorizontalStackLayout.h"


@implementation HorizontalStackLayout{
    CGFloat width;
    Border *border;
}

- (id)initWithBorder:(Border *)aBorder {
    self = [super init];
    if (self) {
        width = 0.0;
        border = aBorder;
    }
    return self;
}

+ (HorizontalStackLayout *)create {
    return [[HorizontalStackLayout alloc] initWithBorder:[Border none]];
}

+ (HorizontalStackLayout *)create:(Border *)border {
    return [[HorizontalStackLayout alloc] initWithBorder:border];
}

- (void)positionView:(UIView *)view {
   view.frame = CGRectMake(
           width+border.left,
           view.frame.origin.y+border.top,
           view.frame.size.width,
           view.frame.size.height);
    width += view.frame.size.width+border.left+border.right;
}

- (void)reset {
    width = 0.0;
}

@end