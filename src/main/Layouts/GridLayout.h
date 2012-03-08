#import <Foundation/Foundation.h>
#import "Border.h"

@interface GridLayout : NSObject
- (GridLayout *)initWithColumns:(int)numberOfColumns border:(Border *)aBorder;

- (void)positionView:(UIView *)subview index:(int)index;

+ (GridLayout *)columns:(int)numberOfColumns border:(Border *)border;
@end