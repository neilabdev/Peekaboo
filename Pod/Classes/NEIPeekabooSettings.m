

#import "NEIPeekabooSettings.h"
#import "NEIPeekabooSettingsPrivate.h"
#import "UIViewController+NEIPeekaboo.h"
#import "UIViewController+NEIPeekabooPrivate.h"

@interface NEIPeekabooSettings ()
@property(nonatomic, readonly) BOOL maximized;
@end

@implementation NEIPeekabooSettings {
    CGFloat _startContentOffset;
    CGFloat _lastContentOffset;
    UIViewController *__weak _parentViewController;

}
@synthesize scrollView = _scrollView;
@synthesize maximized = _maximized;

- (instancetype)initWithViewController:(UIViewController *)mainViewController {
    if (self = [super init]) {
        _parentViewController = mainViewController;
        _maximized = NO;
        _animated = YES;
    }

    return self;
}

#pragma mark -

- (UIScrollView *)scrollView {
    return _scrollView;
}

- (void)setScrollView:(UIScrollView *)scrollView {
    if(scrollView)
        scrollView.delegate = self;
    _scrollView = scrollView;
}

- (BOOL)maximized {
    if ([self.delegate respondsToSelector:@selector(peekabooViewportIsMaximized)])
        _maximized = [self.delegate peekabooViewportIsMaximized];
    return _maximized;
}

- (void)expandUsingScrollView:(UIView *)scrollView animated: (BOOL) animated  {
    if (self.maximized)
        return;

    if ([self.delegate conformsToProtocol:@protocol(NEIPeekabooDelegate)]) if (![self.delegate respondsToSelector:@selector(peekabooShouldAlterViewport:maximized:)] ||
            [self.delegate peekabooShouldAlterViewport:scrollView maximized:_maximized]) {
        _maximized = YES;
        if ([self.delegate respondsToSelector:@selector(peekabooWillAlterViewport:maximized:)])
            [self.delegate peekabooWillAlterViewport:scrollView maximized:_maximized];
        if ([self.delegate respondsToSelector:@selector(peekabooDidAlterViewport:maximized:)])
            [self.delegate peekabooDidAlterViewport:scrollView maximized:_maximized];
    }

    [_parentViewController peekabooAutoMaximizes:_maximized animated:animated];
}

- (void)contractUsingScrollView:(UIView *)scrollView animated: (BOOL) animated {
    if (!self.maximized)
        return;

    if ([self.delegate conformsToProtocol:@protocol(NEIPeekabooDelegate)]) if (![self.delegate respondsToSelector:@selector(peekabooShouldAlterViewport:maximized:)] ||
            [self.delegate peekabooShouldAlterViewport:scrollView maximized:_maximized]) {
        _maximized = NO;
        if ([self.delegate respondsToSelector:@selector(peekabooWillAlterViewport:maximized:)])
            [self.delegate peekabooWillAlterViewport:scrollView maximized:_maximized];
        if ([self.delegate respondsToSelector:@selector(peekabooDidAlterViewport:maximized:)])
            [self.delegate peekabooDidAlterViewport:scrollView maximized:_maximized];
    }
    [_parentViewController peekabooAutoMaximizes:_maximized animated:animated];
}


- (void) maximizeViewport: (BOOL) maximize animated: (BOOL) animated {
    if(maximize) {
        [self expandUsingScrollView:self.scrollView animated:animated];
    } else {
        [self contractUsingScrollView:self.scrollView animated:animated];
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _startContentOffset = _lastContentOffset = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat currentOffset = scrollView.contentOffset.y;
    CGFloat differenceFromStart = _startContentOffset - currentOffset;
    CGFloat differenceFromLast = _lastContentOffset - currentOffset;
    _lastContentOffset = currentOffset;

    if ((differenceFromStart) < 0) {
        // scroll up
        if (scrollView.isTracking && (abs(differenceFromLast) > 1))
            [self expandUsingScrollView:scrollView animated: _animated];
    } else {
        if (scrollView.isTracking && (abs(differenceFromLast) > 1))
            [self contractUsingScrollView:scrollView animated:_animated];
    }
}

@end