#import <Foundation/Foundation.h>
#import "UILayoutView.h"

@interface Layouts : NSObject
+ (UILayoutView *)verticalViewContaining:(NSArray *)subviews properties:(NSArray *)properties cellBorder:(Border *)cellBorder;

+ (UIView *)component:(UIView *)view properties:(NSArray *)properties;

+ (UIView *)relativeView:(NSArray *)properties;

+ (UILayoutView *)horizontalViewContaining:(NSArray *)subviews properties:(NSArray *)properties cellBorder:(Border *)border;
@end

static UILayoutView *verticalView(NSArray *subviews, NSArray *properties, Border *border) {
    return [Layouts verticalViewContaining:subviews properties:properties cellBorder:border];
};

static UILayoutView *horizontalView(NSArray *subviews, NSArray *properties, Border *border) {
    return [Layouts horizontalViewContaining:subviews properties:properties cellBorder:border];
};

static UIView *relativeView(NSArray *properties) {
    return [Layouts relativeView:properties];
};

static UIView * component(UIView *component, NSArray *properties) {
    return [Layouts component:component properties:properties];
}

static UIView * box(UIView *component) {
    UIView *boxView = [[UIView alloc] init];
    [boxView addSubview:component];
    boxView.frame = component.frame;
    return boxView;
}

static UIView * fixedSizeSpacer(int width, int height) {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
}