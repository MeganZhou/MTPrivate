//
//  BaseViewController.m
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomNavigationBar.h"
#import "CustomTabBarView.h"
#import "CustomTabBarItemView.h"
#import "LoadingView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initNavBar:AppPreference.setUpDeviceResponse.merchant_name];
  [self hideBackButton:YES];
  _loadingView = [[LoadingView alloc] initWithFrame:self.view.frame];
}

- (void)initNavBar:(NSString *)barTitle {
  self.navigationController.navigationBarHidden = YES;
  self.navBar = [[CustomNavigationBar alloc] initWithFrame:CGRectMake(0, 20, 320, 46)];
  self.navBar.barTitle.text = barTitle;  

  [self.view addSubview:self.navBar];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [self.view endEditing:YES];
}

- (void)hideBackButton:(BOOL)isHide {
  self.navBar.btnBack.hidden = isHide;
  [self.navBar.btnBack addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)goBack:(UIControl *)button {
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)succeed:(id)response {
  // Override me
}

- (void)failed:(BaseResponse *)response {
  WarningAlert(response.errorMsg, self, kDefaultWarningAlertTag);
}

- (void)startIndicatorAnimation {
  [self.view endEditing:YES];
  [self.view addSubview:_loadingView];
}

- (void)stopIndicatorAnimation {
  sleep(1);
  [_loadingView removeFromSuperview];
}

@end
