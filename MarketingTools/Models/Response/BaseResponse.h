//
//  BaseResponse.h
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponse : NSObject

/*!
 Status is nil by default.
 Not nil means the response has error, or response is just {"status":"success"}.
 */
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *errorMsg; // Error Message

- (id)covertJSON2Dict:(NSString *)jsonString;

- (id)responseObject:(NSString *)jsonString;

@end
