#import <Foundation/Foundation.h>

@interface UIView (Simple)
+ (UIView *)withSize:(CGSize)size;

+ (UIView *)withFrame:(CGRect)frame;

- (void)setOrigin:(CGPoint)point;

- (UIView *)removeSubviews;

- (UIView *)addSubviews:(NSArray *)views;

- (void)positionAtBottomLeftOf:(UIView *)view;

- (void)positionBeyondBottomLeftOf:(UIView *)view;

- (void)positionInCenterOf:(UIView *)view;

- (void)setSize:(CGSize)size;

- (void)addTarget:(id)target action:(SEL)selector;

@end