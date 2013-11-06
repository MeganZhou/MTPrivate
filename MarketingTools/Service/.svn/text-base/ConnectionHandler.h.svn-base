//
//  ConnectionHandler.h
//  MarketingTools
//
//  Created by Megan on 6/16/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpResponseDelegate.h"

@class RequestConfig;
@class ServiceProvider;

const NSString *CONFIG_NAME;
const NSString *RESPONSE_STRING;

@interface ConnectionHandler : NSObject<NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSString *responseString;
@property (strong, nonatomic) NSURLConnection *connection; // No need this connection
@property (strong, nonatomic) NSString *errorMessage;
@property (nonatomic) BOOL hasError;

- (void)send:(BaseRequest *)baseRequest;

@end
