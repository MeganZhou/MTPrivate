//
//  Preference.m
//  MarketingTools
//
//  Created by Megan on 6/17/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "Preference.h"
#import "SynthesizeSingleton.h"
#import <CommonCrypto/CommonHMAC.h>
#import "NSString+Util.h"
#import "Base64.h"

@implementation Preference

SYNTHESIZE_SINGLETON_FOR_CLASS(Preference);

- (NSData *)HMACString:(NSString *)string withSecret:(NSString*)secret {
  CCHmacContext    ctx;
  const char       *key = [secret UTF8String];
  const char       *str = [string UTF8String];
  unsigned char    mac[CC_SHA256_DIGEST_LENGTH];
  
  CCHmacInit(&ctx, kCCHmacAlgSHA256, key, strlen(key));
  CCHmacUpdate(&ctx, str, strlen(str));
  CCHmacFinal(&ctx, mac);
  
  NSData *binaryData = [NSData dataWithBytes:mac length:CC_SHA256_DIGEST_LENGTH];
  
  return binaryData;
}

- (NSString *)currentTimeStamp {
  NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
  NSTimeInterval timeInterval = [date timeIntervalSince1970];
  NSString *timestamp = [NSString stringWithFormat:@"%0.f", timeInterval];

  return timestamp;
}

- (NSString *)sortDict:(NSDictionary *)tempDict {
  NSMutableString *newString = [[NSMutableString alloc] init];
  NSArray *keyArray = [[tempDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
  
  for (NSString *key in keyArray) {
    if (nil != [tempDict objectForKey:key]) {
      [newString appendFormat:@"%@=%@&",[key urlEncode], [[tempDict objectForKey:key] urlEncode]];
    }    
  }
  
  NSString *resultString = [[newString substringFromIndex:0] substringToIndex:(newString.length - 1)];
  
  return resultString;
}

- (NSString *)getSignature:(id)data {
  NSString *requestData = nil;
  if ([data isKindOfClass:[NSString class]]) {
    requestData = [data sortString];
  } else if ([data isKindOfClass:[NSDictionary class]]) {
    requestData = [AppPreference sortDict:data];
  } else {
    // Do nothing
  }
  
  NSData *hmacData = [NSData data];
  if (self.setUpDeviceResponse.token == nil) {
    NSLog(@"Token is nil");    
  } else {
    hmacData = [self HMACString:requestData withSecret:self.setUpDeviceResponse.token];
  }

  NSString *base64String =  [hmacData base64EncodedString];
  return [base64String urlEncode];
}

@end
