//
//  NSDate+Formatter.m
//  MarketingTools
//
//  Created by Megan on 6/24/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)

- (NSString *)dateString {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
  [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
  dateFormatter.dateFormat = @"yyyy-MM-dd";
  NSString *dateString = [dateFormatter stringFromDate:self];
  
  return dateString;
}

- (NSString *)timeString {
  NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
  [timeFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
  timeFormatter.dateFormat = @"HH:mm";
  NSString *timeString = [timeFormatter stringFromDate:self];
  
  return timeString;
}



@end
