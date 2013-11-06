//
//  LoginHistoryResponse.m
//  MarketingTools
//
//  Created by Megan on 6/24/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "LoginHistoryResponse.h"
#import "NSString+Util.h"

@implementation LoginHistoryResponse

+ (id)loginHistory:(NSDictionary *)dataDict {
  LoginHistoryResponse *loginHistory = [[LoginHistoryResponse alloc] init];
  loginHistory.did = [dataDict objectForKey:@"did"];
  loginHistory.pos_account = [dataDict objectForKey:@"pos_account"];
  loginHistory.login_datetime = [[dataDict objectForKey:@"login_datetime"] stringToDate:@"yyyy-MM-dd HH:mm:ss"];
  
  return loginHistory;
}

@end
