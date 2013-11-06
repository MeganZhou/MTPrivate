//
//  RedeemViewController.m
//  MarketingTools
//
//  Created by Megan on 6/8/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "RedeemViewController.h"
#import "RedeemEnterNumbercodeView.h"
#import "RedeemConfirmView.h"
#import "Barcode.h"
#import "ValidateBarcode.h"
#import "ValidCodeResponse.h"
#import "DotransBarcode.h"

struct StateMachine StateMachines[] = {
  {ScanBarcode, enterNumcode, EnterNumcode},
  {ScanBarcode, validateCode, ValidateCode},
  {EnterNumcode, validateCode, ValidateCode},
  {EnterNumcode, scanBarcode, ScanBarcode},
  {ValidateCode, confirmCode, ConfirmCode},
  {ValidateCode, cancelRedeem, ScanBarcode},
  {ValidateCode, cancelRedeem, EnterNumcode},
  {ConfirmCode, redeemAnother, ScanBarcode},
  {ConfirmCode, redeemAnother, EnterNumcode}
};

@interface RedeemViewController ()

@property (assign, nonatomic) State currentState;
@property (assign, nonatomic) State lastState;
@property (strong, nonatomic) NSString *redeemCode;

@end

@implementation RedeemViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {  
  [super viewDidLoad];     
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  [_btnEnterNumcode setTitle:NSLocalizedString(@"Redeem.Button.EnterNumcode", nil) forState:UIControlStateNormal];
  [_btnEnterNumcode setTitle:NSLocalizedString(@"Redeem.Button.EnterNumcode", nil) forState:UIControlStateHighlighted];  
  
  _currentState = scanBarcode;
  
  [self scanBarcode];
}

- (void)process:(State)nextState withData:(NSDictionary *)data {
  int stateMachineCount = sizeof(StateMachines)/sizeof(struct StateMachine);
  
  for (int index = 0 ; index < stateMachineCount; index ++) {    
    if ((_currentState == StateMachines[index].currentState) && (nextState == StateMachines[index].nextState)) {
      _lastState = _currentState;
      _currentState = nextState;
      
      NSString *stringSelector = [[self selectorDict] objectForKey:[NSNumber numberWithInt:StateMachines[index].selector]];
      
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"      
      if ([self respondsToSelector:NSSelectorFromString(stringSelector)]) {
        if (data == nil) {
          [self performSelector:NSSelectorFromString(stringSelector)];
        } else {
          [self performSelector:NSSelectorFromString(stringSelector) withObject:data];
        }        
      }      
    }
  }
}

- (void)viewDidUnload {
  [self setBtnEnterNumcode:nil];
  [super viewDidUnload];
}

#pragma mark - IBAction

- (IBAction)onClickEnterNumCodeButton:(id)sender {
  [self process:EnterNumcode withData:nil];
}

#pragma mark - Custom Method

- (void)scanBarcode {
  for (UIView *view in [self.view subviews]) {
    if ([view isKindOfClass:[RedeemConfirmView class]]||[view isKindOfClass:[RedeemEnterNumbercodeView class]]) {
      [view removeFromSuperview];
    }
  }
  
  [self initScanner];
}

- (void)enterNumcode {
  _enterNumbercodeView.viewController = self;
  [self.view addSubview:_enterNumbercodeView];
}

- (void)validateCode:(NSDictionary *)data {
  self.redeemConfirmView.isValidCodeView = YES;
  self.redeemConfirmView.dataForward = [NSDictionary dictionaryWithDictionary:data];
  self.redeemConfirmView.lastState = _lastState;
  [self.redeemConfirmView layoutSubviews];
  self.redeemConfirmView.viewController = self;
  [self.view addSubview:self.redeemConfirmView];
}

- (void)confirmCode {
  self.redeemConfirmView.isValidCodeView = NO;
  [self.redeemConfirmView layoutSubviews];
}

- (void)cancelRedeem {
  [self.redeemConfirmView removeFromSuperview];
}

- (void)redeemAnother {
  [self.redeemConfirmView removeFromSuperview];
}

- (NSDictionary *)selectorDict {
  NSArray *stringSelectors = [NSArray arrayWithObjects:@"scanBarcode", @"enterNumcode", @"validateCode:", @"confirmCode", @"cancelRedeem", @"redeemAnother", nil];
  NSArray *keys = [NSArray arrayWithObjects:[NSNumber numberWithInt:scanBarcode],[NSNumber numberWithInt:enterNumcode], [NSNumber numberWithInt:validateCode], [NSNumber numberWithInt:confirmCode], [NSNumber numberWithInt:cancelRedeem], [NSNumber numberWithInt:redeemAnother],nil];
  
  NSDictionary *selectorDict = [NSDictionary dictionaryWithObjects:stringSelectors forKeys:keys];
  
  return selectorDict;
}

- (NSArray *)nibs {
  NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"RedeemViewController" owner:self options:nil];
  
  return nibs;
}

- (void)succeed:(BaseResponse *)response {
  if ([response isKindOfClass:[ValidCodeResponse class]]) {
    DotransBarcode *dotransBarcode = [[DotransBarcode alloc] init];
    dotransBarcode.redeemCode = _redeemCode; // Don't know how to get amout.
    
    NSDictionary *dataDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:dotransBarcode, response, nil] forKeys:[NSArray arrayWithObjects:kNextRequestObject, kCurrentResponseObject, nil]];
    
    [self process:ValidateCode withData:dataDict];
  }
}

#pragma mark - Init Scanner

- (void)initScanner {  
  if ([[self childViewControllers] count] > 0) {
    ZBarReaderViewController *reader = [[self childViewControllers]objectAtIndex:0];
    [self willMoveToParentViewController:nil];
    [reader removeFromParentViewController];
  }
  
  ZBarReaderViewController *reader = [ZBarReaderViewController new];
  reader.readerDelegate = self;
  reader.supportedOrientationsMask = ZBarOrientationMaskAll;
  
  ZBarImageScanner *scanner = reader.scanner;
  [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
  
  reader.showsZBarControls = NO;
  [self addChildViewController:reader];
  [reader didMoveToParentViewController:self];
  reader.view.frame = CGRectMake(0, 0, self.scanView.frame.size.width, self.scanView.frame.size.height);
  [self.scanView addSubview:reader.view];
}

#pragma mark - Scanner Delgate

- (void)imagePickerController:(UIImagePickerController*)reader
didFinishPickingMediaWithInfo:(NSDictionary*) info {
  id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
  ZBarSymbol *symbol = nil;
  
  for(symbol in results) {
    break;
  }
  
  NSLog(@"symbol.data == %@", symbol.data);
  
  if (symbol.data != nil) {
    _redeemCode = symbol.data;
    
    ValidateBarcode *validateBarcode = [[ValidateBarcode alloc] init];
    validateBarcode.delegate = self;
    validateBarcode.redeemCode = _redeemCode;
    
    [AppServiceWrapper sendRequest:validateBarcode];
  }  
}

@end
