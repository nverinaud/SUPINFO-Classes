//
//  DemoViewController.m
//  Labs 4.1.4.2
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "DemoViewController.h"
#import "SuperCell.h"

@interface DemoViewController ()
@end

@implementation DemoViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString * const MySuperCellIdentifier = @"MySuperCell";
	
	SuperCell *cell = [tableView dequeueReusableCellWithIdentifier:MySuperCellIdentifier forIndexPath:indexPath];
	cell.superLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
	
	return cell;
}

@end
