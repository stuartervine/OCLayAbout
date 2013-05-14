#import "GridLayout.h"
#import "AspectRatio.h"

@implementation GridLayout {
    int columns;
    int columnWidth;
    Border *border;
    int index;
    CGPoint offset;
}

- (GridLayout *)initWithColumns:(int)numberOfColumns border:(Border *)aBorder width:(int)width offset:(CGPoint)anOffset {
    self = [super init];
    index = 0;
    columns = numberOfColumns;
    border = aBorder;
    columnWidth = (width / columns);
    offset = anOffset;
    return self;
}

- (void)positionView:(UIView *)view {
    AspectRatio *aspectRatio = [AspectRatio fromView:view];
    CGFloat rowHeight = [aspectRatio heightFromWidth:columnWidth];
    int currentColumn = index % columns;
    int currentRow = index / columns;
    [view setFrame:CGRectMake(
            (currentColumn * columnWidth) + border.left + offset.x,
            (currentRow * rowHeight) + border.top + offset.y,
            columnWidth - (border.left + border.right),
            rowHeight - (border.top + border.bottom))];
    index++;
}

- (void)reset {
    index = 0;
}


+ (GridLayout *)columns:(int)numberOfColumns border:(Border *)border {
    return [[GridLayout alloc] initWithColumns:numberOfColumns border:border width:320 offset:CGPointZero];
}

+ (GridLayout *)columns:(int)numberOfColumns border:(Border *)border width:(int)width offset:(CGPoint)offset {
    return [[GridLayout alloc] initWithColumns:numberOfColumns border:border width:width offset:offset];
}

@end