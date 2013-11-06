//
//  TableHeaderView.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "TableHeaderView.h"

@implementation TableHeaderView

- (id)initWithFrame:(CGRect)frame {
  if (self) {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"TableHeaderView" owner:self options:nil];
    if ([nibs count] != 0) {
      self.frame = frame;
      self = [nibs objectAtIndex:0];
      
      self.lblMonthName.text = NSLocalizedString(@"Common.Label.Month", nil);
      self.lblDayName.text = NSLocalizedString(@"Common.Label.Day", nil);
      
      self.isExpand = NO;
      [self.btnExpand addTarget:self action:@selector(btnExpandTapped:) forControlEvents:UIControlEventTouchUpInside];
      [self.headerButton addTarget:self action:@selector(btnExpandTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
  }
  
  return self;
}

- (void)btnExpandTapped:(UIControl *)button {
  if (self.isExpand) {
    self.isExpand = NO;
  } else {
    self.isExpand = YES;
  }
  
  [self changeCellUI];  
  [_delegate collapseOrExpandCells:self];
}

- (void)changeCellUI {
  if (!self.isExpand) {
    
    // To Clap    
    self.cellBkg.image = [UIImage imageNamed:@"POS_07-history_Button"];
    self.countBkg.image = [UIImage imageNamed:@"POS_07-history_Background_Green"];
    [self rotateExpandButton:self.btnExpand rotate:0];
  } else {
    
    //To Expand, by Default    
    self.cellBkg.image = [UIImage imageNamed:@"POS_07-history_Button_Unfold"];
    self.countBkg.image = [UIImage imageNamed:@"POS_07-history_Background_Red"];
    
    [self rotateExpandButton:self.btnExpand rotate:M_PI_2];
  }
  
  [self bringSubviewToFront:self.headerButton];
  [self bringSubviewToFront:self.btnExpand];
}

- (void)rotateExpandButton:(UIButton *)button rotate:(double)angle {
  [UIView beginAnimations:@"rotateDisclosureButt" context:nil];
  [UIView setAnimationDuration:0.2];
  button.transform = CGAffineTransformMakeRotation(angle);
  [UIView commitAnimations];
}

@end
