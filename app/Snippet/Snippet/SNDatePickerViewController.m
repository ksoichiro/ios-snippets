//
//  SNDatePickerViewController.m
//  Snippet
//
//  Copyright (c) 2014 Soichiro Kashima. All rights reserved.
//

#import "SNDatePickerViewController.h"

@interface SNDatePickerViewController ()

@end

@implementation SNDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor clearColor]];
    UIView *backView = [[UIView alloc] initWithFrame:self.view.frame];
    backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    [self.view addSubview:backView];
    UIView *wrapper = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 250, self.view.frame.size.width, 250)];
    [wrapper setBackgroundColor:[UIColor whiteColor]];
    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    [wrapper addSubview:picker];
    [self.view addSubview:wrapper];
}

@end
