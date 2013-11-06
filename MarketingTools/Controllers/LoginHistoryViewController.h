//
//  LoginHistoryViewController.h
//  MarketingTools
//
//  Created by Megan on 6/27/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CustomTableView.h"

@interface LoginHistoryViewController : BaseViewController<CustomTableViewDelegate> {
  NSMutableDictionary *_historyDict;
}


@property (weak, nonatomic) IBOutlet CustomTableView *loginHistoryTableView;
@property (strong, nonatomic) NSArray *loginHistoryArray;

@end
