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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.buttonProcess addTarget:self action:@selector(didPushButtonProcess:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
