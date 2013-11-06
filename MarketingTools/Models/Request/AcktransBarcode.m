//
//  AcktransBarcode.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "AcktransBarcode.h"

#define kAcktransBarcodeUrl (@"acktransbarcode")
#define kBodyContentString (@"did=${did}&ts=${ts}&barcode=${barcode}&sig=${sig}")

@implementation AcktransBarcode

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kAcktransBarcodeUrl;
    self.requestConfig.body = kBodyContentString;
  }
  
  return self;
}

- (NSDictionary *)bodyDict {
  NSDictionary *dataDict = [NSDictionary
                            dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, nil]
                            forKeys:[NSArray arrayWithObjects:DID, TS, BARCODE, nil]];
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:AppPreference.account.did, self.ts, self.redeemCode, [AppPreference getSignature:dataDict], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_BARCODE, TAG_SIG, nil]];
  
  return bodyParamDict;
}

@end
