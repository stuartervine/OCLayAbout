#import "OCLayAboutTestCase.h"
#import "GridLayout.h"

@interface GridLayoutTest : OCLayAboutTestCase
@end

@implementation GridLayoutTest

-(void)testResizesSubviewsToFitIntoGrid {
    UIView *view = [[[UIView alloc] init] autorelease];

    GridLayout *layout = [GridLayout columns:1 rowHeight:8 border:1];
    [layout positionView:view index:0];

    assertThatFloat(view.frame.origin.x, equalToFloat(1.0));
    assertThatFloat(view.frame.origin.y, equalToFloat(1.0));
    assertThatFloat(view.frame.size.width, equalToFloat(318.0));
    assertThatFloat(view.frame.size.height, equalToFloat(8.0));

    [layout positionView:view index:1];
    assertThatFloat(view.frame.origin.x, equalToFloat(1.0));
    assertThatFloat(view.frame.origin.y, equalToFloat(11.0));
    assertThatFloat(view.frame.size.width, equalToFloat(318.0));
    assertThatFloat(view.frame.size.height, equalToFloat(8.0));
}

@end