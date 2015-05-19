//
//  MyTableViewController.m
//  FallbackTableExample
//
//  Created by Phillip Harris on 5/19/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataset;

@end

@implementation MyTableViewController

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _dataset = [NSMutableArray array];
}

//===============================================
#pragma mark -
#pragma mark View Methods
//===============================================

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *trashButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trash)];
    self.navigationItem.rightBarButtonItem = trashButton;
}

//===============================================
#pragma mark -
#pragma mark Refresh
//===============================================

- (void)trash {
    
    [self.dataset removeAllObjects];
    
    [self.tableView reloadData];
    [self checkForEmptyDataSet];
}

//===============================================
#pragma mark -
#pragma mark UITableView
//===============================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataset.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    NSString *string = self.dataset[indexPath.row];
    cell.textLabel.text = string;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//===============================================
#pragma mark -
#pragma mark Fallback
//===============================================

- (void)configureFallbackView {
    
    self.fallbackView.titleLabel.text = @"No Data";
    self.fallbackView.detailLabel.text = @"You don't have any data yet.";
    self.fallbackView.imageView.backgroundColor = [UIColor darkGrayColor];
    [self.fallbackView.button setTitle:@"Reload" forState:UIControlStateNormal];
    [self.fallbackView.button addTarget:self action:@selector(fallbackButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (void)fallbackButtonTapped {
    
    if (self.dataset.count == 0) {
        
        [self.dataset addObject:@"One"];
        [self.dataset addObject:@"Two"];
        [self.dataset addObject:@"Three"];
        
        [self.tableView reloadData];
        [self checkForEmptyDataSet];
    }
}

@end
