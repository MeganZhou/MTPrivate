//
//  ChangePassword.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "ChangePassword.h"

#define kChangePasswordUrl (@"changepospassword")
#define kBodyContentString (@"did=${did}&ts=${ts}&pos_account=${pos_account}&old_password=${old_password}&new_password=${new_password}&sig=${sig}")

@implementation ChangePassword

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kChangePasswordUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSString *data = [NSString stringWithFormat:@"did=%@&ts=%@&pos_account=%@&old_password=%@&new_password=%@", AppPreference.account.did, self.ts, AppPreference.account.pos_account, self.password, self.newest_password];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, AppPreference.account.pos_account, self.password, self.newest_password, [AppPreference getSignature:data], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_POS_ACCOUNT, TAG_OLD_PASSWORD, TAG_NEW_PASSWORD, TAG_SIG, nil]];
  return bodyParamDict;
}

@end
