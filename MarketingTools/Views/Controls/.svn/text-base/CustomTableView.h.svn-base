//
//  CustomTableView.h
//  MarketingTools
//
//  Created by Megan on 6/28/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableHeaderView.h"

@class Page;

NSString const *REDEEM_HISTORY;
NSString const *LOGIN_HISTORY;

@protocol CustomTableViewDelegate <NSObject>

- (void)loadDetailView:(id)object;
- (void)loadMoreWith:(NSMutableDictionary *)currentDict andPage:(Page *)page;

@end

@interface CustomTableView : UITableView<UITableViewDataSource, UITableViewDelegate, TableHeaderViewDelegate> {
  NSMutableArray *_headerViewArray;
  NSMutableDictionary *_dataSourceDict;
}

@property (strong, nonatomic) NSMutableDictionary *sectionDict;
@property (strong, nonatomic) NSMutableDictionary *cellDataDict;
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) Page *page;

@property (weak, nonatomic) id<CustomTableViewDelegate> customDelegate;

- (void)initHeaderViews;

@end
