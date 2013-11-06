//
//  SettingViewController.m
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "SettingViewController.h"
#import "SetupDevice.h"
#import "BaseCollapseCell.h"
#import "LoginHistoryWrapper.h"
#import "ChangePasswordViewController.h"
#import "LoginHistoryViewController.h"
#import "HelpViewController.h"

#define kSettingHelpUrlString (@"http://www.baidu.com")

@interface SettingViewController ()

@end

@implementation SettingViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [_btnLogout setTitle:NSLocalizedString(@"Settings.Button.Logout", nil) forState:UIControlStateNormal];
  [_btnLogout setTitle:NSLocalizedString(@"Settings.Button.Logout", nil) forState:UIControlStateHighlighted];
}

- (void)viewDidUnload {
  [self setSettingTableView:nil];
  [self setBtnLogout:nil];
  [super viewDidUnload];
}

#pragma mark - IBAction

- (IBAction)onClickLogoutButton:(id)sender {
  AppPreference.account = nil;
  AppPreference.setUpDeviceResponse = nil;
  
  [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (FirstSection == section) {
    return 3;
  } else if (SecondSection == section) {
    return 2;
  }
  
  return 0;
}

#pragma mark - UITableView Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  if (section == FirstSection) {
    return [self headerView:@"POS_08-settings_Icon_Account.png" andText:NSLocalizedString(@"Settings.Header.Label.MyAccount", nil)];
  } else if (section == SecondSection) {
    return [self headerView:@"POS_08-settings_Icon_About.png" andText:NSLocalizedString(@"Settings.Header.Label.About", nil)];
  } else {
    // Do nothing
  }
  
  return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
  return [self footerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  return 40.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self defaultTableCell];
  BaseCollapseCell *baseCollapseCell = [self baseCollapseCell];
  
  if (FirstSection == indexPath.section) {
    if (FirstCell == indexPath.row ) {
      [cell.contentView addSubview:[self leftLabel:NSLocalizedString(@"Settings.Label.PosId", nil)]];
      [cell.contentView addSubview:[self labelWith:CGRectMake(85, 10, 60, 21) andText:AppPreference.account.pos_account]];
    } else if (SecondCell == indexPath.row) {
      [baseCollapseCell.contentView addSubview:[self leftLabel:NSLocalizedString(@"Common.ChangePassword", nil)]];
      cell = baseCollapseCell;
    } else if (ThirdCell == indexPath.row) {
      [baseCollapseCell.contentView addSubview:[self leftLabel:NSLocalizedString(@"Settings.Label.LoginHistory", nil)]];
      cell = baseCollapseCell;
    } else {
      // Do nothing
    }
  } else if (SecondSection == indexPath.section) {
    if (FirstCell == indexPath.row) {
      [baseCollapseCell.contentView addSubview:[self leftLabel:NSLocalizedString(@"Settings.Label.HowTo", nil)]];
      cell = baseCollapseCell;
    } else if (SecondCell == indexPath.row) {
      [cell.contentView addSubview:[self leftLabel:NSLocalizedString(@"Settings.Label.ClientVersion", nil)]];
    } else {
      // Do nothing
    }
  } else {
    // Do nothing
  }
  
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self pushNextViewController:indexPath];
}

#pragma mark - Custom Method

- (UIView *)headerView:(NSString *)imageName andText:(NSString *)text {
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
  UIImageView *headerBkg = [[UIImageView alloc] initWithFrame:view.frame];
  headerBkg.image = [UIImage imageNamed:@"POS_07-history_Button.png"];
  UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 20, 20)];
  UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(50, 9, 102, 21)];
  UIFont *font = [UIFont systemFontOfSize:15.0];
  lblTitle.backgroundColor = [UIColor clearColor];
  lblTitle.textColor = [UIColor whiteColor];
  lblTitle.font = font;
  iconImageView.image = [UIImage imageNamed:imageName];
  lblTitle.text = text;
  
  [view addSubview:headerBkg];
  [view addSubview:iconImageView];
  [view addSubview:lblTitle];
  
  return view;
}

- (UIView *)footerView {
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0, 22.0)];
  
  return view;
}

- (UITableViewCell *)defaultTableCell {
  static NSString *identifier = @"CellTableIdentifier";
  UITableViewCell *cell = nil;
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
  }
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
  return cell;
}

- (UILabel *)leftLabel:(NSString *)text {
  CGRect rect = CGRectMake(20, 10, 160, 21);
  UILabel *lblCellLabel = [self labelWith:rect andText:text];
  
  return lblCellLabel;
}

- (UILabel *)labelWith:(CGRect)rect andText:(NSString *)text {
  UILabel *label = [[UILabel alloc]initWithFrame:rect];
  UIFont *font = [UIFont systemFontOfSize:15.0];
  label.backgroundColor = [UIColor clearColor];
  label.textColor = [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:255.0/255.0];
  label.font = font;
  label.text = text;
  
  return label;
}

- (BaseCollapseCell *)baseCollapseCell {
  static NSString *identifier = @"BaseCollapseCell";
  BaseCollapseCell *baseCollapseCell = (BaseCollapseCell *)[self.settingTableView dequeueReusableCellWithIdentifier:identifier];
  
  if (baseCollapseCell == nil) {
    NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"BaseCollapseCell" owner:self options:nil];
    if ([cells count] > 0) {
      baseCollapseCell = (BaseCollapseCell *)[cells objectAtIndex:0];
    }
  }
  [baseCollapseCell.btnExpand addTarget:self action:@selector(btnExpandTapped:withEvent:) forControlEvents:UIControlEventTouchUpInside];
  
  return baseCollapseCell;
}

- (void)btnExpandTapped:(UIControl *)button withEvent:(UIEvent *)event {
  UITableView *tableView = self.settingTableView;
  NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:[[[event touchesForView:button] anyObject] locationInView:tableView]];
  if (indexPath == nil) {
    return;
  }
  [self pushNextViewController:indexPath];
}

- (void)pushNextViewController:(NSIndexPath *)indexPath {
  if ((FirstSection == indexPath.section) && (SecondCell == indexPath.row)) {
    [self addChangePasswordViewControlelr];
  } else if ((FirstSection == indexPath.section) && (ThirdCell == indexPath.row)) {
    [self addLoginHistoryViewControlelr];
  } else if ((SecondSection == indexPath.section) && (FirstCell == indexPath.row)){
    [self addHelpViewControlelr];
  } else {
    // Do nothing
  }
}

- (void)addChangePasswordViewControlelr {
  ChangePasswordViewController *changePasswordViewController = [[ChangePasswordViewController alloc] initWithNibName:@"ChangePasswordViewController" bundle:nil];
  [self.navigationController pushViewController:changePasswordViewController animated:YES];
}

- (void)addLoginHistoryViewControlelr {
  LoginHistoryViewController *loginHistoryViewController = [[LoginHistoryViewController alloc] initWithNibName:@"LoginHistoryViewController" bundle:nil];
  [self.navigationController pushViewController:loginHistoryViewController animated:YES];
}

- (void)addHelpViewControlelr {
  HelpViewController *helpViewController = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
  helpViewController.urlString = kSettingHelpUrlString;
  [self.navigationController pushViewController:helpViewController animated:YES];
}

@end
