#import <Foundation/Foundation.h>
#import "Border.h"
#import "Layout.h"

@interface GridLayout : NSObject <Layout>
- (GridLayout *)initWithColumns:(int)numberOfColumns border:(Border *)aBorder width:(int)width offset:(CGPoint)offset;

+ (GridLayout *)columns:(int)numberOfColumns border:(Border *)border;

+ (GridLayout *)columns:(int)numberOfColumns border:(Border *)border width:(int)width offset:(CGPoint)offset;

@end