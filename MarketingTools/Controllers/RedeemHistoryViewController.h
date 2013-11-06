//
//  RedeemHistoryViewController.h
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CustomTableView.h"

@class HistoryFirstLevelCell;

@interface RedeemHistoryViewController : BaseViewController <CustomTableViewDelegate> {
  NSMutableDictionary *_historyDict;
}


@property (weak, nonatomic) IBOutlet CustomTableView *historyTableView;

@end
