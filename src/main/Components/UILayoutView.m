#import "UILayoutView.h"

@implementation UILayoutView {
    GridLayout *layout;
    int index;
}

- (UILayoutView *)initWithLayout:(GridLayout *)aLayout {
    self = [super init];
    layout = [aLayout retain];
    return self;
}

- (void)addSubview:(UIView *)view {
    [layout positionView:view index:index++];
    [super addSubview:view];
}

-(void)addSubviews:(NSArray *)views {
    for(UIView *view in views) {
        [self addSubview:view];
    }
}

- (void)dealloc {
    [layout release];
    [super dealloc];
}

+ (UILayoutView *)withLayout:(GridLayout *)aLayout {
    return [[[UILayoutView alloc] initWithLayout:aLayout] autorelease];
}
@end