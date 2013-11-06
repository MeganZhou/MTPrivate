//
//  ConnectionHandler.m
//  MarketingTools
//
//  Created by Megan on 6/16/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "ConnectionHandler.h"
#import "CheckDevice.h"
#import "CheckDeviceResponse.h"
#import "ValidateNumcode.h"
#import "ValidateBarcode.h"
#import "ValidCodeResponse.h"
#import "DotransNumcode.h"
#import "DotransNumcodeResponse.h"
#import "DotransBarcode.h"
#import "DotransBarcodeResponse.h"
#import "AcktransNumcode.h"
#import "AcktransBarcode.h"
#import "CanceltransNumcode.h"
#import "CanceltransBarcode.h"
#import "AcktransNumcodeReponse.h"
#import "AcktransBarcodeResponse.h"
#import "CanceltransNumcodeReponse.h"
#import "CanceltransBarcodeResponse.h"
#import "RedeemHistory.h"
#import "RedeemHistoryWrapper.h"
#import "ChangePassword.h"
#import "ChangePasswordResponse.h"
#import "LoginHistory.h"
#import "LoginHistoryWrapper.h"

@interface ConnectionHandler()

@property (nonatomic) SEL sucMethod;
@property (nonatomic) SEL failMethod;
@property (strong, nonatomic) BaseRequest *currentRequest;

@end

@implementation ConnectionHandler

- (id)init {
  self = [super init];
  if (self) {
    self.connection = nil;
    self.responseData = nil;
    self.responseString = nil;
    self.errorMessage = nil;
    self.hasError = NO;
    self.sucMethod = @selector(succeed:);
    self.failMethod = @selector(failed:);
  }
  
  return self;
}

- (void)send:(BaseRequest *)requestObj {
  _currentRequest = requestObj;
  
  [requestObj.requestConfig configURL:nil body:requestObj.bodyDict];
  
  NSMutableURLRequest *httpRequest = [requestObj.requestConfig urlRequest];
  
  NSURLConnection *connection = [NSURLConnection connectionWithRequest:httpRequest delegate:self];
  self.connection = connection;
  [requestObj.delegate startIndicatorAnimation];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)response;
  self.responseData = [NSMutableData data];
  uint errorCode = [httpUrlResponse statusCode];
  if (errorCode > 300) {
    self.hasError = YES;
  }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [self.responseData appendData:data];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  self.hasError = YES;
  if ([error code] == kCFURLErrorNotConnectedToInternet || [error code] == kCFURLErrorCannotConnectToHost) {
    self.errorMessage = NSLocalizedString(@"Warning.Message.NoNetwork", nil);
  } else if ([error code] == kCFURLErrorTimedOut) {
    self.errorMessage = NSLocalizedString(@"Warning.Message.TimeOut", nil);
  } else {
    self.errorMessage = NSLocalizedString(@"Warning.Message.NetworkError", nil);
  }

  [_currentRequest.delegate stopIndicatorAnimation];
  WarningAlert(self.errorMessage, _currentRequest.delegate, kDefaultWarningAlertTag);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  self.responseString = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
  BaseResponse *response = [self response:self.responseString];
  
  if (self.errorMessage != nil) {
    self.responseString = nil;
    self.hasError = YES;
    WarningAlert(self.errorMessage, _currentRequest.delegate, kDefaultWarningAlertTag);
//    NSLog(@"self.errorMessage == %@", self.errorMessage);
  } else {
    if ([response.status isEqualToString:@"error"]) {
      if ([_currentRequest.delegate respondsToSelector:self.failMethod]) {
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_currentRequest.delegate performSelector:self.failMethod withObject:response];
      }
    } else {
      if ([_currentRequest.delegate respondsToSelector:self.sucMethod]) {
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_currentRequest.delegate performSelector:self.sucMethod withObject:response];
      }
    }
  }
  
  if ([_currentRequest.delegate respondsToSelector:@selector(stopIndicatorAnimation)]) {
    [_currentRequest.delegate stopIndicatorAnimation];
  }
}

- (BaseResponse *)response:(NSString *)responseString {
//  NSLog(@"response: [_currentRequest class] == %@", [_currentRequest class]);
  NSArray *requestArray = [NSArray
                           arrayWithObjects:[SetupDevice class], [CheckDevice class], [ValidateNumcode class], [DotransNumcode class], [AcktransNumcode class], [CanceltransNumcode class], [ValidateBarcode class], [DotransBarcode class], [AcktransBarcode class], [CanceltransBarcode class],[ChangePassword class], [RedeemHistory class], [LoginHistory class], nil];
  NSArray *responseArray = [NSArray
                            arrayWithObjects:[SetUpDeviceResponse class], [CheckDeviceResponse class], [ValidCodeResponse class], [DotransNumcodeResponse class], [AcktransNumcodeReponse class], [CanceltransNumcodeReponse class], [ValidCodeResponse class], [DotransBarcodeResponse class], [AcktransBarcodeResponse class], [CanceltransBarcodeResponse class], [ChangePasswordResponse class], [RedeemHistoryWrapper class], [LoginHistoryWrapper class], nil];
 
  NSDictionary *classDict = [NSDictionary dictionaryWithObjects:responseArray forKeys:requestArray];
  
  Class responseClass = [classDict objectForKey:[_currentRequest class]];
  BaseResponse *response = [[responseClass alloc] responseObject:responseString];
//  NSLog(@"response: [response class] == %@, status == %@", [response class], response.status);
  
  return response;
}


@end
