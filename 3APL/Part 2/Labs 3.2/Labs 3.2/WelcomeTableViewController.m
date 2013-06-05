//
//  WelcomeTableViewController.m
//  Labs 3.2
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "WelcomeTableViewController.h"
#import "DetailedTableViewController.h"
#import "FooItem.h"

@interface WelcomeTableViewController ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) FooItem *selectedItem;

- (void)navigateToDetailsWithItemAtIndex:(NSInteger)index;

@end


@implementation WelcomeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
	{
        self.title = @"Welcome Screen";
		self.items = @[
			[FooItem itemWithTitle:@"Random" value:0.2],
			[FooItem itemWithTitle:@"\xF0\x9F\x98\xB1 Text \xF0\x9F\x98\xB1" value:0.4],
			[FooItem itemWithTitle:@"It's amazing \xF0\x9F\x98\x98" value:0.6],
			[FooItem itemWithTitle:@"I love it \xF0\x9F\x98\x86" value:0.8],
			[FooItem itemWithTitle:@"So fun :)" value:1.0]
		];
    }
	
    return self;
}


#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	if (self.selectedItem)
	{
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.items indexOfObject:self.selectedItem] inSection:0];
		[self.tableView reloadRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationNone];
		self.selectedItem = nil;
	}
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Items";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		cell.detailTextLabel.text = @"Show details";
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}
	
	FooItem *item = self.items[indexPath.row];
	cell.textLabel.text = item.title;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Value: %.2f", item.value];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self navigateToDetailsWithItemAtIndex:indexPath.row];
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	[self navigateToDetailsWithItemAtIndex:indexPath.row];
}


#pragma mark - Navigation

- (void)navigateToDetailsWithItemAtIndex:(NSInteger)index
{
	DetailedTableViewController *detailsTableVC = [[DetailedTableViewController alloc] init];
	self.selectedItem = self.items[index];
	detailsTableVC.item = self.selectedItem;
	[self.navigationController pushViewController:detailsTableVC animated:YES];
}

@end
