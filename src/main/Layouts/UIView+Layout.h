#import <Foundation/Foundation.h>
#import "LayoutProperties.h"

@interface UIView (Layout)
-(void)addOnLayoutMutation:(VIEW_MUTATION)mutation;

- (void)addOnMoveToSuperviewMutation:(VIEW_MUTATION)mutation;

- (NSNumber *)contentHeight;

- (NSNumber *)contentWidth;
@end