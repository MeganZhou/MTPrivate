//
//  NSString+Util.m
//  MarketingTools
//
//  Created by Megan on 6/18/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

- (NSString *)sortString {
  NSArray *keyValuesArray = [self componentsSeparatedByString:@"&"];
  NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
  for (NSString *keyValueString in keyValuesArray) {
    NSArray *keyAndValue = [keyValueString componentsSeparatedByString:@"="];    
    NSString *key = [keyAndValue objectAtIndex:0];
    NSString *value = [keyAndValue objectAtIndex:1];
    [tempDict setObject:value forKey:key];
  }
    
  return [AppPreference sortDict:tempDict];
}

- (NSString *)urlEncode {
  NSMutableString *output = [NSMutableString string];
  const unsigned char *source = (const unsigned char *)[self UTF8String];
  int sourceLen = strlen((const char *)source);
  for (int i = 0; i < sourceLen; ++i) {
    const unsigned char thisChar = source[i];
//    if (thisChar == ' ') {
//      [output appendString:@"+"];
//    } else
      if (thisChar == '.' || thisChar == '-' || thisChar == '_' ||
//          thisChar == '~' ||
               (thisChar >= 'a' && thisChar <= 'z') ||
               (thisChar >= 'A' && thisChar <= 'Z') ||
               (thisChar >= '0' && thisChar <= '9')) {
      [output appendFormat:@"%c", thisChar];
    } else {
      [output appendFormat:@"%%%02X", thisChar];
    }
  }
  
  return output;
}

- (NSDate *)stringToDate:(NSString *)formatter {
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:formatter];
  [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
  NSDate *date = [dateFormat dateFromString:self];
  
  return date;
}

+ (NSString *)stringWithFloat:(CGFloat)floatData {
  NSString *floatToString = [NSString stringWithFormat:@"%f", floatData];
  return floatToString;
}

+ (NSString *)stringWithInt:(int)intData {
  NSString *intToString = [NSString stringWithFormat:@"%d", intData];
  return intToString;
}

@end
