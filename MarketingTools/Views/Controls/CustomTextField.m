//
//  CustomTextField.m
//  MarketingTools
//
//  Created by Megan on 6/27/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (void)drawRect:(CGRect)rect {
  if (_isNomalField) {
    self.leftView = [self normalLeftView];
    self.background = [UIImage imageNamed:@"POS_03-numbercode_Textbox"];
  } else {
    self.leftView = [self customLeftViewWithImage:self.iconName];
    self.background = [UIImage imageNamed:@"POS_01-landing_Textbox.png"];
  }
  
  self.leftViewMode = UITextFieldViewModeAlways;  
  self.font = [UIFont systemFontOfSize:12.0];
  self.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0  blue:102/255.0  alpha:255.0/255.0];
}

- (UIView *)customLeftViewWithImage:(NSString *)imageName {
  UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 48.0, self.frame.size.height)];
  UIImage *leftImage = [UIImage imageNamed:imageName];
  UIImageView *leftImageView = [[UIImageView alloc] initWithImage:leftImage];
  leftImageView.frame = CGRectMake(12.0, 11.0, leftImage.size.width/2, leftImage.size.height/2);
  [leftView addSubview:leftImageView];
  
  return leftView;
}

- (UIView *)normalLeftView {
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8.0, self.frame.size.height)];
  
  return view;
}

@end
