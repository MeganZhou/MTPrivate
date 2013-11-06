//
//  LoadingView.m
//  MarketingTools
//
//  Created by Megan on 7/4/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "LoadingView.h"
#import "QuartzCore/CoreAnimation.h"

#define centerViewSize CGSizeMake(110.0, 70.0)
#define lblLoadingFrame CGRectMake(10.0, 40.0, 92.0, 21.0)

@implementation LoadingView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
      _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];      
      
      // Custom a view with an indicator and a label
      UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, centerViewSize.width, centerViewSize.height)];
      centerView.backgroundColor = [UIColor blackColor];
      centerView.layer.cornerRadius = 8.0;
      
      _indicatorView.frame = CGRectMake(centerView.center.x - _indicatorView.frame.size.width/2, 15.0, _indicatorView.frame.size.width, _indicatorView.frame.size.height);
      
      [centerView addSubview:_indicatorView];
      
      UILabel *lblLoading = [[UILabel alloc] initWithFrame:lblLoadingFrame];
      lblLoading.text = NSLocalizedString(@"Indicator.Message.Loading", nil);
      lblLoading.textColor = [UIColor whiteColor];
      lblLoading.font = [UIFont systemFontOfSize:15.0];
      lblLoading.backgroundColor = [UIColor clearColor];
      lblLoading.textAlignment = UITextAlignmentCenter;
      
      [centerView addSubview:lblLoading];
      
      centerView.center = self.center;
      [self addSubview:centerView];
      
      [_indicatorView startAnimating];
      
      [self setBackgroundColor:[UIColor blackColor]];
      [self setAlpha:0.5];
    }
  
    return self;
}

@end
