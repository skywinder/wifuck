//
//  NetworkChooserTableViewController.m
//  WiFuck
//
//  Created by Petr Korolev on 19/06/14.
//  Copyright (c) 2014 Maxim Grati. All rights reserved.
//

#import "NetworkChooserTableViewController.h"
#import "ViewController.h"

@implementation NetworkChooserTableViewController {
    UIAlertView *_alert;
}

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
    cell.textLabel.text = self.resultArray[(NSUInteger) indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self.delegate networkSelected:[NSString stringWithFormat:@"net %d", indexPath.row]];
//    [self.navigationController popViewControllerAnimated:YES];
    NSString *str = self.resultArray[(NSUInteger) indexPath.row];
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    [pb setString:str];
    //this is in another method
    _alert = [[UIAlertView alloc] initWithTitle:nil message:@"Password copied to clipboard." delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [_alert show];
    [self timedAlert];
}
    -(void)timedAlert
    {
        [self performSelector:@selector(dismissAlert:) withObject:_alert afterDelay:1];
    }

    -(void)dismissAlert:(UIAlertView *) alertView
    {
        [alertView dismissWithClickedButtonIndex:nil animated:YES];
    }

@end
