//
//  BaseRequest.h
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RequestConfig.h"
#import "HttpResponseDelegate.h"
#import "Constant.h"
#import "NSString+Util.h"

@interface BaseRequest : NSObject

/*!
 Model data to send request.
 */
@property (strong, nonatomic) NSString *did;
@property (strong, nonatomic) NSString *ts;
@property (strong, nonatomic) NSString *sig;

/*!
 params to send http request
 */
@property (strong, nonatomic) RequestConfig *requestConfig;
@property (strong, nonatomic) NSDictionary *bodyDict;

@property (strong, nonatomic) NSString *redeemCode;

@property (weak, nonatomic) id<HttpResponseDelegate> delegate;

@end
