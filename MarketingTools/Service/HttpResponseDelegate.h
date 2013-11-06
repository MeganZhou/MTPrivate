//
//  HttpResponseDelegate.h
//  MarketingTools
//
//  Created by Megan on 6/16/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpResponseDelegate <NSObject>

@optional

- (void)succeed:(id)response;
- (void)failed:(id)response;

- (void)succeed:(id)response configName:(NSString *)configName;
- (void)failed:(id)response configName:(NSString *)configName;

// loder Animation
- (void)startIndicatorAnimation;
- (void)stopIndicatorAnimation;

@end
