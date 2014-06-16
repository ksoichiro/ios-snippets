//
//  SNWebViewController.m
//  Snippet
//
//  Copyright (c) 2014 Soichiro Kashima. All rights reserved.
//

#import "SNWebViewController.h"

@interface SNWebViewController ()

@end

@implementation SNWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _webView.delegate = self;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com"]]];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"WebView started loading");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"WebView finished loading");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSString *js = @"$(function(){$('#js-command-bar-field').val('ios-snippets');});";
    [_webView stringByEvaluatingJavaScriptFromString:js];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"WebView failed to load: %@", error);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
