//
//  SetupDevice.h
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "BaseRequest.h"

@interface SetupDevice : BaseRequest

/*!
 Set up device and check device API, request model.
 */
@property (strong, nonatomic) NSString *pos_account;
@property (strong, nonatomic) NSString *password;

@end
