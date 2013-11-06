//
//  ServiceProvider.m
//  MarketingTools
//
//  Created by Megan on 6/14/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "ServiceProvider.h"
#import "RequestConfig.h"
#import "ConnectionHandler.h"
#import "SetUpDeviceResponse.h"
#import "BaseResponse.h"
#import "ValidCodeResponse.h"
#import "RedeemHistoryWrapper.h"
#import "LoginHistoryWrapper.h"

@implementation ServiceProvider

static ServiceProvider *sharedInstance = nil;

+ (ServiceProvider *)sharedInstance {
  @synchronized(self){
    if (sharedInstance == nil) {
      sharedInstance = [[self alloc] init];      
    }
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"RestAPI" ofType:@"plist"];
    NSDictionary *requestData = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    sharedInstance.uri = [requestData objectForKey:@"uri"];
    NSArray *requsts = [requestData objectForKey:@"requests"];
    
    sharedInstance.requestConfigs = [NSMutableDictionary dictionary];
    
    for (NSDictionary *request in requsts) {
      RequestConfig *requestConfig = [[RequestConfig alloc] init];
      requestConfig.url = [request objectForKey:@"url"];
      requestConfig.head = [request objectForKey:@"head"];
      requestConfig.body = [request objectForKey:@"body"];
      requestConfig.method = [request objectForKey:@"method"];
      requestConfig.name = [request objectForKey:@"name"];
      [sharedInstance.requestConfigs setObject:requestConfig forKey:requestConfig.name];
    }
    
    return sharedInstance;
  }
}

//- (void)sendRequest:(NSString *)methodName
//           delagate:(id)delegate
//         configName:(NSString *)configName
//       urlParameter:(NSDictionary *)urlParamDict
//      bodyParameter:(NSDictionary *)bodyParamDict {
//  SEL method = NSSelectorFromString(methodName);
//  ConnectionHandler *handler = [[ConnectionHandler alloc] init];
//  handler.method = method;
////  handler.serviceProvider = self;
//  RequestConfig *requestConfig = (RequestConfig *)[self.requestConfigs objectForKey:configName]; //Key should be configName
//  [requestConfig configURL:urlParamDict body:bodyParamDict];
//  
//  [handler invoke:requestConfig delegate:delegate];
//  [delegate startIndicatorAnimation];
//}

- (void)sendRequest:(BaseRequest *)request {

}

- (void)setUpDevice:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"setUpDevice response: responseDict is === %@", responseDict); 
  [self setUpOrCheckDevice:responseDict andDelegate:delegate];
}

- (void)checkDevice:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"checkDevice response: responseDict is === %@", responseDict);
  [self setUpOrCheckDevice:responseDict andDelegate:delegate];
}

- (void)setUpOrCheckDevice:(NSDictionary *)responseDict andDelegate:(id)delegate {
//  NSString *responseString = [responseDict objectForKey:RESPONSE_STRING];
//  NSString *configName = [responseDict objectForKey:CONFIG_NAME];
  
//  SetUpDeviceResponse *setUpDeviceResponse = [SetUpDeviceResponse setUpDeviceResponse:responseString];
  
//  [self callbackWith:setUpDeviceResponse configName:configName delegate:delegate];
  
}
- (void)validateNumcode:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"validateNumcode response: responseDict is === %@", responseDict);
  [self validateCode:responseDict withDelegate:delegate];
//  [delegate stopIndicatorAnimation];
}


- (void)dotransNumcode:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"dotransNumcode response: responseDict is === %@", responseDict);
  [self validateCode:responseDict withDelegate:delegate];
}

- (void)canceltransNumcode:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"canceltransNumcode response: responseDict is === %@", responseDict);
  [self validateCode:responseDict withDelegate:delegate];
}

- (void)acktransNumcode:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"acktransNumcode response: responseDict is === %@", responseDict);
  [self validateCode:responseDict withDelegate:delegate];
}

- (void)validateBarcode:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"validateBarcode response: responseDict is === %@", responseDict);
  [self validateCode:responseDict withDelegate:delegate];
}

- (void)dotransBarcode:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"dotransBarcode response: responseDict is === %@", responseDict);
 [self validateCode:responseDict withDelegate:delegate];
}

- (void)canceltransBarcode:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"canceltransBarcode response: responseDict is === %@", responseDict);
  [self validateCode:responseDict withDelegate:delegate];
}

- (void)acktransBarcode:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"acktransBarcode response: responseDict is === %@", responseDict);
  [self validateCode:responseDict withDelegate:delegate];
}

- (void)changePosPassword:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"changePosPassword response: responseDict is === %@", responseDict);
 [self setUpOrCheckDevice:responseDict andDelegate:delegate];
}

- (void)getLoginHistory:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"getLoginHistory response: responseDict is === %@", responseDict);
  NSString *responseString = [responseDict objectForKey:RESPONSE_STRING];
  NSString *configName = [responseDict objectForKey:CONFIG_NAME];
  
  LoginHistoryWrapper *loginHistoryWrapper = [LoginHistoryWrapper loginHistoryArray:responseString];
  
  [self callbackWith:loginHistoryWrapper configName:configName delegate:delegate];
}

- (void)validateCode:(NSDictionary *)responseDict withDelegate:(id)delegate {
//  NSString *responseString = [responseDict objectForKey:RESPONSE_STRING];
//  NSString *configName = [responseDict objectForKey:CONFIG_NAME];
//  ValidCodeResponse *validateCodeResponse = [ValidCodeResponse validCodeResponse:responseString];
//  
//  [self callbackWith:validateCodeResponse configName:configName delegate:delegate];
}

- (void)getRedeemedHistory:(NSDictionary *)responseDict delegate:(id)delegate {
  NSLog(@"getRedeemedHistory response: responseDict is === %@", responseDict);
  NSString *responseString = [responseDict objectForKey:RESPONSE_STRING];
  NSString *configName = [responseDict objectForKey:CONFIG_NAME];
  RedeemHistoryWrapper *historyWrapper = [RedeemHistoryWrapper redeemHistoryArray:responseString];
  
  [self callbackWith:historyWrapper configName:configName delegate:delegate];
}

- (void)callbackWith:(BaseResponse *)response configName:(NSString *)configName delegate:(id)delegate {
  if ([response.status isEqualToString:@"error"]) {
    [delegate failed:response configName:configName];
  } else {
    [delegate succeed:response configName:configName];
  }  
}

@end
