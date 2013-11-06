//
//  RedeemHistoryResponse.h
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

@class BarCodeReponse;
@class Product;

@interface RedeemHistoryResponse : BaseResponse

@property (strong, nonatomic) NSDate *redeemed_datetime;
@property (strong, nonatomic) BarCodeReponse *barcodeResponse;
@property (strong, nonatomic) Product *product;

+ (id)redeemHistory:(NSDictionary *)dataDict;

@end


@interface BarCodeReponse : NSObject

@property (strong, nonatomic) NSString *barcode_id;
@property (strong, nonatomic) NSString *exp_datetime;

@end

@interface Product : NSObject

@property (strong, nonatomic) NSString *product_id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;

@end