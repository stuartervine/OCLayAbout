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

-(UILayoutView *)resizeToFitSubviews {
    float w = 0;
    float h = 0;

    for (UIView *v in [self subviews]) {
        float fw = v.frame.origin.x + v.frame.size.width;
        float fh = v.frame.origin.y + v.frame.size.height;
        w = MAX(fw, w);
        h = MAX(fh, h);
    }
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, w, h)];
    return self;
}

- (void)dealloc {
    [layout release];
    [super dealloc];
}

+ (UILayoutView *)withLayout:(GridLayout *)aLayout {
    return [[[UILayoutView alloc] initWithLayout:aLayout] autorelease];
}
@end