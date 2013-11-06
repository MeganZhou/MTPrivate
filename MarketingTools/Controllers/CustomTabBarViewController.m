//
//  CustomTabBarViewController.m
//  MarketingTools
//
//  Created by Megan on 6/21/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "CustomTabBarView.h"

#define customTabbarItemSize CGSizeMake(107.0, 69.0)

const NSString *TABBAR_REDEEM_ICON_NAME = @"POS_02-scanning_Icon_Ticket";
const NSString *TABBAR_HISTORY_ICON_NAME = @"POS_02-scanning_Icon_History";
const NSString *TABBAR_SETTING_ICON_NAME = @"POS_02-scanning_Icon_Setting";

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.controllers = [NSArray array];
    self.itemViews = [NSMutableArray array];
  }
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initData];
  [self initTabBar];
  [self selectItem:0];
}

- (void)initData {
  [self initItemViews];
  
  _tabBarDataSource = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:_itemViews, _controllers, nil] forKeys:[NSArray arrayWithObjects:@"itemViews", @"controllers", nil]];
  
}

- (void)initItemViews {
  NSArray *textArray = [NSArray arrayWithObjects:NSLocalizedString(@"CustomTabbar.Label.Redeem", nil), NSLocalizedString(@"CustomTabbar.Label.History", nil), NSLocalizedString(@"CustomTabbar.Label.Setting", nil), nil];
  NSArray *imageNameArray = [NSArray arrayWithObjects:TABBAR_REDEEM_ICON_NAME, TABBAR_HISTORY_ICON_NAME, TABBAR_SETTING_ICON_NAME, nil];
  
  for (NSString *text in textArray) {
    NSUInteger index = [textArray indexOfObject:text];
    CustomTabBarItemView *itemView = [[CustomTabBarItemView alloc] initWithFrame:CGRectMake(index * customTabbarItemSize.width, 0, customTabbarItemSize.width, customTabbarItemSize.height)];
    itemView = [itemView updateCustomTabBarItemView:itemView withIndex:index];
    itemView.lblItemTitile.text = text;
    itemView.delegate = self;
    itemView.itemImg.image = [UIImage imageNamed:[imageNameArray objectAtIndex:index]];
    [_itemViews addObject:itemView];
  }
}

- (void)initTabBar {
  CustomTabBarView *customTabBar = [CustomTabBarView tabBarView:_tabBarDataSource];
  customTabBar.frame = CGRectMake(0, (ScreenHeight - customTabBar.frame.size.height), customTabBar.frame.size.width, customTabBar.frame.size.height);
  [self.view addSubview:customTabBar];
}

- (void)selectItem:(NSUInteger)index {
  for (CustomTabBarItemView *itemView in _itemViews) {
    if (itemView.index == index) {
      itemView.selectedItemBkg.hidden = NO;
    } else {
      itemView.selectedItemBkg.hidden = YES;
    }
  }
  
  UIViewController *viewController = [_controllers objectAtIndex:index];
  for (UIViewController *viewController in [self childViewControllers]) {
    [viewController removeFromParentViewController];
    [viewController.view removeFromSuperview];
  }
  [self addChildViewController:viewController];
  [viewController didMoveToParentViewController:self];
  [self.view addSubview:viewController.view];
  [self.view sendSubviewToBack:viewController.view];
}

@end
