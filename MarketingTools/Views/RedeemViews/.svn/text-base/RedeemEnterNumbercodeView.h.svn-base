//
//  RedeemEnterNumbercodeView.h
//  MarketingTools
//
//  Created by Megan on 6/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpResponseDelegate.h"
#import "CustomCircularProgress.h"

@class RedeemViewController;
@class LoadingView;

@interface RedeemEnterNumbercodeView : UIView <UITextFieldDelegate, UIAlertViewDelegate, HttpResponseDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fldEnterNumbercode;
@property (weak, nonatomic) IBOutlet UIImageView *fldEnterNumbercodeBkg;
@property (weak, nonatomic) IBOutlet UIView *indicatorView;

@property (weak, nonatomic) IBOutlet UILabel *lblEnterNumcodeTip;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmitNumcode;

@property (weak, nonatomic) IBOutlet UILabel *lblConnectNetWorkTip;
@property (weak, nonatomic) IBOutlet UILabel *lblVerifyingCodeTip;
@property (weak, nonatomic) IBOutlet UIButton *btnStartQRscan;

@property (weak, nonatomic) IBOutlet CustomCircularProgress *customProgressView;

@property (retain, nonatomic) RedeemViewController *viewController;
@property (nonatomic, retain) LoadingView *loadingView;

@end
