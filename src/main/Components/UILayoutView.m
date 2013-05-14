#import "UILayoutView.h"
#import "UIView+Simple.h"
#import "VerticalStackLayout.h"
#import "HorizontalStackLayout.h"

@implementation UILayoutView {
    id <Layout> layout;
    BOOL fillSpaceAvailable;
}

- (UILayoutView *)initWithLayout:(id <Layout>)aLayout fill:(BOOL)fill frame:(CGRect)aFrame {
    self = [super initWithFrame:aFrame];
    layout = aLayout;
    fillSpaceAvailable = fill;
    return self;
}

- (void)addSubview:(UIView *)view {
    [super addSubview:view];
    [self sizeToFit];
}

- (UIView *)addSubviews:(NSArray *)views {
    for (UIView *view in views) {
        [self addSubview:view];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self applyLayout];
}

- (void)applyLayout {
    [layout reset];
    for (UIView *subview in self.subviews) {
        [layout positionView:subview];
    }
}

- (UILayoutView *)removeSubviews {
    [super removeSubviews];
    [layout reset];
    return self;
}

+ (UILayoutView *)withLayout:(id <Layout>)aLayout fill:(BOOL)fill {
    return [[UILayoutView alloc] initWithLayout:aLayout fill:fill frame:CGRectZero];
}

+ (UILayoutView *)withLayout:(id <Layout>)aLayout fill:(BOOL)fill frame:(CGRect)aFrame {
    return [[UILayoutView alloc] initWithLayout:aLayout fill:fill frame:aFrame];
}

+ (UILayoutView *)withLayout:(id <Layout>)aLayout fill:(BOOL)fill size:(CGSize)size {
    return [[UILayoutView alloc] initWithLayout:aLayout fill:fill frame:CGRectMake(0, 0, size.width, size.height)];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (fillSpaceAvailable) {
        self.frame = newSuperview.bounds;
    }
    [super willMoveToSuperview:newSuperview];
//    [self applyLayout];
}

+ (UILayoutView *)vertical:(Border *)border {
    return [UILayoutView withLayout:[VerticalStackLayout create:border] fill:NO];
}

+ (UILayoutView *)horizontal:(Border *)border {
    return [UILayoutView withLayout:[HorizontalStackLayout create:border] fill:YES];

}
@end