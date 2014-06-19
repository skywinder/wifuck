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
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [super tableView:tableView numberOfRowsInSection:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
