//
//  ValidCodeResponse.h
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "BaseResponse.h"

@interface ValidCodeResponse : BaseResponse

/*!
 No matter barcode or numcode, response is the same. 
 And most of those just response "success" if there is no error.
 */

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *codeStatus;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *created;
@property (strong, nonatomic) NSString *updated;
@property (strong, nonatomic) NSString *expire_time;
@property (strong, nonatomic) NSString *description;

@end
