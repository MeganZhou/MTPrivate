//
//  RedeemHistoryWrapper.m
//  MarketingTools
//
//  Created by Megan on 6/24/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RedeemHistoryWrapper.h"
#import "RedeemHistoryResponse.h"
#import "NSDate+Formatter.h"

@implementation RedeemHistoryWrapper

- (id)responseObject:(NSString *)jsonString {
  NSArray *dataArray = [self covertJSON2Dict:jsonString];
  
  [super responseObject:jsonString];
  
  if (self.status) {
    return self;
  }
  
  self.historyArray = [[NSMutableArray alloc] init];
  
  for (NSDictionary *dataDict in dataArray) {
    RedeemHistoryResponse *redeemHistory = [RedeemHistoryResponse redeemHistory:dataDict];
    [self.historyArray addObject:redeemHistory];
  }
  
  NSMutableDictionary *historyDict = [self convertArrayToDict:self.historyArray];
  self.historyDict = historyDict;
  
  return self;
  
}

- (NSMutableDictionary *)convertArrayToDict:(NSArray *)historyArray {
  NSMutableArray *dateArray = [NSMutableArray array];
  NSMutableDictionary *historyDict = [NSMutableDictionary dictionary];
  
  for (RedeemHistoryResponse *history in historyArray) {
    NSDate *date = history.redeemed_datetime;
    if (![dateArray containsObject:[date dateString]]) {
      [dateArray addObject:[date dateString]];
    }
  }
  
  for (NSString *dateString in dateArray) {
    NSMutableArray *historyByDateArray = [NSMutableArray array];
    for (RedeemHistoryResponse *history in historyArray) {
      if ([[history.redeemed_datetime dateString] isEqualToString:dateString]) {
        [historyByDateArray addObject:history];
      }
    }
    
    [historyDict setObject:historyByDateArray forKey:dateString];
  }
  
  return historyDict;
}

@end
