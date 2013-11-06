//
//  BaseViewController.h
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpResponseDelegate.h"

@class CustomNavigationBar;
@class CustomTabBar;
@class LoadingView;

@interface BaseViewController : UIViewController <HttpResponseDelegate>

@property (nonatomic, retain) CustomNavigationBar *navBar;
@property (nonatomic, retain) CustomTabBar *tabBar;
@property (nonatomic, retain) LoadingView *loadingView;

- (void)initNavBar:(NSString *)barTitle; // Header name for nav bar
- (void)hideBackButton:(BOOL)isHide; // Header back button in navigation sub layers. 

@end
