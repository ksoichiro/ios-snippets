//
//  SNAppListViewController.m
//  Snippet
//
//  Copyright (c) 2014 Soichiro Kashima. All rights reserved.
//

#import "SNAppListViewController.h"

@interface SNAppListViewController ()

@end

@implementation SNAppListViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell = [self tableView:tableView cellWithIdentifier:@"CellJSON"];
            [cell.textLabel setText:@"JSON Export"];
        } else if (indexPath.row == 1) {
            cell = [self tableView:tableView cellWithIdentifier:@"CellWebView"];
            [cell.textLabel setText:@"UIWebView"];
        } else if (indexPath.row == 2) {
            cell = [self tableView:tableView cellWithIdentifier:@"CellPicker"];
            [cell.textLabel setText:@"Picker"];
        }
    }
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
            cellWithIdentifier:(NSString *)cellIdentifier
{
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
