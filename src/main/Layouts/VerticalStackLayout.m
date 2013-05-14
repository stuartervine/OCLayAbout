#import "VerticalStackLayout.h"


@interface VerticalStackLayout ()
@property(nonatomic) float height;
@property(nonatomic, strong) Border *border;
@end

@implementation VerticalStackLayout

- (id)initWithBorder:(Border *)aBorder {
    self = [super init];
    if (self) {
        self.height = 0.0;
        self.border = aBorder;
    }
    return self;
}

+ (VerticalStackLayout *)create {
    return [[VerticalStackLayout alloc] initWithBorder:[Border none]];
}

+ (VerticalStackLayout *)create:(Border *)border {
    return [[VerticalStackLayout alloc] initWithBorder:border];
}

- (void)positionView:(UIView *)view {
   view.frame = CGRectMake(
           view.frame.origin.x+self.border.left,
           self.height+self.border.top,
           view.frame.size.width,
           view.frame.size.height+self.border.bottom);
    self.height += view.frame.size.height+self.border.top;
}

- (void)reset {
    self.height = 0.0;
}

@end