
//
//  LoginHistoryWrapper.m
//  MarketingTools
//
//  Created by Megan on 6/24/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "LoginHistoryWrapper.h"
#import "LoginHistoryResponse.h"
#import "NSDate+Formatter.h"

@implementation LoginHistoryWrapper

- (id)responseObject:(NSString *)jsonString {
  NSArray *loginHistoryArray = [self covertJSON2Dict:jsonString];
  
  [super responseObject:jsonString];
  
  if (self.status) {
    return self;
  }
  
  self.loginHistoryArray = [[NSMutableArray alloc] init];
  
  for (NSDictionary *dataDict in loginHistoryArray) {
    LoginHistoryResponse *redeemHistory = [LoginHistoryResponse loginHistory:dataDict];
    [self.loginHistoryArray addObject:redeemHistory];
  }
  
  NSMutableDictionary *historyDict = [self convertArrayToDict:self.loginHistoryArray];
  self.loginHistoryDict = historyDict;
  
  return self;
  
}

- (NSMutableDictionary *)convertArrayToDict:(NSArray *)historyArray {
  NSMutableArray *dateArray = [NSMutableArray array];
  NSMutableDictionary *historyDict = [NSMutableDictionary dictionary];
  
  for (LoginHistoryResponse *history in historyArray) {
    NSDate *date = history.login_datetime;
    if (![dateArray containsObject:[date dateString]]) {
      [dateArray addObject:[date dateString]];
    }
  }
  
  for (NSString *dateString in dateArray) {
    NSMutableArray *historyByDateArray = [NSMutableArray array];
    for (LoginHistoryResponse *history in historyArray) {
      if ([[history.login_datetime dateString] isEqualToString:dateString]) {
        [historyByDateArray addObject:history];
      }
    }
    
    [historyDict setObject:historyByDateArray forKey:dateString];
  }
  
  return historyDict;
}

@end
