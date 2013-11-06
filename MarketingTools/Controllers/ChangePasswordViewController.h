//
//  ChangePasswordViewController.h
//  MarketingTools
//
//  Created by Megan on 6/27/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class CustomTextField;

@interface ChangePasswordViewController : BaseViewController

@property (weak, nonatomic) IBOutlet CustomTextField *fldCurrentPassword;
@property (weak, nonatomic) IBOutlet CustomTextField *fldNewPassword;
@property (weak, nonatomic) IBOutlet CustomTextField *fldConfirmNewPassword;

@property (weak, nonatomic) IBOutlet UILabel *lblChangePasswordTip;
@property (weak, nonatomic) IBOutlet UIButton *btnChangePassword;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
