//
//  SNPickerViewController.m
//  Snippet
//
//  Copyright (c) 2014 Soichiro Kashima. All rights reserved.
//

#import "SNPickerViewController.h"
#import "SNDatePickerViewController.h"

@interface SNPickerViewController ()

@property UIButton *tapMe;
@property UILabel *label;
@property UIButton *overlay;
@property UIView *wrapper;

@end

@implementation SNPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Button to show picker
    self.tapMe = [[UIButton alloc] initWithFrame:
                  CGRectMake(44,
                             (self.view.frame.size.height - 88) / 2,
                             self.view.frame.size.width - 88,
                             44)];
    [self.tapMe setTitle:@"Tap me to select date" forState:UIControlStateNormal];
    [self.tapMe setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.tapMe addTarget:self action:@selector(didPushTapMe) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tapMe];

    // Label to show selected date of DatePicker
    self.label = [[UILabel alloc] initWithFrame:
                  CGRectMake(44,
                             (self.view.frame.size.height - 88) / 2 + 60,
                             self.view.frame.size.width - 88,
                             44)];
    self.label.text = @"(Date will be shown)";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    [self.view addSubview:self.label];
}

- (void)didPushTapMe
{
    // Not work on iOS 8...
//    SNDatePickerViewController *vc = [SNDatePickerViewController new];
//    self.modalPresentationStyle = UIModalPresentationCurrentContext;
//    [self presentViewController:vc animated:YES completion:nil];

    // Overlay semi-transparent view
    // Picker will be closed when the overlay is tapped
    CGRect screen = [UIScreen mainScreen].bounds;
    self.overlay = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height)];
    [self.overlay setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [self.overlay addTarget:self action:@selector(closePicker) forControlEvents:UIControlEventTouchUpInside];

    // Wrapper view for DatePicker and Cancel button
    const CGFloat pickerHeight = 250;
    self.wrapper = [[UIView alloc] initWithFrame:CGRectMake(0, screen.size.height, screen.size.width, pickerHeight)];
    [self.wrapper setBackgroundColor:[UIColor whiteColor]];

    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, self.wrapper.frame.size.width, pickerHeight)];
    [picker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.wrapper addSubview:picker];

    // Cancel button
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:
                              CGRectMake(0,
                                         self.wrapper.frame.size.height - 44,
                                         self.wrapper.frame.size.width,
                                         44)];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [cancelButton addTarget:self action:@selector(closePicker) forControlEvents:UIControlEventTouchUpInside];
    [self.wrapper addSubview:cancelButton];

    // Show with animation. Add to window (not self.view)
    [self.overlay setAlpha:0];
    [self.view.window addSubview:self.overlay];
    [self.view.window addSubview:self.wrapper];
    [UIView animateWithDuration:0.2 animations:^{
        [self.overlay setAlpha:1];
        CGRect frame = self.wrapper.frame;
        frame.origin.y = frame.origin.y - frame.size.height;
        self.wrapper.frame = frame;
    }];
}

- (void)closePicker
{
    [UIView animateWithDuration:0.2 animations:^{
        [self.overlay setAlpha:0];
        CGRect frame = self.wrapper.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.wrapper.frame = frame;
    } completion:^(BOOL finished) {
        [self.overlay removeFromSuperview];
        [self.wrapper removeFromSuperview];
    }];
}

- (void)datePickerValueChanged:(id)sender
{
    UIDatePicker *picker = (UIDatePicker *) sender;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy/MM/dd";
    self.label.text = [formatter stringFromDate:picker.date];
    [self closePicker];
}

@end
