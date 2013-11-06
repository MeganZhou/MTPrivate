//
//  AlertUtil.m
//  MarketingTools
//
//  Created by Megan on 6/20/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "AlertUtil.h"
#import "SynthesizeSingleton.h"

@implementation AlertUtil

SYNTHESIZE_SINGLETON_FOR_CLASS(AlertUtil);

- (void)warningAlert:(NSString *)message withDelegate:(id)delegate withTag:(int)tag {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                  message:message                                                 
                                                 delegate:delegate
                                        cancelButtonTitle:nil
                                        otherButtonTitles:NSLocalizedString(@"Warning.Button.OK", nil), nil];
  alert.tag = tag;
  [alert show];
}

- (void)warningAlertWithCancel:(NSString *)message withDelegate:(id)delegate withTag:(int)tag {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                  message:message                                                 
                                                 delegate:delegate
                                        cancelButtonTitle:NSLocalizedString(@"Warning.Button.Cancel", nil)
                                        otherButtonTitles:NSLocalizedString(@"Warning.Button.OK", nil), nil];
  alert.tag = tag;
  [alert show];
}

@end
