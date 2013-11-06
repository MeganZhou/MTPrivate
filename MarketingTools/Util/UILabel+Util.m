//
//  UILabel+Util.m
//  MarketingTools
//
//  Created by Megan on 6/27/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "UILabel+Util.h"

@implementation UILabel (Util)

+ (UILabel *)updateLabel:(UILabel *)label withString:(NSString *)string andFont:(UIFont *)font andColor:(UIColor *)color {
  [label setNumberOfLines:0];
  label.lineBreakMode = UILineBreakModeWordWrap;  
  CGSize size = CGSizeMake(320.0, 600.0);
  
  UIFont *currentfont = font ? font : [self defaultFont] ;
  UIColor *currentColor = color ? color : [self defaultColor];
  
  CGSize labelsize = [string sizeWithFont:currentfont constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
  label.textColor = currentColor;
  label.text = string;
  [label setFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, labelsize.width, labelsize.height + 12.0)];
  
  return label;
}

+ (UIFont *)defaultFont {
  UIFont *font = [UIFont systemFontOfSize:12.0];
  return font;
}

+ (UIColor *)defaultColor {
  UIColor *color = [UIColor colorWithRed:102/255.0 green:102/255.0  blue:102/255.0  alpha:255.0/255.0];
  return color;
}

+ (UILabel *)labelWith:(CGRect)rect andText:(NSString *)text {
  UILabel *label = [[UILabel alloc]initWithFrame:rect];
  UIFont *font = [UIFont systemFontOfSize:12.0];
  label.backgroundColor = [UIColor clearColor];
  label.textColor = [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:255.0/255.0];
  label.font = font;
  label.text = text;
  
  return label;
}

@end
