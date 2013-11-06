//
//  CustomTabBarView.m
//  MarketingTools
//
//  Created by Megan on 6/21/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CustomTabBarView.h"
#import "CustomTabBarItemView.h"

@implementation CustomTabBarView

- (id)initWithFrame:(CGRect)frame {
  if (self) {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CustomTabBarView" owner:self options:nil];
    if ([nibs count] != 0) {
      self = [nibs objectAtIndex:0];
      self.frame = frame;
    }
  }
  
  return self;
}

+ (CustomTabBarView *)tabBarView:(NSDictionary *)data {
  CustomTabBarView *customTabBar = [[CustomTabBarView alloc] initWithFrame:CGRectMake(0, 479.0, 320, 69)];
  
  NSArray *itemViews = [data objectForKey:@"itemViews"];
  for (CustomTabBarItemView *itemView in itemViews) {
    [customTabBar addSubview:itemView];
  }
  
  return customTabBar;
}

@end
