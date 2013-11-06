//
//  Preference.h
//  MarketingTools
//
//  Created by Megan on 6/17/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetupDevice.h"
#import "SetUpDeviceResponse.h"

@interface Preference : NSObject

@property (strong, nonatomic) SetupDevice *account;
@property (strong, nonatomic) SetUpDeviceResponse *setUpDeviceResponse;

+ (Preference *)sharedPreference;
- (NSString *)currentTimeStamp;
- (NSString *)getSignature:(id)data;
- (NSString *)sortDict:(NSDictionary *)tempDict;

@end
