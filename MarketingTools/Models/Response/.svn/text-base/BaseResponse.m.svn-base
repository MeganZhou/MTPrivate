//
//  BaseResponse.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "BaseResponse.h"

#define kSuccessStatus (@"success")
#define kErrorStatus (@"error")

@implementation BaseResponse

- (id)init {
  self =  [super init];
  if (self) {
    self.status = nil;
  }
  
  return self;
}

- (id)covertJSON2Dict:(NSString *)jsonString {
  NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error = nil;
  id dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
  
  return dict;
}

- (id)responseObject:(NSString *)jsonString {
  NSDictionary *dataDict = [self covertJSON2Dict:jsonString];
  NSLog(@"BaseResponse: dataDict == %@", dataDict);
  
  int length = [jsonString rangeOfString:@"error"].length;  
  int successLength = [jsonString rangeOfString:@"success"].length;
  
  if (length > 0) {
    
    // ResponseMsg has error.
    self.status = kErrorStatus;
    self.errorMsg = [dataDict objectForKey:@"error_description"];    
  } else if (successLength > 0) {
    
    // ResponseMsg is just '{"status":"success"}'.
    self.status = kSuccessStatus;    
  } else {
    // Do something
  }
  
  return self;
}

@end
