#import "Layouts.h"
#import "VerticalStackLayout.h"
#import "LayoutProperties.h"
#import "HorizontalStackLayout.h"

@implementation Layouts

+ (UILayoutView *)horizontalViewContaining:(NSArray *)subviews properties:(NSArray *)properties cellBorder:(Border *)border {
    UILayoutView *view = [UILayoutView withLayout:[HorizontalStackLayout create:border] fill:NO frame:CGRectZero];
    [view addSubviews:subviews];
    for (VIEW_MUTATION mutation in properties) {
        view = (UILayoutView *) mutation(view);
    }
    return view;
}

+ (UILayoutView *)verticalViewContaining:(NSArray *)subviews properties:(NSArray *)properties cellBorder:(Border *)cellBorder {
    UILayoutView *view = [UILayoutView withLayout:[VerticalStackLayout create:cellBorder] fill:NO frame:CGRectZero];
    [view addSubviews:subviews];
    for (VIEW_MUTATION mutation in properties) {
        view = (UILayoutView *) mutation(view);
    }
    return view;
}

+ (UIView *)component:(UIView *)view properties:(NSArray *)properties {
    for (VIEW_MUTATION mutation in properties) {
        view = (UILayoutView *) mutation(view);
    }
    return view;
}

+ (UIView *)relativeView:(NSArray *)properties {
    UIView *view = [[UIView alloc] init];
    for (VIEW_MUTATION mutation in properties) {
        view = (UILayoutView *) mutation(view);
    }
    return view;
}
@end