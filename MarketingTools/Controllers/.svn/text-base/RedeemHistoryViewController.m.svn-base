//
//  RedeemHistoryViewController.m
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RedeemHistoryViewController.h"
#import "RedeemHistoryWrapper.h"
#import "NSString+Util.h"
#import "NSDate+Formatter.h"
#import "TransactionDetailViewController.h"
#import "RedeemHistory.h"

@interface RedeemHistoryViewController ()

@end

@implementation RedeemHistoryViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _historyTableView.frame = CGRectMake(_historyTableView.frame.origin.x, _historyTableView.frame.origin.y, _historyTableView.frame.size.width, ScreenHeight - CustomNavbarHeight - CustomTabbarHeight - 5.0);
  _historyTableView.customDelegate = self;
  _historyTableView.identifier = @"Redeem";
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  _historyDict = nil;
  [self sendRequest:_historyTableView.page];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

#pragma mark - Custom Method

- (void)loadDetailView:(RedeemHistoryResponse *)redeemHistory {
  TransactionDetailViewController *detailView = [[TransactionDetailViewController alloc] initWithNibName:@"TransactionDetailViewController" bundle:nil];
  detailView.redeemHistory = redeemHistory;
  [self.navigationController pushViewController:detailView animated:YES];
}

- (void)reloadHistoryTable:(NSMutableDictionary *)responseDict {
  if (_historyDict == nil) {
    _historyDict = [NSMutableDictionary dictionaryWithDictionary:responseDict];
  } else {
    for (NSString *newlyKey in [responseDict allKeys]) {
      if ([[_historyDict allKeys] containsObject:newlyKey]) {
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:[_historyDict objectForKey:newlyKey]];
        [tempArray addObjectsFromArray:[responseDict objectForKey:newlyKey]];
        
        [_historyDict removeObjectForKey:newlyKey];
        [_historyDict setObject:tempArray forKey:newlyKey];
      } else {
        [_historyDict setObject:[responseDict objectForKey:newlyKey] forKey:newlyKey];
      }
    }
  }  
  
  _historyTableView.sectionDict = _historyDict;
  [_historyTableView initHeaderViews];
  [_historyTableView reloadData];
}

#pragma mark - API Request

- (void)sendRequest:(Page *)page {
  RedeemHistory *redeemHistory = [[RedeemHistory alloc] init];
  redeemHistory.page = page;
  redeemHistory.delegate = self;
  
  [AppServiceWrapper sendRequest:redeemHistory];
}

#pragma mark - Server delegate
- (void)succeed:(RedeemHistoryWrapper *)response {
  [self reloadHistoryTable:response.historyDict];
}

#pragma mark - Custom delegate

- (void)loadMoreWith:(NSMutableDictionary *)currentDict andPage:(Page *)page {
  _historyDict = currentDict;
  [self sendRequest:page];
}

@end
