#import <Foundation/Foundation.h>
#import "Border.h"
#import "Layout.h"

@interface HorizontalStackLayout : NSObject <Layout>
- (id)initWithBorder:(Border *)aBorder;

+ (HorizontalStackLayout *)create;

+ (HorizontalStackLayout *)create:(Border *)border;

@end