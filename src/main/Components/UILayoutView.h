#import <Foundation/Foundation.h>
#import "GridLayout.h"

@interface UILayoutView : UIView
- (UILayoutView *)initWithLayout:(id <Layout>)layout fill:(BOOL)fill frame:(CGRect)aFrame;

- (UIView *)addSubviews:(NSArray *)views;

+ (UILayoutView *)withLayout:(id <Layout>)aLayout fill:(BOOL)fill;


+ (UILayoutView *)withLayout:(id <Layout>)aLayout fill:(BOOL)fill frame:(CGRect)aFrame;

+ (UILayoutView *)withLayout:(id <Layout>)aLayout fill:(BOOL)fill size:(CGSize)size;


+ (UILayoutView *)vertical:(Border *)border;

+ (UILayoutView *)horizontal:(Border *)border;
@end