//
//  CustomTableView.m
//  MarketingTools
//
//  Created by Megan on 6/28/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "CustomTableView.h"
#import "RedeemHistoryCell.h"
#import "NSString+Util.h"
#import "RedeemHistoryResponse.h"
#import "LoginHistoryResponse.h"
#import "NSDate+Formatter.h"
#import "Page.h"

#define kFirstIndex 0
#define kFirstPage 0
#define kFirstPageOffset 0
#define kPageLimit 10

const NSString *REDEEM_HISTORY = @"Redeem";
const NSString *LOGIN_HISTORY = @"Login";

@interface CustomTableView()

@property (strong, nonatomic) NSArray *keysArray;

@end

@implementation CustomTableView

- (void)awakeFromNib {
  self.dataSource = self;
  self.delegate = self;
  _page = [[Page alloc] init];
  _page.currentPage = kFirstPage;
  _page.offset = kFirstPageOffset;
  _page.limit = kPageLimit;
}

- (void)initHeaderViews {
  _headerViewArray = [NSMutableArray arrayWithCapacity:[_sectionDict count]];
  for (int index = kFirstIndex; index < [_sectionDict count]; index ++) {
    TableHeaderView *headerView = [[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    headerView.delegate = self;
    if (kFirstIndex == index) {
      headerView.isExpand = YES;
      [headerView changeCellUI];
    }
    
    [_headerViewArray addObject:headerView];
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 40.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  _keysArray = [[_sectionDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
  _keysArray = [[_keysArray reverseObjectEnumerator] allObjects];
  return [_keysArray count] + 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  if (section == [_sectionDict count]) {
    return [self loadMoreView];
  } else {
    TableHeaderView *headerView = [_headerViewArray objectAtIndex:section];
    NSString *dateKey = [_keysArray objectAtIndex:section];
    
    NSDateComponents *dayComponents = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[dateKey stringToDate:@"yyyy-MM-dd"]];
    
    if (dayComponents.month < 10) {
      headerView.lblMonth.text = [NSString stringWithFormat:@"0%d", dayComponents.month];
    } else {
      headerView.lblMonth.text = [NSString stringWithFormat:@"%d", dayComponents.month];
    }
    if (dayComponents.day < 10) {
      headerView.lblDay.text = [NSString stringWithFormat:@"0%d", dayComponents.day];
    } else {
      headerView.lblDay.text = [NSString stringWithFormat:@"%d", dayComponents.day];
    }
    
    NSArray *dataArray = [_sectionDict objectForKey:dateKey];    
    headerView.lblCount.text = [[NSString alloc] initWithFormat:@"%d", [dataArray count]];
    
    return headerView;
  }
}

- (UIView *)loadMoreView {
  UIView *loadMoreView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0, 40.0)];
  loadMoreView.backgroundColor = [UIColor colorWithRed:210.0/255.0 green:210.0/255.0 blue:210.0/255.0 alpha:255.0/255.0];
  UILabel *label = [[UILabel alloc] initWithFrame:loadMoreView.frame];
  label.textAlignment = NSTextAlignmentCenter;
  label.text = NSLocalizedString(@"Table.Label.More", nil);
  label.textColor = [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:255.0/255.0];
  label.font = [UIFont systemFontOfSize:15.0];
  label.backgroundColor = [UIColor clearColor];
  UIButton *button = [[UIButton alloc] initWithFrame:loadMoreView.frame];
  [button addTarget:self action:@selector(loadMore) forControlEvents:UIControlEventTouchUpInside];
  
  UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"POS_07-history_Line"]];
  imageView.frame = CGRectMake(0, loadMoreView.frame.size.height-1.0, loadMoreView.frame.size.width, 2.0);
  
  [loadMoreView addSubview:label];
  [loadMoreView addSubview:button];
  [loadMoreView addSubview:imageView];
  
  return loadMoreView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (section < [_headerViewArray count]) {
    TableHeaderView *headerView = [_headerViewArray objectAtIndex:section];
    if (headerView.isExpand) {
      NSArray *dataArray = [_sectionDict objectForKey:[_keysArray objectAtIndex:section]];
      return [dataArray count];
    }
  }
  
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  RedeemHistoryCell *customCell = [RedeemHistoryCell redeemHistoryCell:tableView];
  NSString *key = [_keysArray objectAtIndex:indexPath.section];
  NSArray *dataArray = [_sectionDict objectForKey:key];
  
  if ([LOGIN_HISTORY isEqualToString:self.identifier]) {
    customCell.lblDescription.hidden = YES;
    customCell.btnExpand.hidden = YES;
    LoginHistoryResponse *loginHistory = [dataArray objectAtIndex:indexPath.row];
    customCell.lblProduct.text = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Login.Placeholder.PosAccount", nil), loginHistory.pos_account];
    customCell.lblTime.text = [NSString stringWithFormat:@"%@", [loginHistory.login_datetime timeString]];
  } else {
    customCell.lblDescription.hidden = NO;
    customCell.btnExpand.hidden = NO;
    RedeemHistoryResponse *redeemHistory = [dataArray objectAtIndex:indexPath.row];
    customCell.lblProduct.text = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Redeem.Label.Product", nil), redeemHistory.product.name];
    customCell.lblDescription.text = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Redeem.Label.Description", nil), redeemHistory.product.description];
    customCell.lblTime.text = [NSString stringWithFormat:@"%@", [redeemHistory.redeemed_datetime timeString]];
  }
  
  customCell.selectionStyle = UITableViewCellSelectionStyleNone;  
  
  return customCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *key = [_keysArray objectAtIndex:indexPath.section];
  NSArray *dataArray = [_sectionDict objectForKey:key];
  
  [_customDelegate loadDetailView:[dataArray objectAtIndex:indexPath.row]];
}


- (void)collapseOrExpandCells:(TableHeaderView *)headerView {
  [self reloadData];
}

- (void)loadMore {
  _page.currentPage ++;
  _page.offset = _page.currentPage * _page.limit;
  [_customDelegate loadMoreWith:_sectionDict andPage:_page];
}

@end
