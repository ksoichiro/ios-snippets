//
//  SNJSONViewController.m
//  Snippet
//
//  Copyright (c) 2014 Soichiro Kashima. All rights reserved.
//

#import "SNJSONViewController.h"

@interface SNJSONViewController ()

@end

@implementation SNJSONViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.buttonProcess addTarget:self action:@selector(didPushButtonProcess:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didPushButtonProcess:(id)sender
{
    [self process];
}

- (void)process
{
    NSDictionary *subDict = @{@"f": @"foo", @"g": @"bar"};
    NSDictionary *dict = @{@"a": @"1", @"b": @"2", @"c": @"3", @"d": @YES, @"e": subDict};
    NSString *json = [self toJSON:dict];
    [self.textViewProcess setText:json];
}

- (NSString *)toJSON:(NSDictionary *)dict
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
