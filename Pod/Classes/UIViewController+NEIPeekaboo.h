
#import <UIKit/UIKit.h>
#import "NEIPeekabooSettings.h"


@interface UIViewController (NEIPeekaboo)
@property(nonatomic, readonly) NEIPeekabooSettings *peekaboo;

- (void)enablePeekabooUsingScrollView:(UIScrollView *)scrollView;

- (void)enablePeekabooUsingScrollView:(UIScrollView *)scrollView mask:(NEIPeekabooAutomaximizeMask)mask;

- (void)enablePeekabooUsingScrollView:(UIScrollView *)scrollView mask:(NEIPeekabooAutomaximizeMask)mask delegate:(id <NEIPeekabooDelegate>)delegate;

@end
