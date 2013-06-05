//
//  MyTableViewController.m
//  DemoInterfaceBuilder
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyCustomCell.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCustomCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"PushSegue"])
	{
		MyCustomCell *cell = sender;
		UIViewController *destination = segue.destinationViewController;
		NSInteger index = [self.tableView indexPathForCell:cell].row;
		
		destination.title = [NSString stringWithFormat:@"Stepper value %.f", cell.stepper.value];
		
		if (index % 2 == 0)
			destination.view.backgroundColor = [UIColor redColor];
	}
}

@end




















