//
//  NetworkChooserTableViewController.h
//  WiFuck
//
//  Created by Petr Korolev on 19/06/14.
//  Copyright (c) 2014 Maxim Grati. All rights reserved.
//



@class ViewController;

@interface NetworkChooserTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) ViewController *delegate;

@end
