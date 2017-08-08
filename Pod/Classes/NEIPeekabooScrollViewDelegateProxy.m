
#import "NEIPeekabooScrollViewDelegateProxy.h"

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
@implementation NEIPeekabooScrollViewDelegateProxy {
    id <UIScrollViewDelegate> _primary;
    id <UIScrollViewDelegate> _secondary;
}

@synthesize primary = _primary;
@synthesize secondary = _secondary;


- (id)initWithPrimaryDelegate:(id <UIScrollViewDelegate>)primaryDelegate secondary:(id <UIScrollViewDelegate>)secondaryDelegate {
    if (self = [super init]) {
        _primary = primaryDelegate;
        _secondary = secondaryDelegate != primaryDelegate ? secondaryDelegate : nil;
    }
    return self;
}


+ (id)proxyWithPrimaryDelegate:(id <UIScrollViewDelegate>)primary secondary:(id <UIScrollViewDelegate>)secondary {
    NEIPeekabooScrollViewDelegateProxy *proxy = [[self alloc] initWithPrimaryDelegate:primary secondary:secondary];
    return proxy;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary performSelector:_cmd withObject:scrollView];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary performSelector:_cmd withObject:scrollView];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary performSelector:_cmd withObject:scrollView];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary performSelector:_cmd withObject:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary performSelector:_cmd withObject:scrollView];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary performSelector:_cmd withObject:scrollView];

}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary performSelector:_cmd withObject:scrollView];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary performSelector:_cmd withObject:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary performSelector:_cmd withObject:scrollView];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary performSelector:_cmd withObject:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary performSelector:_cmd withObject:scrollView];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary performSelector:_cmd withObject:scrollView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {

    UIView *primaryView = nil;
    UIView *secondaryView = nil;

    if ([self.primary respondsToSelector:_cmd])
        primaryView = [self.primary performSelector:_cmd withObject:scrollView];
    if (!primaryView && [self.secondary respondsToSelector:_cmd])
        secondaryView = [self.secondary performSelector:_cmd withObject:scrollView];

    return primaryView ? primaryView : secondaryView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary performSelector:_cmd withObject:scrollView withObject:view];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary performSelector:_cmd withObject:scrollView withObject:view];
}


- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary scrollViewDidEndZooming:scrollView withView:view atScale:scale];
    if ([self.secondary respondsToSelector:_cmd])
        [self.primary scrollViewDidEndZooming:scrollView withView:view atScale:scale];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    NSInteger primaryScrollToTop = 0;
    NSInteger secondaryScrollToTop = 0;
    if ([self.primary respondsToSelector:_cmd])
        primaryScrollToTop = [self.primary scrollViewShouldScrollToTop:scrollView] == YES ? 1 : -1;
    if ([self.secondary respondsToSelector:_cmd])
        secondaryScrollToTop = [self.secondary scrollViewShouldScrollToTop:scrollView] == YES ? 1 : -1;

    return (primaryScrollToTop + secondaryScrollToTop) < 0 ? NO : YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if ([self.primary respondsToSelector:_cmd])
        [self.primary performSelector:_cmd withObject:scrollView];
    if ([self.secondary respondsToSelector:_cmd])
        [self.secondary performSelector:_cmd withObject:scrollView];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL method_selector = [anInvocation selector];
    BOOL relayed = NO;
    if ([self.primary respondsToSelector:method_selector]) {
        relayed = YES;
        [anInvocation invokeWithTarget:self.primary];
    }
    if ([self.secondary respondsToSelector:method_selector]) {
        relayed = YES;
        [anInvocation invokeWithTarget:self.secondary];
    }

    if (!relayed)
        [super forwardInvocation:anInvocation];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ( [super respondsToSelector:aSelector] )
        return YES;
    else if([self.primary respondsToSelector:aSelector] || [self.secondary respondsToSelector:aSelector]) {
        return YES;
    }
    return NO;
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    if( [super conformsToProtocol:aProtocol]) {
        return YES;
    } else if([self.primary conformsToProtocol:aProtocol] || [self.secondary conformsToProtocol:aProtocol]) {
        return YES;
    }

    return NO;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    NSMethodSignature *primarySignature = [(id)self.primary methodSignatureForSelector:selector];
    NSMethodSignature *secondarySignature = [(id)self.secondary methodSignatureForSelector:selector];

    if (signature)
        return signature;
    if (primarySignature)
        return primarySignature;
    if (secondarySignature)
        return secondarySignature;

    return signature;
}
@end
