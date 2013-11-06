//
//  SetUpDeviceResponse.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "SetUpDeviceResponse.h"

@implementation SetUpDeviceResponse

- (id)responseObject:(NSString *)jsonString {
  [super responseObject:jsonString];    
  
  if (self.status) {
    return self;
  }
  
  NSDictionary *dataDict = [self covertJSON2Dict:jsonString];
//  NSLog(@"SetUpDeviceResponse: dataDict == %@", dataDict);
  
  self.token = [dataDict objectForKey:@"token"];
  self.expires_in = [dataDict objectForKey:@"expires_in"];
  self.merchant_id = [dataDict objectForKey:@"merchant_id"];
  self.merchant_user_id = [dataDict objectForKey:@"merchant_user_id"];
  self.merchant_name = [dataDict objectForKey:@"merchant_name"];
  
  return self;
}

@end
