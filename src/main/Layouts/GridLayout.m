#import "GridLayout.h"

@implementation GridLayout {
    int columns;
    int columnWidth;
    int border;
    int rowHeight;
}

- (GridLayout *)initWithColumns:(int)numberOfColumns border:(int)aBorder rowHeight:(int)aRowHeight {
    self = [super init];
    columns = numberOfColumns;
    border = aBorder;
    columnWidth = (320 / columns);
    rowHeight = aRowHeight + (border*2);
    return self;
}

- (void)positionView:(UIView *)subview index:(int)index {
    int currentColumn = index % columns;
    int currentRow = index / columns;
    [subview setFrame:CGRectMake(
            (currentColumn * columnWidth) + border,
            (currentRow * rowHeight) + border,
            columnWidth - (border*2),
            rowHeight - (border*2))];
}

+ (GridLayout *)columns:(int)numberOfColumns rowHeight:(int)rowHeight border:(int)border {
 return [[[GridLayout alloc] initWithColumns:numberOfColumns border:border rowHeight:rowHeight] autorelease];

}

@end