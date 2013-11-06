//
//  CustomTabBarViewController.h
//  MarketingTools
//
//  Created by Megan on 6/21/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CustomTabBarItemView.h"

@interface CustomTabBarViewController : BaseViewController <SelectedItemDelegate>

/*!
 Custom Tabbar with custom background and title and height.
 */

@property (strong, nonatomic) NSArray *controllers;
@property (strong, nonatomic) NSMutableArray *itemViews;
@property (strong, nonatomic) NSDictionary *tabBarDataSource;

@end
