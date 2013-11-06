//
//  LoginHistoryViewController.m
//  MarketingTools
//
//  Created by Megan on 6/27/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "LoginHistoryViewController.h"
#import "LoginHistoryWrapper.h"
#import "LoginHistory.h"
#import "Page.h"

@interface LoginHistoryViewController ()

@end

@implementation LoginHistoryViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self hideBackButton:NO];
  
  _loginHistoryTableView.customDelegate = self;
  _loginHistoryTableView.identifier = @"Login";
  
  [self sendRequest:_loginHistoryTableView.page];
}

#pragma mark - API Request

- (void)sendRequest:(Page *)page {
  LoginHistory *loginHistory = [[LoginHistory alloc] init];
  loginHistory.page = page;
  loginHistory.delegate = self;
  
  [AppServiceWrapper sendRequest:loginHistory];
}

#pragma mark - Custom Method

- (void)loadMoreWith:(NSMutableDictionary *)currentDict andPage:(Page *)page {
  _historyDict = currentDict;
  [self sendRequest:page];
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
  
  _loginHistoryTableView.sectionDict = _historyDict;
  [_loginHistoryTableView initHeaderViews];
  [_loginHistoryTableView reloadData];
}

#pragma mark - Server delegate

- (void)succeed:(LoginHistoryWrapper *)response {
  [self reloadHistoryTable:response.loginHistoryDict];
}

#pragma mark - Custom delegate

- (void)loadDetailView:(id)object {
  // Do nothing
}

@end
