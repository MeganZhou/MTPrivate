//
//  CustomCircularProgress.h
//  CustomProgressTest
//
//  Created by Megan on 6/13/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCircularProgress : UIView

@property(nonatomic) CGFloat progress;
@property(nonatomic) CGFloat indeterminateDuration;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
