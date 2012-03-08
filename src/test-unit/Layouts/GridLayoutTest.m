#import "OCLayAboutTestCase.h"
#import "GridLayout.h"
#import "Border.h"

@interface GridLayoutTest : OCLayAboutTestCase
@end

@implementation GridLayoutTest

-(void)testResizesSubviewsToFitIntoGrid {
    UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 60)] autorelease];

    GridLayout *layout = [GridLayout columns:1 border:[Border none]];
    [layout positionView:view index:0];

    assertThatFloat(view.frame.origin.x, equalToFloat(0.0));
    assertThatFloat(view.frame.origin.y, equalToFloat(0.0));
    assertThatFloat(view.frame.size.width, equalToFloat(320.0));
    assertThatFloat(view.frame.size.height, equalToFloat(240.0));

    [layout positionView:view index:1];
    assertThatFloat(view.frame.origin.x, equalToFloat(0.0));
    assertThatFloat(view.frame.origin.y, equalToFloat(240.0));
    assertThatFloat(view.frame.size.width, equalToFloat(320.0));
    assertThatFloat(view.frame.size.height, equalToFloat(240.0));
}

-(void)testBorders {
    UIView *view1 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 60)] autorelease];
    UIView *view2 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 60)] autorelease];

    GridLayout *layout = [GridLayout columns:1 border:[Border allSides:2]];
    [layout positionView:view1 index:0];

    assertThatFloat(view1.frame.origin.x, equalToFloat(2.0));
    assertThatFloat(view1.frame.origin.y, equalToFloat(2.0));
    assertThatFloat(view1.frame.size.width, equalToFloat(316.0));
    assertThatFloat(view1.frame.size.height, equalToFloat(236.0));

    [layout positionView:view2 index:1];
    assertThatFloat(view2.frame.origin.x, equalToFloat(2.0));
    assertThatFloat(view2.frame.origin.y, equalToFloat(242.0));
    assertThatFloat(view2.frame.size.width, equalToFloat(316.0));
    assertThatFloat(view2.frame.size.height, equalToFloat(236.0));


}

@end