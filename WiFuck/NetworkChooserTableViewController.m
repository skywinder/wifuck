//
//  NetworkChooserTableViewController.m
//  WiFuck
//
//  Created by Petr Korolev on 19/06/14.
//  Copyright (c) 2014 Maxim Grati. All rights reserved.
//

#import "NetworkChooserTableViewController.h"
#import "ViewController.h"

@implementation NetworkChooserTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad
{

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Str %d", indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate networkSelected:[NSString stringWithFormat:@"net %d", indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
