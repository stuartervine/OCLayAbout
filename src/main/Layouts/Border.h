#import <Foundation/Foundation.h>

@interface Border : NSObject
@property(nonatomic, assign) CGFloat left;

@property(nonatomic, assign) CGFloat top;

@property(nonatomic, assign) CGFloat right;

@property(nonatomic, assign) CGFloat bottom;

- (Border *)initWithLeft:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom;

+ (Border *)allSides:(CGFloat)borderWidth;

+ (Border *)left:(CGFloat)leftBorder top:(CGFloat)topBorder right:(CGFloat)rightBorder bottom:(CGFloat)bottomBorder;

+ (Border *)none;
@end