#import <Foundation/Foundation.h>

@interface GridLayout : NSObject
- (GridLayout *)initWithColumns:(int)numberOfColumns border:(int)aBorder rowHeight:(int)aRowHeight;

- (void)positionView:(UIView *)subview index:(int)index;

+ (GridLayout *)columns:(int)numberOfColumns rowHeight:(int)rowHeight border:(int)border;
@end