

#import <Foundation/Foundation.h>
#import "NEIPeekabooDelegate.h"
#import "NEIPeekabooScrollViewDelegateProxy.h"


typedef NS_ENUM(NSInteger, NEIPeekabooAutomaximizeMask) {
    NEIPeekabooAutomaximizeNone = 0,
    NEIPeekabooAutomaximizeNavigatorBar = 1 << 0,
    NEIPeekabooAutomaximizeToolbar = 1 << 1
};


@interface NEIPeekabooSettings : NSObject <UIScrollViewDelegate>
@property(nonatomic, assign) id <NEIPeekabooDelegate> delegate;
@property(nonatomic, assign) UIScrollView *scrollView;
@property(nonatomic, assign) NEIPeekabooAutomaximizeMask automaximizeMask;
@property(nonatomic, assign) BOOL animated;

- (void)maximizeViewport:(BOOL)maximize animated:(BOOL)animated;
@end

