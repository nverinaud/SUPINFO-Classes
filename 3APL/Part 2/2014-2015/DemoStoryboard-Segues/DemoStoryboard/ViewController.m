//
//  ViewController.m
//  DemoStoryboard
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

static NSString * CellClickedSegueIdentifier = @"cellClickedSegue";

static NSString * PresentModalSegueIdentifier = @"presentModalVC";

@interface ViewController ()
- (IBAction)longPressRecognized:(id)sender;

@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell ID" forIndexPath:indexPath];
	
	UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
	UILabel *subtitleLabel = (UILabel *)[cell viewWithTag:2];
	UILabel *chapoLabel = (UILabel *)[cell viewWithTag:3];
	
	titleLabel.text = @"Hello";
	subtitleLabel.text = @"World !";
	chapoLabel.text = [indexPath description];
	
	return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:CellClickedSegueIdentifier])
	{
		UIViewController *destination = [segue destinationViewController];
		UILabel *coucouLabel = (UILabel *)[destination.view viewWithTag:1];
		NSIndexPath *clickedRow = [self.tableView indexPathForSelectedRow];
		coucouLabel.text = [NSString stringWithFormat:@"%d - %d", clickedRow.section, clickedRow.row];
	}
}

- (IBAction)longPressRecognized:(id)sender
{
	[self performSegueWithIdentifier:PresentModalSegueIdentifier sender:sender];
}

@end















