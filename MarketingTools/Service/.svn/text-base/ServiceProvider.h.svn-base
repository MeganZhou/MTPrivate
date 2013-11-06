//
//  ServiceProvider.h
//  MarketingTools
//
//  Created by Megan on 6/14/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseRequest;

@interface ServiceProvider : NSObject

@property (strong, nonatomic) NSString *uri;
@property (strong, nonatomic) NSMutableDictionary *requestConfigs;

+ (ServiceProvider *)sharedInstance;

- (void)sendRequest:(NSString *)methodName
           delagate:(id)delegate
         configName:(NSString *)configName
       urlParameter:(NSDictionary *)urlParamDict
      bodyParameter:(NSDictionary *)bodyParamDict;

- (void)sendRequest:(BaseRequest *)request;

@end
