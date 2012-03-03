#import <Foundation/Foundation.h>
#import "GridLayout.h"

@interface UILayoutView : UIView
- (UILayoutView *)initWithLayout:(GridLayout *)layout;

- (void)addSubviews:(NSArray *)views;

+ (UILayoutView *)withLayout:(GridLayout *)aLayout;
@end