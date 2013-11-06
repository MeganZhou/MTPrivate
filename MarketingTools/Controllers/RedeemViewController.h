//
//  RedeemViewController.h
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
//#import "CustomCircularProgress.h"
#import "ZBarSDK.h"

@class RedeemEnterNumbercodeView;
@class RedeemConfirmView;
@class Barcode;
@class Numbercode;

#define kNextRequestObject (@"nextRequest")
#define kCurrentResponseObject (@"currentResponse")

enum State {
  ScanBarcode = 0,
  EnterNumcode,
  ValidateCode,
  ConfirmCode
};

typedef NSUInteger State;

enum Selector {
  scanBarcode = 0,
  enterNumcode,
  validateCode,
  confirmCode,
  cancelRedeem,
  redeemAnother
};

typedef NSUInteger Selector;

struct StateMachine {
  State currentState;  
  Selector selector;
  State nextState;
};

struct StateMachine;

/*!
 The main controller, including all redeem features. Such as validate/dotrans/acktrans barcode/numcode.
 It includes three views, the defaule self.view is used for scan barcode.
 */

@interface RedeemViewController:BaseViewController <ZBarReaderDelegate>

/*! 
 The two IBOutlet should be strong reference. 
 */
@property (strong, nonatomic) IBOutlet RedeemEnterNumbercodeView *enterNumbercodeView;
@property (strong, nonatomic) IBOutlet RedeemConfirmView *redeemConfirmView;

//@property (weak, nonatomic) IBOutlet CustomCircularProgress *customProgressView;

@property (weak, nonatomic) IBOutlet UIView *scanView;
@property (weak, nonatomic) IBOutlet UIButton *btnEnterNumcode;

//@property (assign, nonatomic) BOOL isBarcode;

- (void)process:(State)nextState withData:(NSDictionary *)data;

@end
