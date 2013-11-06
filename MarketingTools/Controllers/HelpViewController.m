//
//  HelpViewController.m
//  MarketingTools
//
//  Created by Megan on 7/2/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self hideBackButton:NO];
  
  _webView.delegate = self;
  [self initActivityView];
  
  [self loadWebViewWith:self.urlString];
}

- (void)initActivityView {
  _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
  [_activityIndicatorView setCenter:self.view.center] ;
  [_activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleWhite] ;
  [self.view addSubview:_activityIndicatorView] ;
}

- (void)loadWebViewWith:(NSString *)urlString {
  NSURL *url = [NSURL URLWithString:urlString];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [_webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
  [_activityIndicatorView startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
  [_activityIndicatorView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
  [alterview show];
}

- (void)viewDidUnload {
  [self setWebView:nil];
  [super viewDidUnload];
}

@end
