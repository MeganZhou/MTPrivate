//
//  RedeemHistory.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RedeemHistory.h"
#import "Page.h"

#define kRedeemHistoryUrl (@"getredeemedhistory")
#define kBodyContentString (@"did=${did}&ts=${ts}&pos_account=${pos_account}&offset=${offset}&limit=${limit}&sig=${sig}")

@implementation RedeemHistory

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kRedeemHistoryUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSString *data = [NSString stringWithFormat:@"did=%@&ts=%@&pos_account=%@&offset=%@&limit=%@", AppPreference.account.did, self.ts, AppPreference.account.pos_account, [NSString stringWithInt:self.page.offset], [NSString stringWithInt:self.page.limit]];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, AppPreference.account.pos_account, [NSString stringWithInt:self.page.offset], [NSString stringWithInt:self.page.limit], [AppPreference getSignature:data], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_POS_ACCOUNT, TAG_OFFSET, TAG_LIMIT, TAG_SIG, nil]];
  return bodyParamDict;
}

@end
