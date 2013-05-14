#import <Foundation/Foundation.h>

@interface Functional : NSObject
+ (NSNumber *)filter:(UIView *)viewToFilterOut sumReduce:(NSNumber * (^)(UIView *))reduceBlock;

+ (id)reduce:(NSArray *)elements withBlock:(id (^)(id, id))reduceBlock;

@end