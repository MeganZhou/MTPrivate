//
//  ViewController.m
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "LoginViewController.h"
#import "RedeemViewController.h"
#import "RedeemHistoryViewController.h"
#import "SettingViewController.h"
#import "SetupDevice.h"
#import "SetUpDeviceResponse.h"
#import "CustomTabBarViewController.h"
#import "CustomTextField.h"
#import "CheckDevice.h"
#import "CheckDeviceResponse.h"
#import "UIScrollView+UITouch.h"
#import "UIDevice+IdentifierAddition.h"
#import "CustomLinkedButton.h"
#import "HelpViewController.h"
#import "UILabel+Util.h"

#define kGetPOSAccountUrlString (@"http://www.baidu.com")
#define kHasProblemUrlString (@"http://www.google.com")

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {   
  [super viewDidLoad];  
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self initUICotrols];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidUnload {
  [self setLblHowto:nil];
  [self setBtnGetAccount:nil];
  [self setBtnHasProblem:nil];
  [self setScrollView:nil];
  [super viewDidUnload];
}

#pragma mark - IBAction

- (IBAction)onClickLogin:(id)sender {
  [self.view endEditing:YES];
  if (_fldPosAccount.text.length == 0 ) {
    WarningAlert(NSLocalizedString(@"Warning.Message.NilPosAccount", nil), self, kDefaultWarningAlertTag);
    [_fldPosAccount becomeFirstResponder];
  }  else if (_fldPassword.text.length == 0) {
    WarningAlert(NSLocalizedString(@"Warning.Message.NilPassword", nil), self, kDefaultWarningAlertTag);
    [_fldPassword becomeFirstResponder];
  } else {
    _account = [[SetupDevice alloc] init];
    
//    _account.did = @"111";
//    _account.pos_account = @"123456";
//    _account.password = @"111111";
    
    //6894628 7171104 123337
    
    _account.delegate = self;
    
    _account.did = [[UIDevice currentDevice] uniqueDeviceIdentifier];
    NSLog(@"[self deviceID] == %@", [[UIDevice currentDevice] uniqueDeviceIdentifier]);

    _account.pos_account = self.fldPosAccount.text;
    _account.password = self.fldPassword.text;
    
    AppPreference.account = _account;
    
    [AppServiceWrapper sendRequest:_account];
  }   
}

- (IBAction)onClickGetPOSAccount:(id)sender {
  [self addHelpViewControlelr:kGetPOSAccountUrlString];
}

- (IBAction)onClickHasProblem:(id)sender {
  [self addHelpViewControlelr:kHasProblemUrlString];
}

- (void)keyboardWillShow:(NSNotification *)notification {
  CGFloat btnLoginLowOrign = _btnLogin.frame.origin.y + _btnLogin.frame.size.height;
  CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
  CGFloat keyboardTopOrign = self.view.frame.size.height - keyboardSize.height;
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationCurve:[[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]];
  [UIView setAnimationDuration:[[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
  
  if ((btnLoginLowOrign + 5) > keyboardTopOrign) {
    CGFloat offset = btnLoginLowOrign + 5 - keyboardTopOrign;
    [self.scrollView setContentOffset:CGPointMake(0, offset)];
  }
  [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)notification {
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationCurve:[[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]];
  [UIView setAnimationDuration:[[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
  
  [self.scrollView setContentOffset:CGPointMake(0, 0)];
  [UIView commitAnimations];
}

#pragma mark - Custom Method

- (void)initUICotrols {
  _fldPosAccount.text = nil;
  [_fldPosAccount becomeFirstResponder];
  _fldPassword.text = nil;
  _fldPosAccount.isNomalField = NO;
  _fldPassword.isNomalField = NO;
  _fldPosAccount.iconName = @"POS_01-landing_Icon_Account.png";
  _fldPassword.iconName = @"POS_01-landing_Icon_Password.png";
  
  // Localization
  _fldPosAccount.placeholder = NSLocalizedString(@"Login.Placeholder.PosAccount", nil);
  _fldPassword.placeholder = NSLocalizedString(@"Login.Placeholder.YourPassword", nil);
  
  [_btnLogin setTitle:NSLocalizedString(@"Login.Button.Login", nil) forState:UIControlStateNormal];
  [_btnLogin setTitle:NSLocalizedString(@"Login.Button.Login", nil) forState:UIControlStateHighlighted];
  
  [_btnGetAccount setTitle:NSLocalizedString(@"Login.Label.GetAccount", nil) forState:UIControlStateNormal];
  [_btnGetAccount setTitle:NSLocalizedString(@"Login.Label.GetAccount", nil) forState:UIControlStateHighlighted];
  UILabel *label = [UILabel updateLabel:_btnGetAccount.titleLabel withString:_btnGetAccount.titleLabel.text andFont:nil andColor:nil];
  _btnGetAccount.frame = CGRectMake(_btnGetAccount.frame.origin.x, _btnGetAccount.frame.origin.y, label.frame.size.width, label.frame.size.height);
  
  [_btnHasProblem setTitle:NSLocalizedString(@"Login.Label.Question", nil) forState:UIControlStateNormal];
  [_btnHasProblem setTitle:NSLocalizedString(@"Login.Label.Question", nil) forState:UIControlStateHighlighted];
  
  _lblHowto.text = NSLocalizedString(@"Login.Label.HowTo", nil);
  
  [self initNavBar:@"POS"];
  [self hideBackButton:YES];
}

- (void)pushTabController {
  RedeemViewController *redeemViewController = [[RedeemViewController alloc] initWithNibName:@"RedeemViewController" bundle:nil];
  RedeemHistoryViewController *historyViewController = [[RedeemHistoryViewController alloc] initWithNibName:@"RedeemHistoryViewController" bundle:nil];
  SettingViewController *settingViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
  CustomTabBarViewController *tabBarController = [[CustomTabBarViewController alloc] initWithNibName:@"CustomTabBarViewController" bundle:nil];
  
  tabBarController.controllers = @[redeemViewController, historyViewController, settingViewController];
  [self.navigationController pushViewController:tabBarController animated:YES];
}

- (void)addHelpViewControlelr:(NSString *)urlString {
  HelpViewController *helpViewController = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
  helpViewController.urlString = urlString;
  [self.navigationController pushViewController:helpViewController animated:YES];
}

#pragma mark - Server delegate

- (void)succeed:(BaseResponse *)response {
  if ([response isKindOfClass:[SetUpDeviceResponse class]]) {
    AppPreference.setUpDeviceResponse = (SetUpDeviceResponse *)response;
    
    CheckDevice *checkDevice = [[CheckDevice alloc] init];
    checkDevice.check = YES;
    checkDevice.delegate = self;
    
    [AppServiceWrapper sendRequest:checkDevice];
  } else if ([response isKindOfClass:[CheckDeviceResponse class]]) {
     [self pushTabController];
  }
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  if (textField == self.fldPosAccount) {
    [self.fldPassword becomeFirstResponder];
  } else {
    [textField resignFirstResponder];
  }
  
  return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
  UIImage *textFieldFocusBkg = [UIImage imageNamed:@"POS_01-landing_Textbox_Click"];
  textField.background = textFieldFocusBkg;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  UIImage *textFieldDefaultBkg = [UIImage imageNamed:@"POS_01-landing_Textbox"];
  textField.background = textFieldDefaultBkg;
}

@end
