//
//  DotransNumcode.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "DotransNumcode.h"

#define kDotransNumcodeUrl (@"dotransnumcode")
#define kBodyContentString (@"did=${did}&ts=${ts}&numcode=${numcode}&password=${password}&amount=${amount}&sig=${sig}")

@implementation DotransNumcode

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kDotransNumcodeUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSString *data = [NSString stringWithFormat:@"numcode=%@&did=%@&ts=%@&password=%@&amount=%@", self.redeemCode, AppPreference.account.did, self.ts, AppPreference.account.password, [NSString stringWithFloat:self.amount]];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, AppPreference.account.password, [NSString stringWithFloat:self.amount], [AppPreference getSignature:data], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_NUMCODE, TAG_PASSWORD, TAG_AMOUNT, TAG_SIG, nil]];
  return bodyParamDict;
}

@end
