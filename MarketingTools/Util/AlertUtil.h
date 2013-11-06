//
//  AlertUtil.h
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertUtil : NSObject

+ (AlertUtil *)sharedAlertUtil;

- (void)warningAlert:(NSString *)message withDelegate:(id)delegate withTag:(int)tag;
- (void)warningAlertWithCancel:(NSString *)message withDelegate:(id)delegate withTag:(int)tag;

@end
