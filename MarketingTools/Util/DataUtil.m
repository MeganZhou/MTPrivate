//
//  DataUtil.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "DataUtil.h"
#import "SetupDevice.h"
#import "Barcode.h"
//#import "Numbercode.h"
#import "Constant.h"
#import "Page.h"
#import "NSString+Util.h"

@interface DataUtil()

@property (strong, nonatomic) SetupDevice *tempAccount;
@property (strong, nonatomic) NSString *timestamp;
@end

@implementation DataUtil

- (id)init {
  self = [super init];
  if (self) {
    _tempAccount = AppPreference.account;
    _timestamp = [AppPreference currentTimeStamp];
  }
  
  return self;  
}

//
//- (NSDictionary *)validateBarcodeData:(Barcode *)barCode {
//  NSDictionary *dataDict = [NSDictionary
//                            dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, barCode.barcode, nil]
//                            forKeys:[NSArray arrayWithObjects:DID, TS, BARCODE, nil]];
//  
//  NSDictionary *bodyParamDict = [NSDictionary
//                                 dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, barCode.barcode, [AppPreference getSignature:dataDict], nil]
//                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_BARCODE, TAG_SIG, nil]];
//  return bodyParamDict;
//}
//
//- (NSDictionary *)dotransBarcodeData:(Barcode *)barCode {
//  NSDictionary *dataDict = [NSDictionary
//                            dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, barCode.barcode, _tempAccount.password, [NSString stringWithFloat:barCode.amount],  nil]
//                            forKeys:[NSArray arrayWithObjects:DID, TS, BARCODE, PASSWORD, AMOUNT, nil]];
//  
//  NSDictionary *bodyParamDict = [NSDictionary
//                                 dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, barCode.barcode, _tempAccount.password, [NSString stringWithFloat:barCode.amount], [AppPreference getSignature:dataDict], nil]
//                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_BARCODE, TAG_PASSWORD, TAG_AMOUNT, TAG_SIG, nil]];
//  
//  return bodyParamDict;
//}
//
//- (NSDictionary *)canceltransBarcodeData:(Barcode *)barCode {
//  NSDictionary *dataDict = [NSDictionary
//                            dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, barCode.barcode, [NSString stringWithFloat:barCode.amount], nil]
//                            forKeys:[NSArray arrayWithObjects:DID, TS, BARCODE, AMOUNT, nil]];
//  
//  NSDictionary *bodyParamDict = [NSDictionary
//                                 dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, barCode.barcode, [NSString stringWithFloat:barCode.amount], [AppPreference getSignature:dataDict], nil]
//                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_BARCODE, TAG_AMOUNT, TAG_SIG, nil]];
//  
//  return bodyParamDict;
//}
//
//- (NSDictionary *)acktransBarcodeData:(Barcode *)barCode {
//  NSDictionary *dataDict = [NSDictionary
//                            dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, barCode.barcode, nil]
//                            forKeys:[NSArray arrayWithObjects:DID, TS, BARCODE, nil]];
//  NSDictionary *bodyParamDict = [NSDictionary
//                                 dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, barCode.barcode, [AppPreference getSignature:dataDict], nil]
//                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_BARCODE, TAG_SIG, nil]];
//  
//  return bodyParamDict;
//}

- (NSDictionary *)redeemHistoryData:(Page *)page {
  NSString *data = [NSString stringWithFormat:@"did=%@&ts=%@&pos_account=%@&offset=%@&limit=%@", _tempAccount.did, _timestamp, _tempAccount.pos_account, [NSString stringWithInt:page.offset], [NSString stringWithInt:page.limit]];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, _tempAccount.pos_account, [NSString stringWithInt:page.offset], [NSString stringWithInt:page.limit], [AppPreference getSignature:data], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_POS_ACCOUNT, TAG_OFFSET, TAG_LIMIT, TAG_SIG, nil]];
  return bodyParamDict;
}

- (NSDictionary *)changePosPasswordData:(SetupDevice *)account {
  NSString *data = [NSString stringWithFormat:@"did=%@&ts=%@&pos_account=%@&old_password=%@&new_password=%@", _tempAccount.did, _timestamp, account.pos_account, account.password, account.newest_password];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, account.pos_account, account.password, account.newest_password, [AppPreference getSignature:data], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_POS_ACCOUNT, TAG_OLD_PASSWORD, TAG_NEW_PASSWORD, TAG_SIG, nil]];
  return bodyParamDict;
}

- (NSDictionary *)loginHistoryData:(Page *)page {
  NSString *data = [NSString stringWithFormat:@"did=%@&ts=%@&pos_account=%@&offset=%@&limit=%@", _tempAccount.did, _timestamp, _tempAccount.pos_account, [NSString stringWithInt:page.offset], [NSString stringWithInt:page.limit]];
  
  NSDictionary *bodyParamDict = [NSDictionary
                                 dictionaryWithObjects:[NSArray arrayWithObjects:_tempAccount.did, _timestamp, _tempAccount.pos_account, [NSString stringWithInt:page.offset], [NSString stringWithInt:page.limit], [AppPreference getSignature:data], nil]
                                 forKeys:[NSArray arrayWithObjects:TAG_DID, TAG_TS, TAG_POS_ACCOUNT, TAG_OFFSET, TAG_LIMIT, TAG_SIG, nil]];
  return bodyParamDict;
}

@end
