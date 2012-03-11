#import <Foundation/Foundation.h>

@interface InfiniteScrollView : UIView <UIScrollViewDelegate>
@property(nonatomic, retain) UIScrollView *scrollView;

+ (InfiniteScrollView *)withCellRenderer:(UIView * (^)(int, int))aViewRendererBlock horizontallyScrolling:(BOOL)horizontallyScrolling verticallyScrolling:(BOOL)verticallyScrolling;
@end