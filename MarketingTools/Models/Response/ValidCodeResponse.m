//
//  ValidCodeResponse.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "ValidCodeResponse.h"
#import "NSString+Util.h"

@implementation ValidCodeResponse

- (id)responseObject:(NSString *)jsonString {   
  [super responseObject:jsonString];
  
  if (self.status) {
    return self;
  }
  
  NSDictionary *dataDict = [self covertJSON2Dict:jsonString];
//  NSLog(@"ValidCodeResponse: dataDict == %@", dataDict);
  
  self.type = [dataDict objectForKey:@"type"];
  self.codeStatus = [dataDict objectForKey:@"status"];
  self.name = [dataDict objectForKey:@"name"];
  self.created = [dataDict objectForKey:@"created"];
  self.updated = [dataDict objectForKey:@"updated"];
  self.expire_time = [dataDict objectForKey:@"expire_time"];
  self.description = [dataDict objectForKey:@"description"];
  
  return self;
}

@end
