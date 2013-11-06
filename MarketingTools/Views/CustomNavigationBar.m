//
//  CustomNavigationBar.m
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CustomNavigationBar.h"

@implementation CustomNavigationBar

- (id)initWithFrame:(CGRect)frame {
  if (self) {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CustomNavigationBar" owner:self options:nil];
    if ([nibs count] != 0) {
      self = [nibs objectAtIndex:0];
      [_btnBack setTitle:NSLocalizedString(@"NavBar.Button.Back", nil) forState:UIControlStateNormal];
      [_btnBack setTitle:NSLocalizedString(@"NavBar.Button.Back", nil) forState:UIControlStateHighlighted];
    }
  }
  
  return self;
}

@end
