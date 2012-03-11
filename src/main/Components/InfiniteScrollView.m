#import "InfiniteScrollView.h"


@implementation InfiniteScrollView {
    int numberOfColumns;
    int numberOfRows;
    int currentColumn;
    int currentRow;
    UIView *(^viewRendererBlock)(int, int);
}
@synthesize scrollView = _scrollView;


+ (InfiniteScrollView *)withCellRenderer:(UIView * (^)(int, int))aViewRendererBlock horizontallyScrolling:(BOOL)horizontallyScrolling verticallyScrolling:(BOOL)verticallyScrolling {
    return [[[InfiniteScrollView alloc] initWithCellRenderer:aViewRendererBlock horizontallyScrolling:horizontallyScrolling verticallyScrolling:verticallyScrolling] autorelease];
}

- (InfiniteScrollView *)initWithCellRenderer:(UIView * (^)(int, int))aCellRenderer horizontallyScrolling:(BOOL)isHorizontallyScrolling verticallyScrolling:(BOOL)isVerticallyScrolling {
    self = [super init];
    if (self) {
        numberOfColumns = isHorizontallyScrolling ? 1000 : 1;
        numberOfRows = isVerticallyScrolling ? 1000 : 1;
        viewRendererBlock = [aCellRenderer copy];
        self.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
        [self.scrollView setBackgroundColor:[UIColor blackColor]];
        [self.scrollView setDelegate:self];
        [self.scrollView setContentSize:CGSizeMake(320 * numberOfColumns, 480 * numberOfRows)];
        [self.scrollView setContentOffset:CGPointMake(320 * ((numberOfColumns - 1)/ 2), 480 * ((numberOfRows - 1)/ 2))];
        [self addSubview:self.scrollView];
    }
    return self;
}

- (UIView *)subViewColumn:(int)column row:(int)row {
    return viewRendererBlock(column, row);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //when the scroll view crosses a boundary, load a grid of 3 or 9 scrollviews.
    int maybeNewColumn = (int) (scrollView.contentOffset.x / 320);
    int maybeNewRow = (int) (scrollView.contentOffset.y / 480);

    if (maybeNewColumn != currentColumn || maybeNewRow != currentRow) {
        currentColumn = maybeNewColumn;
        currentRow = maybeNewRow;
        for (UIView *view in scrollView.subviews) {
            [view removeFromSuperview];
        }
        if (numberOfColumns > 1) {
            if (currentColumn > 0) {
                [scrollView addSubview:[self subViewColumn:currentColumn - 1 row:currentRow]];
            }
            if (currentColumn < numberOfColumns) {
                [scrollView addSubview:[self subViewColumn:currentColumn + 1 row:currentRow]];
            }
        }
        if (numberOfRows > 1) {
            if (currentRow > 0) {
                [scrollView addSubview:[self subViewColumn:currentColumn row:currentRow - 1]];
            }
            if (currentRow < numberOfRows) {
                [scrollView addSubview:[self subViewColumn:currentColumn row:currentRow + 1]];
            }
        }
        if (numberOfColumns > 1 && numberOfRows > 1) {
            if (currentColumn > 0 && currentRow > 0) {
                [scrollView addSubview:[self subViewColumn:currentColumn - 1 row:currentRow - 1]];
            }
            if (currentColumn > 0 && currentRow < numberOfRows) {
                [scrollView addSubview:[self subViewColumn:currentColumn - 1 row:currentRow + 1]];
            }
            if (currentColumn < numberOfColumns && currentRow > 0) {
                [scrollView addSubview:[self subViewColumn:currentColumn + 1 row:currentRow - 1]];
            }
            if (currentColumn < numberOfColumns && currentRow < numberOfRows) {
                [scrollView addSubview:[self subViewColumn:currentColumn + 1 row:currentRow + 1]];
            }
        }
        [scrollView addSubview:[self subViewColumn:currentColumn row:currentRow]];
    }
}

- (void)dealloc {
    [viewRendererBlock release];
    [_scrollView release];
    [super dealloc];
}

@end