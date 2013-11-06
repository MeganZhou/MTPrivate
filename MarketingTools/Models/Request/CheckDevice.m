//
//  CheckDevice.m
//  MarketingTools
//
//  Created by Megan on 7/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CheckDevice.h"

#define kCheckDeviceUrl (@"checkdevice")
#define kBodyContentString (@"did=${did}&ts=${ts}&check=${check}&sig=${sig}")

@implementation CheckDevice

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kCheckDeviceUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSString *data = [NSString stringWithFormat:@"check=%d&did=%@&ts=%@", self.check, AppPreference.account.did, self.ts];
  NSString *signature = [AppPreference getSignature:data];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, [NSString stringWithInt:self.check], signature, nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_CHECK, TAG_SIG, nil]];
  
  return bodyParamDict;
}

@end
