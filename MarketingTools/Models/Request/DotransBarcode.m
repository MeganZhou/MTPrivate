//
//  DotransBarcode.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "DotransBarcode.h"

#define kDotransBarcodeUrl (@"dotransbarcode")
#define kBodyContentString (@"did=${did}&ts=${ts}&barcode=${barcode}&password=${password}&amount=${amount}&sig=${sig}")

@implementation DotransBarcode

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kDotransBarcodeUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSDictionary *dataDict = [NSDictionary
                            dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, AppPreference.account.password, [NSString stringWithFloat:self.amount],  nil]
                            forKeys:[NSArray arrayWithObjects:DID, TS, BARCODE, PASSWORD, AMOUNT, nil]];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, AppPreference.account.password, [NSString stringWithFloat:self.amount], [AppPreference getSignature:dataDict], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_BARCODE, TAG_PASSWORD, TAG_AMOUNT, TAG_SIG, nil]];
  
  return bodyParamDict;
}

@end
