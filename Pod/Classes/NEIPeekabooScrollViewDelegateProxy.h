
#import <Foundation/Foundation.h>

@interface NEIPeekabooScrollViewDelegateProxy : NSObject <UIScrollViewDelegate>

@property (nonatomic, readonly)  id <UIScrollViewDelegate> primary;
@property (nonatomic,readonly)  id <UIScrollViewDelegate> secondary;

- (id) initWithPrimaryDelegate: (id <UIScrollViewDelegate>) primaryDelegate secondary: (id <UIScrollViewDelegate>) secondaryDelegate;
+ (id) proxyWithPrimaryDelegate: (id <UIScrollViewDelegate>) primary secondary: (id <UIScrollViewDelegate>) secondary;

@end
