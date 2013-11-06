//
//  Account.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "SetupDevice.h"

#define kSetupDeviceUrl (@"setupdevice")
#define kBodyContentString (@"did=${did}&ts=${ts}&pos_account=${pos_account}&password=${password}")

@implementation SetupDevice

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kSetupDeviceUrl;
    NSDictionary *headerDict = [NSDictionary dictionaryWithObject:@"application/x-www-form-urlencoded" forKey:@"Content-Type"];
    self.requestConfig.head = headerDict;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:self.did, self.ts, self.pos_account, self.password, nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_POS_ACCOUNT, TAG_PASSWORD, nil]];
  
  return bodyParamDict;
}

@end
