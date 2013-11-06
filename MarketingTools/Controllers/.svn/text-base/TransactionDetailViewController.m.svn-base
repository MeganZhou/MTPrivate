//
//  TransactionDetailViewController.m
//  MarketingTools
//
//  Created by Megan on 6/27/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "TransactionDetailViewController.h"
#import "RedeemHistoryResponse.h"
#import "NSDate+Formatter.h"

@interface TransactionDetailViewController ()

@end

@implementation TransactionDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initControls];
  [self initData];
}

- (void)initControls {
  [self hideBackButton:NO];
  
  _lblTransactionDetail.text = NSLocalizedString(@"TransactionDetail", nil);
  _lblProduct.text = NSLocalizedString(@"Redeem.Label.Product", nil);
  _lblExpiration.text = NSLocalizedString(@"Redeem.Label.Expiration", nil);
  _lblDescription.text = NSLocalizedString(@"Redeem.Label.Description", nil);
  _lblTime.text = NSLocalizedString(@"Redeem.Label.Time", nil);
}

- (void)initData {
  _lblProductValue.text = _redeemHistory.product.name;
  _lblExpirationValue.text = _redeemHistory.barcodeResponse.exp_datetime;
  _lblDescriptionValue.text = _redeemHistory.product.description;
  _lblTimeValue.text = [_redeemHistory.redeemed_datetime dateString];
}

@end
