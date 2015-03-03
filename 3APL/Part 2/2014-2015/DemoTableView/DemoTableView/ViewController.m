//
//  ViewController.m
//  DemoTableView
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

static NSString * CellIdentifier = @"ID";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSArray *rows;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.tableView = [[UITableView alloc] initWithFrame:frame
												  style:UITableViewStylePlain];
	
	[self.tableView registerClass:MyTableViewCell.class forCellReuseIdentifier:CellIdentifier];
	
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	
	[self createData];
	
	[self.view addSubview:self.tableView];
}

- (void)createData
{
	NSMutableArray *sections = [NSMutableArray arrayWithCapacity:10];
	for (int i = 0; i < 10; i++)
	{
		[sections addObject:@(i)];
	}
	self.sections = sections;
	
	NSMutableArray *rows = [NSMutableArray arrayWithCapacity:15];
	for (int i = 0; i < 15; i++)
	{
		[rows addObject:@(i)];
	}
	self.rows = rows;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[self.tableView setEditing:YES animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return self.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	NSNumber *sectionNumber = self.sections[indexPath.section];
	NSNumber *rowNumber = self.rows[indexPath.row];
	
	cell.titleLabel.text = [NSString stringWithFormat:@"%@ - %@", sectionNumber, rowNumber];
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
	NSNumber *sectionNumber = self.sections[section];
	return [NSString stringWithFormat:@"S %@", sectionNumber];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return indexPath.section * 10 + indexPath.row * 10 + 44;
}

@end



























