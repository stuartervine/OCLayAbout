#import <Foundation/Foundation.h>
#import "GridLayout.h"

@interface UILayoutView : UIView
- (UILayoutView *)initWithLayout:(GridLayout *)layout;

- (void)addSubviews:(NSArray *)views;

- (UILayoutView *)resizeToFitSubviews;

+ (UILayoutView *)withLayout:(GridLayout *)aLayout;
@end