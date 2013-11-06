//
//  Constant.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "Constant.h"

@implementation Constant

const NSString *DID = @"did";
const NSString *TS = @"ts";
const NSString *POS_ACCOUNT = @"pos_account";
const NSString *PASSWORD = @"password";
const NSString *CHECK = @"check";
const NSString *SIG = @"sig";
const NSString *BARCODE = @"barcode";
const NSString *NUMCODE = @"numcode";
const NSString *AMOUNT = @"amount";
const NSString *OLD_PASSWORD = @"old_password";
const NSString *NEW_PASSWORD = @"new_password";
const NSString *DATE = @"date";
const NSString *OFFSET = @"offset";
const NSString *LIMIT = @"limit";

const NSString *TAG_DID = @"${did}";
const NSString *TAG_TS = @"${ts}";
const NSString *TAG_POS_ACCOUNT = @"${pos_account}";
const NSString *TAG_PASSWORD = @"${password}";
const NSString *TAG_CHECK = @"${check}";
const NSString *TAG_SIG = @"${sig}";
const NSString *TAG_BARCODE = @"${barcode}";
const NSString *TAG_NUMCODE = @"${numcode}";
const NSString *TAG_AMOUNT = @"${amount}";
const NSString *TAG_OLD_PASSWORD = @"${old_password}";
const NSString *TAG_NEW_PASSWORD = @"${new_password}";
const NSString *TAG_DATE = @"${date}";
const NSString *TAG_OFFSET = @"${offset}";
const NSString *TAG_LIMIT = @"${limit}";

const NSString *SETUPDEVICE = @"setUpDevice";
const NSString *CHECKDEVICE = @"checkDevice";
const NSString *VALIDATE_BARCODE = @"validateBarcode";
const NSString *DO_TRANS_BARCODE = @"dotransBarcode";
const NSString *CANCEL_TRANS_BARCODE = @"canceltransBarcode";
const NSString *ACK_TRANS_BARCODE = @"acktransBarcode";
const NSString *VALIDATE_NUMCODE = @"validateNumcode";
const NSString *DO_TRANS_NUMCODE = @"dotransNumcode";
const NSString *CANCEL_TRANS_NUMCODE = @"canceltransNumcode";
const NSString *ACK_TRANS_NUMCODE = @"acktransNumcode";

const NSString *METHOD_SETUPDEVICE = @"setUpDevice:delegate:";
const NSString *METHOD_CHECKDEVICE = @"checkDevice:delegate:";
const NSString *METHOD_VALIDATE_BARCODE = @"validateBarcode:delegate:";
const NSString *METHOD_DO_TRANS_BARCODE = @"dotransBarcode:delegate:";
const NSString *METHOD_CANCEL_TRANS_BARCODE = @"canceltransBarcode:delegate:";
const NSString *METHOD_ACK_TRANS_BARCODE = @"acktransBarcode:delegate:";
const NSString *METHOD_VALIDATE_NUMCODE = @"validateNumcode:delegate:";
const NSString *METHOD_DO_TRANS_NUMCODE = @"dotransNumcode:delegate:";
const NSString *METHOD_CANCEL_TRANS_NUMCODE = @"canceltransNumcode:delegate:";
const NSString *METHOD_ACK_TRANS_NUMCODE = @"acktransNumcode:delegate:";


//  NSArray *imageNameArray = [NSArray arrayWithObjects:@"POS_02-scanning_Icon_Ticket", @"POS_02-scanning_Icon_History", @"POS_02-scanning_Icon_Setting", nil];

@end
