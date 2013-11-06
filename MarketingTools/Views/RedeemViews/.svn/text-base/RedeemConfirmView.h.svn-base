//
//  RedeemConfirmView.h
//  MarketingTools
//
//  Created by Megan on 6/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedeemViewController.h"
#import "HttpResponseDelegate.h"

@class LoadingView;

@interface RedeemConfirmView : UIView <HttpResponseDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *confirmIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblConfirmMsg;

@property (weak, nonatomic) IBOutlet UILabel *lblProduct;
@property (weak, nonatomic) IBOutlet UILabel *lblExpiration;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;

@property (weak, nonatomic) IBOutlet UILabel *lblProductValue;
@property (weak, nonatomic) IBOutlet UILabel *lblExpirationValue;
@property (weak, nonatomic) IBOutlet UILabel *lblDescriptionValue;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeValue;

@property (weak, nonatomic) IBOutlet UIButton *btnConfirmRedemption;
@property (weak, nonatomic) IBOutlet UIButton *btnCancelOrRedeem;

@property (assign, nonatomic) BOOL isValidCodeView;
@property (strong, nonatomic) RedeemViewController *viewController;
@property (strong, nonatomic) NSDictionary *dataForward; // The dict contains next request and current response.
@property (assign, nonatomic) State lastState;
@property (nonatomic, retain) LoadingView *loadingView;

@end
