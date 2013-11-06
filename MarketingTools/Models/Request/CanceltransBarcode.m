//
//  CanceltransBarcode.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CanceltransBarcode.h"

#define kCanceltransBarcodeUrl (@"canceltransbarcode")
#define kBodyContentString (@"did=${did}&ts=${ts}&barcode=${barcode}&amount=${amount}&sig=${sig}")

@implementation CanceltransBarcode

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kCanceltransBarcodeUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSDictionary *dataDict = [NSDictionary
                            dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, [NSString stringWithFloat:self.amount], nil]
                            forKeys:[NSArray arrayWithObjects:DID, TS, BARCODE, AMOUNT, nil]];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, [NSString stringWithFloat:self.amount], [AppPreference getSignature:dataDict], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_BARCODE, TAG_AMOUNT, TAG_SIG, nil]];
  
  return bodyParamDict;
}

@end
