#import <Foundation/Foundation.h>
#import "Layout.h"
#import "Border.h"


@interface VerticalStackLayout : NSObject <Layout>
- (id)initWithBorder:(Border *)aBorder;

+ (VerticalStackLayout *)create;

+ (VerticalStackLayout *)create:(Border *)border;

@end