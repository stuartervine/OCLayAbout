#import "UIView+Simple.h"

@implementation UIView (Simple)

+ (UIView *)withSize:(CGSize)size {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
}
+ (UIView *)withFrame:(CGRect)frame {
    return [[UIView alloc] initWithFrame:frame];
}

- (void)setOrigin:(CGPoint)point {
    [self setFrame:CGRectMake(point.x, point.y, self.frame.size.width, self.frame.size.height)];
}

-(UIView *)removeSubviews {
    for (UIView *subview in self.subviews) {
        [subview removeSubviews];
    }
    return self;
}

-(UIView *)addSubviews:(NSArray *)views {
    for (UIView *subview in views) {
        [self addSubview:subview];
    }
    return self;
}

- (void)positionAtBottomLeftOf:(UIView *)view {
    self.frame = CGRectMake(view.frame.origin.x, view.frame.size.height - (self.frame.size.height), self.frame.size.width, self.frame.size.height);
}

- (void)positionBeyondBottomLeftOf:(UIView *)view {
    self.frame = CGRectMake(view.frame.origin.x, view.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (void)positionInCenterOf:(UIView *)view {
    [self setOrigin:CGPointMake((view.bounds.size.width/2)-self.frame.size.width/2, (view.bounds.size.height/2)-self.frame.size.height/2)];
}

- (void)setSize:(CGSize)size {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height)];
}

- (void)addTarget:(id)target action:(SEL)selector {
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:selector]];
}
@end