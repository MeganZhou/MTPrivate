//
//  ValidateNumcode.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "ValidateNumcode.h"

#define kValidateNumcodeUrl (@"validatenumcode")
#define kBodyContentString (@"did=${did}&ts=${ts}&numcode=${numcode}&sig=${sig}")

@implementation ValidateNumcode

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kValidateNumcodeUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSString *data = [NSString stringWithFormat:@"numcode=%@&did=%@&ts=%@", self.redeemCode, AppPreference.account.did, self.ts];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, [AppPreference getSignature:data], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_NUMCODE, TAG_SIG, nil]];
  return bodyParamDict;
}

@end
