//
//  Page.h
//  MarketingTools
//
//  Created by Megan on 7/2/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequest.h"

@interface Page : BaseRequest

/*!
 Paging break.
 */

@property (assign, nonatomic) int offset; // Current page firstIndex
@property (assign, nonatomic) int currentPage; // Current page
@property (assign, nonatomic) int limit; // Recodes count per page

@end
