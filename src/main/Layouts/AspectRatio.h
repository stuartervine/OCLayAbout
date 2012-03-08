#import <Foundation/Foundation.h>

@interface AspectRatio : NSObject

@property(nonatomic, assign) CGFloat ratio;

- (AspectRatio *)initWithWidth:(CGFloat)width height:(CGFloat)height;

- (CGFloat)heightFromWidth:(CGFloat)width;

+ (AspectRatio *)fromView:(UIView *)view;
@end