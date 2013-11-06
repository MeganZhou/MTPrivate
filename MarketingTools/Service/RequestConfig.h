//
//  RequestConfig.h
//  MarketingTools
//
//  Created by Megan on 6/16/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestConfig : NSObject

@property(strong, nonatomic) NSString *url;
@property(strong, nonatomic) NSDictionary *head;
@property(strong, nonatomic) NSString *body;
@property(strong, nonatomic) NSString *method;
@property(strong, nonatomic) NSString *uri;
@property(strong, nonatomic) NSString *name;

- (NSMutableURLRequest *)urlRequest;

- (NSMutableURLRequest *)generateURLRequest:(NSString *)hostUrl;
- (void)configURL:(NSDictionary *)urlParamDict body:(NSDictionary *)bodyParamDict;

@end
