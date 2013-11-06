
//
//  CanceltransNumcode.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CanceltransNumcode.h"

#define kCanceltransNumcodeUrl (@"canceltransnumcode")
#define kBodyContentString (@"did=${did}&ts=${ts}&numcode=${numcode}&amount=${amount}&sig=${sig}")

@implementation CanceltransNumcode

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kCanceltransNumcodeUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSString *data = [NSString stringWithFormat:@"numcode=%@&did=%@&ts=%@&amount=%@", self.redeemCode, AppPreference.account.did, self.ts, [NSString stringWithFloat:self.amount]];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, [NSString stringWithFloat:self.amount], [AppPreference getSignature:data], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_NUMCODE, TAG_AMOUNT, TAG_SIG, nil]];
  
  return bodyParamDict;
}

@end
