//
//  FallbackTableViewController.h
//  FallbackTable
//
//  Created by Phillip Harris on 5/19/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FallbackView.h"

@interface FallbackTableViewController : UITableViewController

@property (nonatomic, strong) FallbackView *fallbackView;

- (void)checkForEmptyDataSet;
- (void)configureFallbackView;

@end
