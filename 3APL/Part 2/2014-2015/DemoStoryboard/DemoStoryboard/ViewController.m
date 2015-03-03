//
//  ViewController.m
//  DemoStoryboard
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

@end












