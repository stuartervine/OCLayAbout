#import <Foundation/Foundation.h>

typedef UIView *(^VIEW_MUTATION)(UIView *);

@interface LayoutProperties : NSObject
+ (VIEW_MUTATION)frame:(CGRect)rect;

+ (VIEW_MUTATION)marginLeft:(int)left top:(int)top right:(int)right bottom:(int)bottom;

+ (VIEW_MUTATION)backgroundColor:(UIColor *)color;

+ (VIEW_MUTATION)widthFillParent;

+ (VIEW_MUTATION)height:(int)height;

+ (VIEW_MUTATION)heightFillParent;

+ (VIEW_MUTATION)heightFillAvailable;

+ (VIEW_MUTATION)paddingLeft:(int)left top:(int)top right:(int)right bottom:(int)bottom;

+ (VIEW_MUTATION)heightWrapContent;

+ (VIEW_MUTATION)alignParentBottom;

+ (VIEW_MUTATION)alignParentTop;

+ (VIEW_MUTATION)widthWrapContent;

+ (VIEW_MUTATION)width:(int)width;

+ (VIEW_MUTATION)alignParentRight;

+ (VIEW_MUTATION)widthFillAvailable;

+ (VIEW_MUTATION)alignParentLeft;

+ (VIEW_MUTATION)centerHorizontally;

+ (VIEW_MUTATION)centerVertically;
@end

static VIEW_MUTATION frame(CGRect rect) {
    return [LayoutProperties frame:rect];
}

static VIEW_MUTATION margin(int left, int top, int right, int bottom) {
    return [LayoutProperties marginLeft:left top:top right:right bottom:bottom];
}

static VIEW_MUTATION padding(int left, int top, int right, int bottom) {
    return [LayoutProperties paddingLeft:left top:top right:right bottom:bottom];
}

static VIEW_MUTATION backgroundColor(UIColor *backgroundColor) {
    return [LayoutProperties backgroundColor:backgroundColor];
}

static VIEW_MUTATION widthFillParent() {
    return [LayoutProperties widthFillParent];
}

static VIEW_MUTATION widthFillAvailable() {
    return [LayoutProperties widthFillAvailable];
}

static VIEW_MUTATION widthWrapContent() {
    return [LayoutProperties widthWrapContent];
}

static VIEW_MUTATION heightWrapContent() {
    return [LayoutProperties heightWrapContent];
}

static VIEW_MUTATION alignParentBottom() {
    return [LayoutProperties alignParentBottom];
}

static VIEW_MUTATION alignParentTop() {
    return [LayoutProperties alignParentTop];
}

static VIEW_MUTATION alignParentRight() {
    return [LayoutProperties alignParentRight];
}

static VIEW_MUTATION alignParentLeft() {
    return [LayoutProperties alignParentLeft];
}

static VIEW_MUTATION heightFillParent() {
    return [LayoutProperties heightFillParent];
}

static VIEW_MUTATION heightFillAvailable() {
    return [LayoutProperties heightFillAvailable];
}

static VIEW_MUTATION height(int height) {
    return [LayoutProperties height:height];
}

static VIEW_MUTATION width(int width) {
    return [LayoutProperties width:width];
}

static VIEW_MUTATION centerHorizontally() {
    return [LayoutProperties centerHorizontally];
}

static VIEW_MUTATION centerVertically() {
    return [LayoutProperties centerVertically];
}