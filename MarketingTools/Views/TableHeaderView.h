//
//  TableHeaderView.h
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableHeaderView;

@protocol TableHeaderViewDelegate <NSObject>

- (void)collapseOrExpandCells:(TableHeaderView *)headerView;

@end

@interface TableHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *cellBkg;
@property (weak, nonatomic) IBOutlet UILabel *lblMonth;
@property (weak, nonatomic) IBOutlet UILabel *lblDay;
@property (weak, nonatomic) IBOutlet UILabel *lblCount;
@property (weak, nonatomic) IBOutlet UIImageView *countBkg;
@property (weak, nonatomic) IBOutlet UIButton *btnExpand;
@property (weak, nonatomic) IBOutlet UIButton *headerButton;
@property (weak, nonatomic) IBOutlet UILabel *lblMonthName;
@property (weak, nonatomic) IBOutlet UILabel *lblDayName;


@property (weak, nonatomic) id<TableHeaderViewDelegate> delegate;
@property (assign, nonatomic) BOOL isExpand;

- (void)changeCellUI;

@end
