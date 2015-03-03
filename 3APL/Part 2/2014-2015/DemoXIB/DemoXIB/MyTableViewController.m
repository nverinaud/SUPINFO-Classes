//
//  MyTableViewController.m
//  DemoXIB
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"

static NSString * CellIdentifier = @"Cell ID";

@interface MyTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UINib *myCellNib = [UINib nibWithNibName:NSStringFromClass(MyTableViewCell.class) bundle:nil];
	
	[self.tableView registerNib:myCellNib
		 forCellReuseIdentifier:CellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	cell.titleLabel.text = @"Hello";
	cell.subtitleLabel.text = @"World !";
	cell.chapoLabel.text = [indexPath description];
	
	return cell;
}

@end






















