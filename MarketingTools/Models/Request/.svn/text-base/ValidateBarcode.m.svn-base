//
//  ValidateBarcode.m
//  MarketingTools
//
//  Created by Megan on 7/10/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "ValidateBarcode.h"

#define kValidateBarcodeUrl (@"validatebarcode")
#define kBodyContentString (@"did=${did}&ts=${ts}&barcode=${barcode}&sig=${sig}")

@implementation ValidateBarcode

- (id)init {
  self = [super init];
  if (self) {
    self.requestConfig.url = kValidateBarcodeUrl;
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
