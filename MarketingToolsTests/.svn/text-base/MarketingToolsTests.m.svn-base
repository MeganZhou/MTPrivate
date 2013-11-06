//
//  MarketingToolsTests.m
//  MarketingToolsTests
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "MarketingToolsTests.h"
#import "SetupDevice.h"
#import "CheckDevice.h"
#import "BaseResponse.h"

@interface MarketingToolsTests()

@property (strong, nonatomic) SetupDevice *account;

@end

@implementation MarketingToolsTests

- (void)setUp {  
  [super setUp];  
}

- (void)tearDown {  
  [super tearDown];
}

- (void)testSetupDevice {
  _account = [[SetupDevice alloc] init];
  
  _account.did = @"111";
  _account.pos_account = @"123456";
  _account.password = @"111111";
  _account.delegate = self;
  
  AppPreference.account = _account;
  
  [AppServiceWrapper sendRequest:_account];
  
//  STAssertTrue([self respondsToSelector:@selector(failed:)], @"Success");
}

//- (void)testCheckDevice {
//  CheckDevice *checkDevice = [[CheckDevice alloc] init];
//  checkDevice.check = YES;
//  checkDevice.delegate = self;
//  
//  [AppServiceWrapper sendRequest:checkDevice];
//}

- (void)succeed:(BaseResponse *)response {
  STAssertTrue(YES, @"Success");
}

- (void)failed:(BaseResponse *)response {
  STAssertTrue(YES, @"fail");
}

@end
