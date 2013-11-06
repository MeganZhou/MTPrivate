//
//  RedeemConfirmView.m
//  MarketingTools
//
//  Created by Megan on 6/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RedeemConfirmView.h"
#import "ValidCodeResponse.h"
#import "UILabel+Util.h"
#import "DotransNumcodeResponse.h"
#import "DotransBarcodeResponse.h"
#import "AcktransNumcode.h"
#import "AcktransBarcode.h"
#import "CanceltransNumcode.h"
#import "CanceltransBarcode.h"
#import "AcktransNumcodeReponse.h"
#import "AcktransBarcodeResponse.h"
#import "CanceltransNumcodeReponse.h"
#import "CanceltransBarcodeResponse.h"
#import "LoadingView.h"

@interface RedeemConfirmView ()

@property (strong, nonatomic) NSString *redeemCode;
@property (strong, nonatomic) ValidCodeResponse *codeResponse;

@end

@implementation RedeemConfirmView

- (void)layoutSubviews {  
  self.codeResponse = [_dataForward objectForKey:kCurrentResponseObject];
  
  _lblProduct.text = NSLocalizedString(@"Redeem.Label.Product", nil);
  _lblExpiration.text = NSLocalizedString(@"Redeem.Label.Expiration", nil);
  _lblDescription.text = NSLocalizedString(@"Redeem.Label.Description", nil);
  _lblTime.text = NSLocalizedString(@"Redeem.Label.Time", nil);
  [_btnConfirmRedemption setTitle:NSLocalizedString(@"Redeem.Button.ConfirmRedemption", nil) forState:UIControlStateNormal];
  [_btnConfirmRedemption setTitle:NSLocalizedString(@"Redeem.Button.ConfirmRedemption", nil) forState:UIControlStateHighlighted];

  if (self.codeResponse) {
    self.lblProductValue.text = NSLocalizedString(self.codeResponse.name, nil);
    self.lblExpirationValue.text = self.codeResponse.expire_time;
    self.lblDescriptionValue = [UILabel updateLabel:self.lblDescriptionValue withString:self.codeResponse.description andFont:nil andColor:nil];
    self.lblTimeValue.text = self.codeResponse.created;
  }
  
  if (_isValidCodeView) {
    self.confirmIcon.image = [UIImage imageNamed:@"POS_05-confirm_Icon"];
    self.lblConfirmMsg.textColor = [UIColor colorWithRed:71.0/255.0 green:179.0/255.0 blue:156.0/255.0 alpha:1.0];
    self.lblConfirmMsg.text = NSLocalizedString(@"Redeem.Label.CodeValidTip", nil);
    self.lblTime.hidden = YES;
    self.lblTimeValue.hidden = YES;
    self.btnConfirmRedemption.hidden = NO;
    self.btnCancelOrRedeem.titleLabel.text = nil;
    [self.btnCancelOrRedeem setTitle:NSLocalizedString(@"Common.Button.Cancel", nil) forState:UIControlStateNormal];
    [self.btnCancelOrRedeem setTitle:NSLocalizedString(@"Common.Button.Cancel", nil) forState:UIControlStateHighlighted];
    [self.btnCancelOrRedeem removeTarget:self action:@selector(redeemAnotherCode) forControlEvents:UIControlEventTouchUpInside];
    [self.btnCancelOrRedeem addTarget:self action:@selector(cancelRedeem) forControlEvents:UIControlEventTouchUpInside];
    
  } else {
    self.confirmIcon.image = [UIImage imageNamed:@"POS_05-redeemed_Icon"];
    self.lblConfirmMsg.textColor = [UIColor colorWithRed:214.0/255.0 green:88.0/255.0 blue:89.0/255.0 alpha:1.0];
    self.lblConfirmMsg.text = NSLocalizedString(@"Redeem.Label.RedeemTip", nil);
    self.lblTime.hidden = NO;
    self.lblTimeValue.hidden = NO;    
    self.btnConfirmRedemption.hidden = YES;
    self.btnCancelOrRedeem.titleLabel.text = nil;
    [self.btnCancelOrRedeem setTitle:NSLocalizedString(@"Redeem.Button.RedeemAnother", nil) forState:UIControlStateNormal];
    [self.btnCancelOrRedeem setTitle:NSLocalizedString(@"Redeem.Button.RedeemAnother", nil) forState:UIControlStateHighlighted];
    [self.btnCancelOrRedeem removeTarget:self action:@selector(cancelRedeem) forControlEvents:UIControlEventTouchUpInside];
    [self.btnCancelOrRedeem addTarget:self action:@selector(redeemAnotherCode) forControlEvents:UIControlEventTouchUpInside];
  }
  
}

- (IBAction)onClickConfirmRedeemButton:(id)sender {
  BaseRequest *request = [_dataForward objectForKey:kNextRequestObject];
  request.delegate = self;
  _redeemCode = request.redeemCode;
  NSLog(@"When dotrans _redeemCode == %@", _redeemCode);
  [AppServiceWrapper sendRequest:request];
}

- (void)cancelRedeem {
  [self.viewController process:_lastState withData:nil];
}

- (void)redeemAnotherCode {
  [self.viewController process:_lastState withData:nil];
}

- (void)succeed:(BaseResponse *)response {
  NSLog(@"succeed: confirm: response == %@", response);
  [self stopIndicatorAnimation];
  if ([response isKindOfClass:[DotransNumcodeResponse class]]) {
    NSLog(@"When acktransNum _redeemCode == %@", _redeemCode);
    AcktransNumcode *acktransNumcode = [[AcktransNumcode alloc] init];
    acktransNumcode.redeemCode = _redeemCode;
    acktransNumcode.delegate = self;
    
    [AppServiceWrapper sendRequest:acktransNumcode];    
  } else if ([response isKindOfClass:[DotransBarcodeResponse class]]) {
    NSLog(@"When acktransBar _redeemCode == %@", _redeemCode);
    AcktransBarcode *acktransBarcode = [[AcktransBarcode alloc] init];
    acktransBarcode.redeemCode = _redeemCode;
    acktransBarcode.delegate = self;
    
    [AppServiceWrapper sendRequest:acktransBarcode];
  } else if ([response isKindOfClass:[AcktransNumcodeReponse class]] || [response isKindOfClass:[AcktransBarcodeResponse class]]) {
    [self.viewController process:ConfirmCode withData:nil];
  } else {
    // Do nothing.   
  }
}

- (void)failed:(BaseResponse *)response {
  [self stopIndicatorAnimation];
  if ([response isKindOfClass:[DotransNumcodeResponse class]]) {
    CanceltransNumcode *cancelNumcode = [[CanceltransNumcode alloc] init];
    cancelNumcode.redeemCode = _redeemCode;
    cancelNumcode.delegate = self;
    NSLog(@"When canceltransNum _redeemCode == %@", _redeemCode);
    
    [AppServiceWrapper sendRequest:cancelNumcode];
  } else if ([response isKindOfClass:[DotransBarcodeResponse class]]) {
    CanceltransBarcode *cancelBarcode = [[CanceltransBarcode alloc] init];
    cancelBarcode.redeemCode = _redeemCode;
    cancelBarcode.delegate = self;
    
    NSLog(@"When canceltransBar _redeemCode == %@", _redeemCode);
    
    [AppServiceWrapper sendRequest:cancelBarcode];
  } else if ([response isKindOfClass:[CanceltransNumcodeReponse class]] || [response isKindOfClass:[CanceltransBarcodeResponse class]]) {
    NSLog(@"Cancel Redeem Code Fail.");
  } else {
    WarningAlert(response.errorMsg, self, kDefaultWarningAlertTag);
  }  
}

- (void)startIndicatorAnimation {
  _loadingView = [[LoadingView alloc] initWithFrame:self.frame];
  [self endEditing:YES];
  [self addSubview:_loadingView];
}

- (void)stopIndicatorAnimation {
  sleep(1);
  [_loadingView removeFromSuperview];
}

@end
