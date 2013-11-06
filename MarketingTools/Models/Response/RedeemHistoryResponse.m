//
//  RedeemHistoryResponse.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RedeemHistoryResponse.h"
#import "NSString+Util.h"

@implementation RedeemHistoryResponse

+ (id)redeemHistory:(NSDictionary *)dataDict {
  RedeemHistoryResponse *redeemHistory = [[RedeemHistoryResponse alloc] init];
  redeemHistory.redeemed_datetime = [[dataDict objectForKey:@"redeemed_datetime"] stringToDate:@"yyyy-MM-dd HH:mm:ss"];
  
  NSDictionary *barDict = [dataDict objectForKey:@"barcode"];
  BarCodeReponse *barcodeResponse = [[BarCodeReponse alloc] init];
  barcodeResponse.barcode_id = [barDict objectForKey:@"barcode_id"];
  barcodeResponse.exp_datetime = [barDict objectForKey:@"exp_datetime"];
  redeemHistory.barcodeResponse = barcodeResponse;
  
  NSDictionary *productDict = [dataDict objectForKey:@"product"];
  Product *product = [[Product alloc] init];
  product.product_id = [productDict objectForKey:@"product_id"];
  product.name = [productDict objectForKey:@"name"];
  product.description = [productDict objectForKey:@"description"];
  redeemHistory.product = product;
  
  return redeemHistory;
}

@end

@implementation BarCodeReponse

@end

@implementation Product

@end