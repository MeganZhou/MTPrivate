//
//  BaseCollapseCell.m
//  MarketingTools
//
//  Created by Megan on 6/25/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "BaseCollapseCell.h"

@implementation BaseCollapseCell

- (void)changeCellUI  {
  self.cellBkg.image = [UIImage imageNamed:@"POS_07-history_Background_Click"];
  
  if (self.isExpand) { // To Clap
    self.isExpand = NO;
    self.cellBkg.hidden = YES;
    [self rotateExpandButton:self.btnExpand rotate:0];
  } else { //To Expand, by Default
    self.isExpand = YES;
    self.cellBkg.hidden = NO;
    [self rotateExpandButton:self.btnExpand rotate:M_PI_2];
  }
}

- (void)rotateExpandButton:(UIButton *)button rotate:(double)angle {
  [UIView beginAnimations:@"rotateDisclosureButt" context:nil];
  [UIView setAnimationDuration:0.2];
  button.transform = CGAffineTransformMakeRotation(angle);
  [UIView commitAnimations];
}

@end
