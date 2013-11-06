//
//  ServiceWrapper.m
//  MarketingTools
//
//  Created by Megan on 7/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "ServiceWrapper.h"
#import "ConnectionHandler.h"

@implementation ServiceWrapper

static ServiceWrapper *_sharedInstance = nil;

+ (ServiceWrapper *)sharedInstance {
  @synchronized(self) {
    if (_sharedInstance == nil) {
      _sharedInstance = [[self alloc] init];
    }
  }
  
  return _sharedInstance;
}

- (void)sendRequest:(BaseRequest *)request {
  ConnectionHandler *handler = [[ConnectionHandler alloc] init];
  [handler send:request];
  
  // can not get responseString. Because it will response immediately, before receive data.
 
}

@end
