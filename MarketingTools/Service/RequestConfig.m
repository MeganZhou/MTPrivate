//
//  RequestConfig.m
//  MarketingTools
//
//  Created by Megan on 6/16/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RequestConfig.h"

@implementation RequestConfig

- (NSMutableURLRequest *)urlRequest {  
  NSString *url = [NSString stringWithFormat:@"%@%@", self.uri, self.url];
  NSLog(@"current request url is == %@", url);
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                         cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                     timeoutInterval:30000];
  [request setHTTPShouldHandleCookies:YES];
  [request setHTTPMethod:self.method];
  
  NSArray *keyArray = [self.head allKeys];
  for (NSString *key in keyArray) {
    [request addValue:[self.head objectForKey:key] forHTTPHeaderField:key];
  }
  
  if (self.body) {
    [request setHTTPBody:[self.body dataUsingEncoding:NSUTF8StringEncoding]];
  }
  NSLog(@"self.body == %@", self.body);
  
  return request;
}

- (NSMutableURLRequest *)generateURLRequest:(NSString *)hostUrl {
  NSLog(@"current request self.url is == %@", self.url);
  // hostUrl == http://192.168.225.224
  //self.url == setupdevice/...
  NSString *url = [NSString stringWithFormat:@"%@%@", self.uri, self.url];
  NSLog(@"current request url is == %@", url);
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                         cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                     timeoutInterval:60000];
  [request setHTTPShouldHandleCookies:YES];
  [request setHTTPMethod:self.method];
  
  NSArray *keyArray = [self.head allKeys];
  for (NSString *key in keyArray) {
    [request addValue:[self.head objectForKey:key] forHTTPHeaderField:key];    
  }
  
  if (self.body) {
    [request setHTTPBody:[self.body dataUsingEncoding:NSUTF8StringEncoding]];
  }
  NSLog(@"self.body == %@", self.body);
  
  return request;
}

- (void)configURL:(NSDictionary *)urlParamDict body:(NSDictionary *)bodyParamDict {
  for (NSString *urlParamKey in [urlParamDict allKeys]) {
    self.uri = [NSMutableString stringWithString:[self.uri stringByReplacingOccurrencesOfString:urlParamKey withString:[urlParamDict objectForKey:urlParamKey]]];
  }
  for (NSString *bodyParamKey in [bodyParamDict allKeys]) {
    self.body = [NSMutableString stringWithString:[self.body stringByReplacingOccurrencesOfString:bodyParamKey withString:[bodyParamDict objectForKey:bodyParamKey]]];
  }  
}

@end
