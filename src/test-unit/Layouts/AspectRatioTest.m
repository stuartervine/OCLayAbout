#import "OCLATestCase.h"
#import "AspectRatio.h"

@interface AspectRatioTest : OCLATestCase
@end

@implementation AspectRatioTest

-(void)testHeightIsCorrectRatio {
    UIView *twiceAsWide = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 1)];
    UIView *fourByThree = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4.0, 3.0)];
    assertThatFloat([[AspectRatio fromView:twiceAsWide] heightFromWidth:100.0], equalToFloat(50.0));
    assertThatFloat([[AspectRatio fromView:fourByThree] heightFromWidth:320.0], equalToFloat(240.0));
}

@end