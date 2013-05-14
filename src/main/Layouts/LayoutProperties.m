#import <CoreGraphics/CoreGraphics.h>
#import "LayoutProperties.h"
#import "UIView+Layout.h"
#import "Functional.h"


@implementation LayoutProperties

+ (VIEW_MUTATION)frame:(CGRect)rect {
    return ^(UIView *viewToMutate) {
        viewToMutate.frame = rect;
        return viewToMutate;
    };
}

+ (VIEW_MUTATION)marginLeft:(int)left top:(int)top right:(int)right bottom:(int)bottom {
    return [LayoutProperties addLayoutMutation:^(UIView *view) {
        CGRect marginedFrame = CGRectMake(
                view.frame.origin.x + left,
                view.frame.origin.y + top,
                view.frame.size.width - (right + left),
                view.frame.size.height - (top + bottom)
        );
        view.frame = marginedFrame;
        return view;
    }];
}

+ (VIEW_MUTATION)backgroundColor:(UIColor *)color {
    return ^(UIView *view) {
        view.backgroundColor = color;
        return view;
    };
}

+ (VIEW_MUTATION)widthFillParent {
    return [LayoutProperties addLayoutMutation:^(UIView *view) {
        if (view.superview) {
            view.frame = CGRectMake(
                    view.frame.origin.x,
                    view.frame.origin.y,
                    view.superview.frame.size.width,
                    view.frame.size.height
            );
        }
        return view;
    }];
}

+ (VIEW_MUTATION)height:(int)height {
    return ^(UIView *viewToMutate) {
        CGRect heightConstrainedFrame = CGRectMake(
                viewToMutate.frame.origin.x,
                viewToMutate.frame.origin.y,
                viewToMutate.frame.size.width,
                height
        );
        viewToMutate.frame = heightConstrainedFrame;
        return viewToMutate;
    };
}

+ (VIEW_MUTATION)width:(int)width {
    return ^(UIView *viewToMutate) {
        CGRect widthConstrainedFrame = CGRectMake(
                viewToMutate.frame.origin.x,
                viewToMutate.frame.origin.y,
                width,
                viewToMutate.frame.size.height
        );
        viewToMutate.frame = widthConstrainedFrame;
        return viewToMutate;
    };
}

+ (VIEW_MUTATION)heightFillParent {
    return [LayoutProperties addLayoutMutation:^(UIView *view) {
        if (view.superview) {
            view.frame = CGRectMake(
                    view.frame.origin.x,
                    view.frame.origin.y,
                    view.frame.size.width,
                    view.superview.frame.size.height
            );
            [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
            [view layoutIfNeeded];
        }
        return view;
    }];
}

+ (VIEW_MUTATION)heightFillAvailable {
    return [LayoutProperties addLayoutMutation:^(UIView *view) {
        if (view.superview) {
            NSNumber *fixedViewHeight = [Functional filter:view sumReduce:^(UIView *subview) {
                return @(subview.frame.size.height);
            }];
            CGFloat remainingHeight = view.superview.frame.size.height - [fixedViewHeight intValue];
            view.frame = CGRectMake(
                    view.frame.origin.x,
                    view.frame.origin.y,
                    view.frame.size.width,
                    remainingHeight
            );
        }
        return view;
    }];
}

+ (VIEW_MUTATION)paddingLeft:(int)left top:(int)top right:(int)right bottom:(int)bottom {
    return [LayoutProperties addLayoutMutation:^(UIView *view) {
        UIView *wrapper = [[UIView alloc] initWithFrame:view.frame];
        view.frame = UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsetsMake(top, left, bottom, right));
        [wrapper insertSubview:view atIndex:0];
        return wrapper;
    }];
}

+ (VIEW_MUTATION)addLayoutMutation:(VIEW_MUTATION)layoutMutation {
    return ^(UIView *view) {
        [view addOnLayoutMutation:layoutMutation];
        return view;
    };
}

+ (VIEW_MUTATION)addMoveToSuperviewMutation:(VIEW_MUTATION)mutation {
    return ^(UIView *view) {
        [view addOnMoveToSuperviewMutation:mutation];
        return view;
    };
}

+ (VIEW_MUTATION)widthWrapContent {
    return [LayoutProperties addMoveToSuperviewMutation:^(UIView *view) {
        view.frame = CGRectMake(
                view.frame.origin.x,
                view.frame.origin.y,
                [[view contentWidth] floatValue],
                view.frame.size.height
        );
        return view;
    }];
}

+ (VIEW_MUTATION)heightWrapContent {
    return [LayoutProperties addMoveToSuperviewMutation:^(UIView *view) {
        view.frame = CGRectMake(
                view.frame.origin.x,
                view.frame.origin.y,
                view.frame.size.width,
                [[view contentHeight] floatValue]
        );
        return view;
    }];
}

+ (VIEW_MUTATION)alignParentBottom {
    return [LayoutProperties addLayoutMutation:^UIView *(UIView *view) {
        view.frame = CGRectMake(
                view.frame.origin.x,
                (44 + view.superview.bounds.origin.y + view.superview.bounds.size.height - view.frame.size.height), //TODO: Figure out the titlebar height 44!
                view.frame.size.width,
                view.frame.size.height
        );
        return view;
    }];
}

+ (VIEW_MUTATION)alignParentTop {
    return [LayoutProperties addLayoutMutation:^UIView *(UIView *view) {
        view.frame = CGRectMake(
                view.frame.origin.x,
                0,
                view.frame.size.width,
                view.frame.size.height
        );
        return view;
    }];
}

+ (VIEW_MUTATION)alignParentRight {
    return [LayoutProperties addLayoutMutation:^UIView *(UIView *view) {
        view.frame = CGRectMake(
                view.superview.frame.size.width - view.frame.size.width,
                view.frame.origin.y,
                view.frame.size.width,
                view.frame.size.height
        );
        return view;
    }];
}

+ (VIEW_MUTATION)alignParentLeft {
    return [LayoutProperties addLayoutMutation:^UIView *(UIView *view) {
        view.frame = CGRectMake(
                0,
                view.frame.origin.y,
                view.frame.size.width,
                view.frame.size.height
        );
        return view;
    }];
}

+ (VIEW_MUTATION)widthFillAvailable {
    return [LayoutProperties addLayoutMutation:^(UIView *view) {
        if (view.superview) {
            NSNumber *fixedViewWidth = [Functional filter:view sumReduce:^(UIView *subview) {
                return @(subview.frame.size.width);
            }];
            CGFloat remainingWidth = view.superview.frame.size.width - [fixedViewWidth intValue];
            view.frame = CGRectMake(
                    view.frame.origin.x,
                    view.frame.origin.y,
                    remainingWidth,
                    view.frame.size.height
            );
        }
        return view;
    }];
}

+ (VIEW_MUTATION)centerHorizontally {
    return [LayoutProperties addLayoutMutation:^UIView *(UIView *view) {
        CGFloat centerHorizontal = view.superview.frame.size.width / 2;
        view.frame = CGRectMake(
                centerHorizontal - (view.frame.size.width/2),
                view.frame.origin.y,
                view.frame.size.width,
                view.frame.size.height
        );
        return view;
    }];
}

+ (VIEW_MUTATION)centerVertically {
    return [LayoutProperties addLayoutMutation:^UIView *(UIView *view) {
        CGFloat centerVertical = view.superview.frame.size.height / 2;
        view.frame = CGRectMake(
                view.frame.origin.x,
                centerVertical - (view.frame.size.height/2),
                view.frame.size.width,
                view.frame.size.height
        );
        return view;
    }];
}
@end