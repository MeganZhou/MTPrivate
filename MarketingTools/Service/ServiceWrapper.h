//
//  ServiceWrapper.h
//  MarketingTools
//
//  Created by Megan on 7/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceWrapper : NSObject

+ (ServiceWrapper *)sharedInstance;

- (void)sendRequest:(BaseRequest *)request;

@end
