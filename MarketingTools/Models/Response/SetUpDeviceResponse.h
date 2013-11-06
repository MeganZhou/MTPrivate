//
//  SetUpDeviceResponse.h
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "BaseResponse.h"

@interface SetUpDeviceResponse : BaseResponse

/*!
 Validate/Check device response. Though Check device just response "success".
 */

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSString *expires_in;
@property (strong, nonatomic) NSString *merchant_id;
@property (strong, nonatomic) NSString *merchant_user_id;
@property (strong, nonatomic) NSString *merchant_name;

@end
