//
//  BaseRequest.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "BaseRequest.h"

#define HTTPRequestUri (@"http://192.168.225.224/")
#define POST (@"POST")

@implementation BaseRequest

- (id)init {
  self = [super init];
  if (self) {
    self.ts = [AppPreference currentTimeStamp];
    self.requestConfig = [[RequestConfig alloc] init];
    self.requestConfig.uri = HTTPRequestUri;
    self.requestConfig.method = POST;
    NSDictionary *headerDict = [NSDictionary dictionaryWithObject:@"application/x-www-form-urlencoded" forKey:@"Content-Type"];
    self.requestConfig.head = headerDict;
  }
  
  return self;
}


@end
