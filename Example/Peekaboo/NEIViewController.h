//
//  NEIViewController.h
//  Peekaboo
//
//  Created by ghost on 03/27/2016.
//  Copyright (c) 2016 NEILAB, LLC. All rights reserved.
//

@import UIKit;

#import <Peekaboo/Peekaboo.h>

@interface NEIViewController : UIViewController <NEIPeekabooDelegate>
@property(nonatomic,retain) IBOutlet UIWebView *webView;
@end
