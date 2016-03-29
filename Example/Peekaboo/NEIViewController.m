//
//  NEIViewController.m
//  Peekaboo
//
//  Created by James Whitfield on 03/27/2016.
//  Copyright (c) 2016 NEiLAB, LLC. All rights reserved.
//

#import "NEIViewController.h"
@interface NEIViewController ()

@end

@implementation NEIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Peekaboo!";
    self.navigationController.toolbarHidden = NO ;
    self.toolbarItems = @[[[UIBarButtonItem alloc] initWithTitle:@"Peekaboo!"
                                                           style:UIBarButtonItemStylePlain
                                                          target:self
                                                          action:@selector(peekabooToggle:)]];
    
    [self.webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/valerius/Peekaboo/wiki"]]];
    [self enablePeekabooUsingScrollView:self.webView.scrollView
                                   mask:NEIPeekabooAutomaximizeNavigatorBar | NEIPeekabooAutomaximizeToolbar
                               delegate:self];
}



#pragma mark - Actions

- (void) peekabooToggle: (id) sender {
    [self.peekaboo maximizeViewport:!self.navigationController.navigationBarHidden animated:YES];
}


#pragma mark - NEIPeekabooDelegate

- (BOOL)peekabooViewportIsMaximized {
    // optional: you can use any logic to determine if its maximized, otherwise internal logic is used of not implemented
    return self.navigationController.navigationBarHidden;
}

- (BOOL)peekabooShouldAlterViewport:(id)scrollView maximized:(BOOL)maximized {
    return YES; //optional: always defaults to YES
}

- (void)peekabooWillAlterViewport:(id)scrollView maximized:(BOOL)maximized {
    //optional: You can add your own code that will add/reduce available space.
}

- (void)peekabooDidAlterViewport:(id)scrollView maximized:(BOOL)maximized {
    //optional: You can add your own code that will add/reduce available space.
}

@end
