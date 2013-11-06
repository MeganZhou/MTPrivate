//
//  CustomTabBarItemView.m
//  MarketingTools
//
//  Created by Megan on 6/21/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CustomTabBarItemView.h"

@implementation CustomTabBarItemView

- (id)initWithFrame:(CGRect)frame {
  if (self) {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CustomTabBarItemView" owner:self options:nil];
    if ([nibs count] != 0) {
      self = [nibs objectAtIndex:0];
      self.frame = frame;
    }
  }
  
  return self;
}

- (CustomTabBarItemView *)updateCustomTabBarItemView:(CustomTabBarItemView *)itemView withIndex:(NSUInteger)index {
  if (index == 0) {
    itemView.selectedItemBkg.hidden = NO;
    itemView.itemImg.frame = CGRectMake(itemView.itemImg.frame.origin.x + 5, itemView.itemImg.frame.origin.y, 11.0, itemView.itemImg.frame.size.height);
  } else {
    itemView.selectedItemBkg.hidden = YES;
  }
  
  itemView.index = index;
  [itemView.btnSelectItem addTarget:self action:@selector(selectedItem:) forControlEvents:UIControlEventTouchUpInside];
  
  return itemView;
}

- (void)selectedItem:(id)sender {
  UIButton *button = (UIButton *)sender;
  CustomTabBarItemView *itemView = (CustomTabBarItemView *)[button superview];
  [_delegate selectItem:itemView.index];
}

@end
