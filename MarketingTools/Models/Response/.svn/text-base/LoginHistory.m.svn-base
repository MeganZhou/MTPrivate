//
//  LoginHistory.m
//  MarketingTools
//
//  Created by Megan on 6/24/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "LoginHistory.h"
#import "NSString+Util.h"

@implementation LoginHistory

+ (id)loginHistory:(NSDictionary *)dataDict {
  LoginHistory *loginHistory = [[LoginHistory alloc] init];
  loginHistory.did = [dataDict objectForKey:@"did"];
  loginHistory.pos_account = [dataDict objectForKey:@"pos_account"];
  loginHistory.login_datetime = [[dataDict objectForKey:@"login_datetime"] stringToDate:@"yyyy-MM-dd HH:mm:ss"];
  
  return loginHistory;
}

@end
