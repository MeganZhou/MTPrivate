//
//  LoginHistoryResponse.h
//  MarketingTools
//
//  Created by Megan on 6/24/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "BaseResponse.h"

@interface LoginHistoryResponse : BaseResponse

@property (strong, nonatomic) NSString *did;
@property (strong, nonatomic) NSString *pos_account;
@property (strong, nonatomic) NSDate *login_datetime;

+ (id)loginHistory:(NSDictionary *)dataDict;

@end
