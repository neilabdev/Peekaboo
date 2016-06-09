
#import <Foundation/Foundation.h>

@protocol NEIPeekabooDelegate <NSObject>
@optional
    -(BOOL)peekabooViewportIsMaximized;
    -(BOOL)peekabooShouldAlterViewport:(id)scrollView maximized: (BOOL) maximized;
    -(void)peekabooWillAlterViewport:(id)scrollView maximized: (BOOL) maximized;
    -(void)peekabooDidAlterViewport:(id)scrollView maximized: (BOOL) maximized;
@end
