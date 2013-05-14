#import <CoreGraphics/CoreGraphics.h>
#import "OCLATestCase.h"
#import "Layouts.h"
#import "LayoutProperties.h"

@interface LayoutPropertiesTest : OCLATestCase

@end

@implementation LayoutPropertiesTest

- (void)testFrame {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    component(view, @[frame(CGRectMake(20, 20, 20, 20))]);
    assertThatFloat(view.frame.origin.x, equalToFloat(20));
    assertThatFloat(view.frame.origin.y, equalToFloat(20));
    assertThatFloat(view.frame.size.width, equalToFloat(20));
    assertThatFloat(view.frame.size.height, equalToFloat(20));
}

@end