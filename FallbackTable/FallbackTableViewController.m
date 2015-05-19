//
//  FallbackTableViewController.m
//  FallbackTable
//
//  Created by Phillip Harris on 5/19/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import "FallbackTableViewController.h"

@interface FallbackTableViewController ()

@end

@implementation FallbackTableViewController

- (FallbackView *)fallbackView {
    if (_fallbackView) {
        return _fallbackView;
    }
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"FallbackView" owner:self options:nil];
    _fallbackView = [nibContents firstObject];
    _fallbackView.backgroundColor = [UIColor clearColor];
    return _fallbackView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self checkForEmptyDataSet];
}

- (void)checkForEmptyDataSet {
    
    if ([self tableIsEmpty]) {
        [self configureFallbackView];
        self.tableView.backgroundView = self.fallbackView;
    }
    else {
        self.tableView.backgroundView = nil;
    }
}

- (BOOL)tableIsEmpty {
    
    UITableView *tableView = self.tableView;
    id <UITableViewDataSource> dataSource = tableView.dataSource;
    
    NSInteger items = 0;
    NSInteger sections = [dataSource numberOfSectionsInTableView:tableView];
    for (NSInteger i = 0; i < sections; i++) {
        items += [dataSource tableView:tableView numberOfRowsInSection:i];
    }
    
    return (items == 0);
}

- (void)configureFallbackView {
    NSLog(@"Subclass should implement configureFallbackView:");
}

@end
