#import <objc/runtime.h>
#import "UIView+Layout.h"
#import "Functional.h"

static char layoutMutations;
static char moveToSuperviewMutations;

@implementation UIView (Layout)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceSelector:@selector(layoutSubviews)
                      withNewSelector:@selector(layoutSubviewsWithMutations)];
        [self swizzleInstanceSelector:@selector(didMoveToSuperview)
                      withNewSelector:@selector(didMoveToSuperviewWithMutations)];
    });
}

- (void)addOnLayoutMutation:(VIEW_MUTATION)mutation {
    [[self layoutMutations] addObject:mutation];
}

- (void)addOnMoveToSuperviewMutation:(VIEW_MUTATION)mutation {
    [[self moveToSuperviewMutations] addObject:mutation];
}

- (NSMutableArray *)layoutMutations {
    if (!objc_getAssociatedObject(self, &layoutMutations)) {
        objc_setAssociatedObject(self, &layoutMutations, [NSMutableArray array], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, &layoutMutations);
}

- (NSMutableArray *)moveToSuperviewMutations {
    if (!objc_getAssociatedObject(self, &moveToSuperviewMutations)) {
        objc_setAssociatedObject(self, &moveToSuperviewMutations, [NSMutableArray array], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, &moveToSuperviewMutations);
}

- (void)layoutSubviewsWithMutations {
    for (VIEW_MUTATION mutation in [self layoutMutations]) {
        mutation(self);
    }
    // call the old implementation, swizzled out at runtime...
    [self layoutSubviewsWithMutations];
}

- (void)didMoveToSuperviewWithMutations {
    for (VIEW_MUTATION mutation in [self moveToSuperviewMutations]) {
        mutation(self);
    }
    // call the old implementation, swizzled out at runtime...
    [self didMoveToSuperviewWithMutations];
}

+ (void)swizzleInstanceSelector:(SEL)originalSelector
                withNewSelector:(SEL)newSelector {
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method newMethod = class_getInstanceMethod(self, newSelector);

    BOOL methodAdded = class_addMethod([self class],
            originalSelector,
            method_getImplementation(newMethod),
            method_getTypeEncoding(newMethod));

    if (methodAdded) {
        class_replaceMethod([self class],
                newSelector,
                method_getImplementation(originalMethod),
                method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

- (NSNumber *)contentHeight {
    return [Functional reduce:[self subviews] withBlock:^(NSNumber *size, UIView *subview) {
        NSNumber *subviewVertical = @(subview.frame.size.height + subview.frame.origin.y);
        return (size && subviewVertical.intValue > size.intValue) ? subviewVertical : size;
    }];
}

- (NSNumber *)contentWidth {
    return [Functional reduce:[self subviews] withBlock:^(NSNumber *size, UIView *subview) {
        NSNumber *subviewHorizontal = @(subview.frame.size.width + subview.frame.origin.x);
        return (size && subviewHorizontal.intValue > size.intValue) ? subviewHorizontal : size;
    }];
}

@end