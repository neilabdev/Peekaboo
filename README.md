# Peekaboo

[![CI Status](http://img.shields.io/travis/James Whitfield/Peekaboo.svg?style=flat)](https://travis-ci.org/James Whitfield/Peekaboo)
[![Version](https://img.shields.io/cocoapods/v/Peekaboo.svg?style=flat)](http://cocoapods.org/pods/Peekaboo)
[![License](https://img.shields.io/cocoapods/l/Peekaboo.svg?style=flat)](http://cocoapods.org/pods/Peekaboo)
[![Platform](https://img.shields.io/cocoapods/p/Peekaboo.svg?style=flat)](http://cocoapods.org/pods/Peekaboo)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Peekaboo is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Peekaboo"
```

## Integration
Peekaboo was intended to be simple and can be configured with one line of code for most usages, but also provides 
additional flexiablity using delegation. What makes its implementation different from other worthy mentions its that it 
assumes little, and can hide navigation & toolbars in a standard way if you prefer, or allow you to perform the necessary 
transitions in delegate methods in your own customized fashion without the need for subclasses. Its need arose as a result 
of other API's doing 90% of what I needed, but because it was so custom required hacking the code to suite my usecase. 
Thus, this API is designed abstractly to allow detection/configuration of the event triggered to notify you that the 
"viewport" should expand or contract, and nothing more. You do the rest as follows:
 
```objective-c

    #import <Peekaboo/Peekaboo.h> // when not using CocoaPods
    
    @interface YourViewController : UIViewController <NEIPeekabooDelegate> //delegation is optional
    @end
    
    @implementation YourViewController
    - (void) viewDidLoad {
        [super viewDidLoad];
        [self enablePeekabooUsingScrollView:scrollView // any scrollView
                                       mask:NEIPeekabooAutomaximizeNavigatorBar | NEIPeekabooAutomaximizeToolbar // defaults to none, whereby you can manage visiablity in delegate callbacks
                                   delegate:self];

    }    
    
    
    #pragma mark - PeekabooDelegate
    
    - (BOOL)peekabooViewportIsMaximized {
        // optional: you can use any logic to determine if its maximized, otherwise internal logic is used of not implemented
        return self.navigationController.navigationBarHidden;     
    }
    
    - (BOOL)peekabooShouldAlterViewport:(id)scrollView maximized:(BOOL)maximized { 
        return YES; //optional: always defaults to YES
    }
    
     /****************************************************************************************************************** 
        Following methods have no relation with optional mask NEIPeekabooAutomaximizeNavigatorBar and NEIPeekabooAutomaximizeToolbar,
        but can used to instead of in conjuction with mask to expand or contract views to maximize space. Mask if provided,
        allow you to not have to hide or show respetive controllers are, but provided, are maniuplated using standard
        show/hide navigation and toolbar methods.
     ******************************************************************************************************************/
    
    - (void)peekabooWillAlterViewport:(id)scrollView maximized:(BOOL)maximized {
        //optional: You can add your own code that will add/reduce available space. 
    }
    
    - (void)peekabooDidAlterViewport:(id)scrollView maximized:(BOOL)maximized {
        //optional: You can add your own code that will add/reduce available space.
    }
    @end
``` 



## Author

James Whitfield, valerius@neilab.com

## License

Peekaboo is available under the MIT license. See the LICENSE file for more info.
