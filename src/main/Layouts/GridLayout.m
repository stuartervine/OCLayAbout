#import "GridLayout.h"
#import "AspectRatio.h"
#import "Border.h"

@implementation GridLayout {
    int columns;
    int columnWidth;
    Border *border;
}

- (GridLayout *)initWithColumns:(int)numberOfColumns border:(Border *)aBorder {
    self = [super init];
    columns = numberOfColumns;
    border = [aBorder retain];
    columnWidth = (320 / columns);
    return self;
}

- (void)positionView:(UIView *)subview index:(int)index {
    AspectRatio *aspectRatio = [AspectRatio fromView:subview];
    CGFloat rowHeight = [aspectRatio heightFromWidth:columnWidth];
    int currentColumn = index % columns;
    int currentRow = index / columns;
    [subview setFrame:CGRectMake(
            (currentColumn * columnWidth) + border.left,
            (currentRow * rowHeight) + border.top,
            columnWidth - (border.left + border.right),
            rowHeight - (border.top + border.bottom))];
}

- (void)dealloc {
    [border release];
    [super dealloc];
}

+ (GridLayout *)columns:(int)numberOfColumns border:(Border *)border {
    return [[[GridLayout alloc] initWithColumns:numberOfColumns border:border] autorelease];

}

@end