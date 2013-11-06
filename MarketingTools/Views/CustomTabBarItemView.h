//
//  CustomTabBarItemView.h
//  MarketingTools
//
//  Created by Megan on 6/21/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectedItemDelegate <NSObject>

- (void)selectItem:(NSUInteger)index;

@end

@interface CustomTabBarItemView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *selectedItemBkg;
@property (weak, nonatomic) IBOutlet UIButton *btnSelectItem;
@property (weak, nonatomic) IBOutlet UIImageView *itemImg;
@property (weak, nonatomic) IBOutlet UILabel *lblItemTitile;
@property (assign, nonatomic) NSUInteger index;
@property (weak, nonatomic) id<SelectedItemDelegate> delegate;

- (CustomTabBarItemView *)updateCustomTabBarItemView:(CustomTabBarItemView *)itemView withIndex:(NSUInteger)index;

@end
