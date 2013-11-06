//
//  LoginHistoryWrapper.h
//  MarketingTools
//
//  Created by Megan on 6/24/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@interface LoginHistoryWrapper : BaseResponse

@property (strong, nonatomic) NSMutableArray *loginHistoryArray; // Redeem history list, not sorted.
@property (strong, nonatomic) NSMutableDictionary *loginHistoryDict; // Redeem history list grouped by date, and sorted by date desc.

@end
