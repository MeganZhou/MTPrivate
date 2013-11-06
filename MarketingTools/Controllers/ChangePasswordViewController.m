//
//  ChangePasswordViewController.m
//  MarketingTools
//
//  Created by Megan on 6/27/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "CustomTextField.h"
#import "ChangePassword.h"
#import "ChangePasswordResponse.h"
#import "UIScrollView+UITouch.h"
#import "CustomNavigationBar.h"

#define kAlertViewTag 0

enum {
  NilCurrentPasswordTag = 0,
  NilNewPasswordTag,
  PasswordsNotConsistantTag,
  ConfirmToChangePasswordTag,
  ChangePasswordSuccessTag,
  ChangePasswordFailTag
};

typedef NSUInteger AlertViewTag;

@interface ChangePasswordViewController ()

@property (assign) CGFloat keyboardTopOrign;

@end

@implementation ChangePasswordViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self hideBackButton:NO];
  [self initUIControls];  
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidUnload {
  [self setLblChangePasswordTip:nil];
  [self setBtnChangePassword:nil];
  [self setBtnCancel:nil];
  [self setScrollView:nil];
  [super viewDidUnload];
}

#pragma mark - IBAction

- (IBAction)onClickChangePasswordButton:(id)sender {
  NSString *message = nil;

  if (self.fldCurrentPassword.text.length == 0) {
    message = NSLocalizedString(@"Warning.Message.NilCurrentPassword", nil);
    WarningAlert(message, self, NilCurrentPasswordTag);
  } else if (self.fldNewPassword.text.length == 0) {
    message = NSLocalizedString(@"Warning.Message.NilNewPassword", nil);
    WarningAlert(message, self, NilNewPasswordTag);
  } else if (![self.fldNewPassword.text isEqualToString:self.fldConfirmNewPassword.text]) {
    message = NSLocalizedString(@"Warning.Message.PasswordsNotConsistant", nil);
    WarningAlert(message, self, PasswordsNotConsistantTag);
  } else if ((self.fldCurrentPassword.text.length != 0) && (self.fldNewPassword.text.length != 0)&& (self.fldConfirmNewPassword.text.length != 0)) {
    message = NSLocalizedString(@"Warning.Message.ConfirmToChangePassword", nil);
    WarningAlertWithCancel(message, self, ConfirmToChangePasswordTag);
  } else {    
   // Do nothing
  }
}

- (IBAction)onClickCancelButton:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}


- (void)keyboardWillShow:(NSNotification *)notification {  
  CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
  _keyboardTopOrign = self.view.frame.size.height - keyboardSize.height;
  
  [UIView setAnimationCurve:[[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue]];
  [UIView setAnimationDuration:[[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];

  [self adjustViewLocation];
}

- (void)adjustViewLocation {
  CGFloat btnCancelLowOrign = _btnCancel.frame.origin.y + _btnCancel.frame.size.height;
  UIView *currentResponderView = [self responderView:self.scrollView];
  CGFloat currentResponderViewTopOrign = currentResponderView.frame.origin.y - self.navBar.frame.size.height;
  
  [UIView beginAnimations:nil context:NULL];
    
  if ((btnCancelLowOrign + 5) > _keyboardTopOrign) {
    CGFloat offset = btnCancelLowOrign + 5 - _keyboardTopOrign;
    if (currentResponderViewTopOrign - offset > 0) {
      [self.scrollView setContentOffset:CGPointMake(0, offset)];
    }
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

- (UIView *)responderView:(UIView *)view {
  for (UIView *childView in [view subviews]) {
    if ([childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder]) return childView;
    UIView *findView = [self responderView:childView];
    if (findView) {
      return findView;
    }    
  }
  
  return nil;
}

#pragma mark - Custom Method

- (void)initUIControls {
  _fldCurrentPassword.isNomalField = YES;  
  _fldNewPassword.isNomalField = YES;
  _fldConfirmNewPassword.isNomalField =YES;  

  _fldCurrentPassword.placeholder = NSLocalizedString(@"ChangePassword.Placeholder.CurrentPassword", nil);
  _fldNewPassword.placeholder = NSLocalizedString(@"ChangePassword.Placeholder.NewPassword", nil);
  _fldConfirmNewPassword.placeholder = NSLocalizedString(@"ChangePassword.Placeholder.ConfirmNewPassword", nil);
  
  _lblChangePasswordTip.text = NSLocalizedString(@"Common.ChangePassword", nil);
  
  [_btnChangePassword setTitle:NSLocalizedString(@"Common.ChangePassword", nil) forState:UIControlStateNormal];
  [_btnChangePassword setTitle:NSLocalizedString(@"Common.ChangePassword", nil) forState:UIControlStateHighlighted];
  [_btnCancel setTitle:NSLocalizedString(@"Common.Button.Cancel", nil) forState:UIControlStateNormal];
  [_btnCancel setTitle:NSLocalizedString(@"Common.Button.Cancel", nil) forState:UIControlStateHighlighted];
  
}

#pragma mark - API Request

- (void)changePassword {
  ChangePassword *changePassword = [[ChangePassword alloc] init];
  changePassword.pos_account = AppPreference.account.pos_account;
  changePassword.password = _fldCurrentPassword.text;
  changePassword.newest_password = _fldNewPassword.text;
  changePassword.delegate = self;
  
  [AppServiceWrapper sendRequest:changePassword];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  if (textField == self.fldCurrentPassword) {
    [self.fldNewPassword becomeFirstResponder];
  } else if (textField == self.fldNewPassword) {
    [self.fldConfirmNewPassword becomeFirstResponder];
  } else {
    [textField resignFirstResponder];
  }
  
  return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
  UIImage *textFieldFocusBkg = [UIImage imageNamed:@"POS_03-numbercode_Textbox_Click"];  
  textField.background = textFieldFocusBkg;
  [self adjustViewLocation];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  UIImage *textFieldDefaultBkg = [UIImage imageNamed:@"POS_03-numbercode_Textbox"];  
  textField.background = textFieldDefaultBkg;
  
}

#pragma mark - UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (ConfirmToChangePasswordTag == alertView.tag) {
    switch (buttonIndex) {
      case 0:
        self.fldCurrentPassword.text = nil;
        self.fldNewPassword.text = nil;
        [self.navigationController popViewControllerAnimated:YES];
        break;
      case 1:
        [self changePassword];
        break;
      default:
        break;
    }
  } else if (NilCurrentPasswordTag == alertView.tag) {
    [_fldCurrentPassword becomeFirstResponder];    
  } else if (NilNewPasswordTag == alertView.tag) {
    [_fldNewPassword becomeFirstResponder];
  } else if (PasswordsNotConsistantTag == alertView.tag) {
    _fldNewPassword.text = nil;
    _fldConfirmNewPassword.text = nil;
    [_fldNewPassword becomeFirstResponder];
  } else if (ChangePasswordSuccessTag == alertView.tag) {
    [self.navigationController popViewControllerAnimated:YES];
  } else if (ChangePasswordFailTag == alertView.tag) {
    _fldCurrentPassword.text = nil;
    _fldNewPassword.text = nil;
    _fldConfirmNewPassword.text = nil;
    [_fldCurrentPassword becomeFirstResponder];
  } else {
    // Do nothing
  }
}

#pragma mark - Server delegate

- (void)succeed:(BaseResponse *)response {
  WarningAlert(response.status, self, ChangePasswordSuccessTag);  
}

- (void)failed:(BaseResponse *)response {
  WarningAlert(response.errorMsg, self, ChangePasswordFailTag);
}

@end
