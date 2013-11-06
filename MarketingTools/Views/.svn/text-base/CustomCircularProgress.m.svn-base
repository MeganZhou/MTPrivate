//
//  CustomCircularProgress.m
//  CustomProgressTest
//
//  Created by Megan on 6/13/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CustomCircularProgress.h"

#import <QuartzCore/QuartzCore.h>

@interface CustomCircularProgressLayer : CALayer

@property(nonatomic) CGFloat progress;

@end

@implementation CustomCircularProgressLayer

@dynamic progress;

+ (BOOL)needsDisplayForKey:(NSString *)key {
  return [key isEqualToString:@"progress"] ? YES : [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)context {
  CGRect rect = self.bounds;
  CGPoint centerPoint = CGPointMake(rect.size.height / 2.0f, rect.size.width / 2.0f);
  CGFloat radius = MIN(rect.size.height, rect.size.width) / 2.0f;
  
  CGFloat progress = MIN(self.progress, 1.0f - FLT_EPSILON);
  CGFloat radians = (progress * 2.0f * M_PI) - M_PI_2;
  
  if (progress > 0.0f) {
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGMutablePathRef progressPath = CGPathCreateMutable();
    CGPathMoveToPoint(progressPath, NULL, centerPoint.x, centerPoint.y);
    CGPathAddArc(progressPath, NULL, centerPoint.x, centerPoint.y, radius, 2.0f * M_PI_2, radians, NO);
    if(!CGContextIsPathEmpty(context)) {
      CGContextClip(context);
    }
    CGPathCloseSubpath(progressPath);
    CGContextAddPath(context, progressPath);
    CGContextFillPath(context);
    CGPathRelease(progressPath);
  }
  
  CGContextSetBlendMode(context, kCGBlendModeClear);
  CGFloat innerRadius = radius * 0.9;
  CGPoint newCenterPoint = CGPointMake(centerPoint.x - innerRadius, centerPoint.y - innerRadius);
  CGContextAddEllipseInRect(context, CGRectMake(newCenterPoint.x, newCenterPoint.y, innerRadius * 2.0f, innerRadius * 2.0f));
  CGContextFillPath(context);    
}

@end

@interface CustomCircularProgress ()

@end

@implementation CustomCircularProgress

+ (void) initialize {
  if (self != [CustomCircularProgress class]) {
    return;
  }
  
  id appearance = [self appearance];
  [appearance setIndeterminate:NO];
}

+ (Class)layerClass {
  return [CustomCircularProgressLayer class];
}

- (CustomCircularProgressLayer *)circularProgressLayer {
  return (CustomCircularProgressLayer *)self.layer;
}

- (id)init {
  return [super initWithFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
}

- (void)didMoveToWindow {
  CGFloat windowContentsScale = self.window.screen.scale;
  self.circularProgressLayer.contentsScale = windowContentsScale;
}

#pragma mark - Progress

- (CGFloat)progress {
  return self.circularProgressLayer.progress;
}

- (void)setProgress:(CGFloat)progress {
  [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
  CGFloat pinnedProgress = MIN(MAX(progress, 0.0f), 1.0f);
  if (animated) {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = fabsf(self.progress - pinnedProgress);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = [NSNumber numberWithFloat:self.progress];
    animation.toValue = [NSNumber numberWithFloat:pinnedProgress];
    [self.circularProgressLayer addAnimation:animation forKey:@"progress"];
  } else {
    [self.circularProgressLayer setNeedsDisplay];
  }
  self.circularProgressLayer.progress = pinnedProgress;
}

#pragma mark - UIAppearance methods
- (NSInteger)indeterminate {
  CAAnimation *spinAnimation = [self.layer animationForKey:@"indeterminateAnimation"];
  return (spinAnimation == nil ? 0 : 1);
}

- (void)setIndeterminate:(NSInteger)indeterminate {
  if (indeterminate && !self.indeterminate) {
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.byValue = [NSNumber numberWithFloat:2.0f*M_PI];
    spinAnimation.duration = self.indeterminateDuration;
    spinAnimation.repeatCount = HUGE_VALF;
    [self.layer addAnimation:spinAnimation forKey:@"indeterminateAnimation"];
  } else {
    [self.layer removeAnimationForKey:@"indeterminateAnimation"];
  }
}

@end
