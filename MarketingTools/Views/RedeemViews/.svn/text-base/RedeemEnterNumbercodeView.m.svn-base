//
//  RedeemEnterNumbercodeView.m
//  MarketingTools
//
//  Created by Megan on 6/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RedeemEnterNumbercodeView.h"
#import "RedeemViewController.h"
#import "ValidCodeResponse.h"
#import "LoadingView.h"
#import "ValidateNumcode.h"
#import "ValidCodeResponse.h"
#import "DotransNumcode.h"

#define kNilNumberCodeWarningTag 1

@interface RedeemEnterNumbercodeView()

@property (strong, nonatomic) NSTimer *timer;

@end


@implementation RedeemEnterNumbercodeView

- (void)textFieldDidBeginEditing:(UITextField *)textField {
  UIImage *textFieldFocusBkg = [UIImage imageNamed:@"POS_03-numbercode_Textbox_Click"];
  self.fldEnterNumbercodeBkg.image = textFieldFocusBkg;  
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  UIImage *textFieldDefaultBkg = [UIImage imageNamed:@"POS_03-numbercode_Textbox"];
  self.fldEnterNumbercodeBkg.image = textFieldDefaultBkg;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  
  return YES;
}

- (void)drawRect:(CGRect)rect {
  _loadingView = [[LoadingView alloc] initWithFrame:self.frame];
  
  [self.fldEnterNumbercode becomeFirstResponder];
  self.indicatorView.hidden = YES;
  self.fldEnterNumbercodeBkg.image = [UIImage imageNamed:@"POS_03-numbercode_Textbox"];
  
  _lblEnterNumcodeTip.text = NSLocalizedString(@"Redeem.Label.EnterNumcodeTip", nil);
  [_btnSubmitNumcode setTitle:NSLocalizedString(@"Redeem.Button.SubmitNumcode", nil) forState:UIControlStateNormal];
  [_btnSubmitNumcode setTitle:NSLocalizedString(@"Redeem.Button.SubmitNumcode", nil) forState:UIControlStateHighlighted];
  _lblConnectNetWorkTip.text = NSLocalizedString(@"Redeem.Label.ConnectNetWork", nil);
  _lblVerifyingCodeTip.text = NSLocalizedString(@"Redeem.Label.Verifying", nil);
  [_btnStartQRscan setTitle:NSLocalizedString(@"Redeem.Button.StartQRscan", nil) forState:UIControlStateNormal];
  [_btnStartQRscan setTitle:NSLocalizedString(@"Redeem.Button.StartQRscan", nil) forState:UIControlStateHighlighted];
}

- (IBAction)onClickSubmitNumbercodeButton:(id)sender {
  [self endEditing:YES];
  
  if (self.fldEnterNumbercode.text.length == 0) {
    WarningAlert(NSLocalizedString(@"Warning.Message.EnterNumcode", nil), self, kNilNumberCodeWarningTag);
  } else {
    self.fldEnterNumbercodeBkg.image = [UIImage imageNamed:@"POS_04-checking_Textbox"];
    ValidateNumcode *validateNumcode = [[ValidateNumcode alloc] init];
    validateNumcode.delegate = self;
    validateNumcode.redeemCode = self.fldEnterNumbercode.text;
    
    NSLog(@"validateNumcode.redeemCode == %@", validateNumcode.redeemCode);
    [AppServiceWrapper sendRequest:validateNumcode];
  }
}

- (IBAction)onClickQRScanButton:(id)sender {
  [self.viewController process:ScanBarcode withData:nil];
}

- (void)succeed:(BaseResponse *)response {
  NSLog(@"succeed: EnterNumcode: response == %@", response);
  if ([response isKindOfClass:[ValidCodeResponse class]]) {
    DotransNumcode *dotransNumcode = [[DotransNumcode alloc] init];
    dotransNumcode.redeemCode = self.fldEnterNumbercode.text; // Don't know how to get amout.
    
    NSDictionary *dataDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:dotransNumcode, response, nil] forKeys:[NSArray arrayWithObjects:kNextRequestObject, kCurrentResponseObject, nil]];
    
    [self.viewController process:ValidateCode withData:dataDict];
  } 
}

- (void)failed:(BaseResponse *)response {
  WarningAlert(response.errorMsg, self, kDefaultWarningAlertTag);
}

- (void)progressChange {
  CGFloat progress =  self.customProgressView.progress + 0.01f;
  [self.customProgressView setProgress:progress animated:YES];
  
  if (self.customProgressView.progress >= 1.0f) {
    [self.customProgressView setProgress:0.f animated:YES];
  }
}

- (void)startIndicatorAnimation {
  self.indicatorView.hidden = NO;
  self.timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(progressChange) userInfo:nil repeats:YES];
}

- (void)stopIndicatorAnimation {
  self.fldEnterNumbercode.text = nil;
  self.indicatorView.hidden = YES;
  self.fldEnterNumbercodeBkg.image = [UIImage imageNamed:@"POS_03-numbercode_Textbox"];
  self.customProgressView.progress = 0.0;
  [self.timer invalidate];
  self.timer = nil;
}

@end
