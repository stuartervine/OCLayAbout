#import "Functional.h"


@implementation Functional

+ (NSNumber *)filter:(UIView *)viewToFilterOut sumReduce:(NSNumber * (^)(UIView *))reduceBlock {
    int total = 0;
    for (UIView *subview in viewToFilterOut.superview.subviews) {
        if(subview != viewToFilterOut) {
            total += reduceBlock(subview).intValue;
        }
    }
    return @(total);
}

+ (id)reduce:(NSArray *)elements withBlock:(id (^)(id, id))reduceBlock {
    id thing;
    for (id element in elements) {
        thing = reduceBlock(thing, element);
    }
    return thing;
}

@end