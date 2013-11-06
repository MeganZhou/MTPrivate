//
//  RedeemHistoryCell.m
//  MarketingTools
//
//  Created by Megan on 6/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RedeemHistoryCell.h"

@implementation RedeemHistoryCell

- (void)changeCellUI  {
  [super changeCellUI];
}

+ (RedeemHistoryCell *)redeemHistoryCell:(UITableView *)tableView {
  static NSString *identifier = @"RedeemHistoryCell";
  RedeemHistoryCell *secondLevelCell = (RedeemHistoryCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
  
  if (secondLevelCell == nil) {
    NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"RedeemHistoryCell" owner:self options:nil];
    if ([cells count] > 0) {
      secondLevelCell = (RedeemHistoryCell *)[cells objectAtIndex:0];
    }
  }
  
  return secondLevelCell;
}

@end
