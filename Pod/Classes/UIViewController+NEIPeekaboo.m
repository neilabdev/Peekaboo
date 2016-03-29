

#import "UIViewController+NEIPeekaboo.h"
#import "objc/runtime.h"
#import "NEIPeekabooSettingsPrivate.h"
#import "UIViewController+NEIPeekabooPrivate.h"
@implementation UIViewController (NEIPeekaboo)
static char objectPeekabooKey;

- (void) enablePeekabooUsingScrollView: (UIScrollView *) scrollView mask: (NEIPeekabooAutomaximizeMask) mask delegate: (id <NEIPeekabooDelegate>)delegate {
    if(scrollView.delegate) {
        //assign proxy object
    } else {
        //delegate to hanler
    }
    self.peekaboo.delegate = delegate;
    self.peekaboo.scrollView = scrollView;
    self.peekaboo.automaximizeMask = mask;
}

- (void) enablePeekabooUsingScrollView: (UIScrollView *) scrollView {
    [self enablePeekabooUsingScrollView:scrollView mask:NEIPeekabooAutomaximizeNone delegate: nil];
}


- (void) enablePeekabooUsingScrollView: (UIScrollView *) scrollView mask: (NEIPeekabooAutomaximizeMask) mask  {
    [self enablePeekabooUsingScrollView:scrollView mask:mask delegate: nil];
}

- (NEIPeekabooSettings *)peekaboo {
    NEIPeekabooSettings *peekabooSettings = objc_getAssociatedObject(self, &objectPeekabooKey);
    if(!peekabooSettings) {
        peekabooSettings = [[NEIPeekabooSettings alloc] initWithViewController:self];
        objc_setAssociatedObject(self, &objectPeekabooKey, peekabooSettings, OBJC_ASSOCIATION_RETAIN);
    }
    return peekabooSettings;
}
@end


@implementation UIViewController (Peekaboo_Private)
- (void) peekabooAutoMaximizes: (BOOL) maximize animated: (BOOL) animated {
    if(self.peekaboo.automaximizeMask & NEIPeekabooAutomaximizeNavigatorBar)
        [self.navigationController setNavigationBarHidden:maximize animated:animated];
    if(self.peekaboo.automaximizeMask & NEIPeekabooAutomaximizeToolbar)
        [self.navigationController setToolbarHidden:maximize animated:animated];
}
@end