//
//  CustomLinkedButton.m
//  MarketingTools
//
//  Created by Megan on 7/15/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CustomLinkedButton.h"

@implementation CustomLinkedButton

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  CGRect textRext = self.titleLabel.frame;
  CGFloat decender = self.titleLabel.font.descender;
  CGContextRef contextRef = UIGraphicsGetCurrentContext();
  CGFloat shadowHeight = self.titleLabel.shadowOffset.height;
  decender += shadowHeight;
  
  CGContextSetStrokeColorWithColor(contextRef, self.titleLabel.textColor.CGColor);
  CGContextSetLineWidth(contextRef, 1);
  CGFloat lineOrignY = textRext.origin.y + textRext.size.height + decender + 2;
  CGContextMoveToPoint(contextRef, textRext.origin.x, lineOrignY);
  CGContextAddLineToPoint(contextRef, textRext.origin.x + textRext.size.width - 2, lineOrignY);
  CGContextClosePath(contextRef);
  CGContextDrawPath(contextRef, kCGPathStroke);
}

@end
