//
//  TweetsTableViewController.m
//  TweetBotAnimation
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "TweetsTableViewController.h"
#import "TweetTableViewCell.h"

static NSString * TweetCellIdentifier = @"TweetCell";

@interface TweetsTableViewController ()

@property (nonatomic, assign) NSInteger selectedRowIndex;

@end

@implementation TweetsTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	
	if (self)
	{
		self.title = @"Tweets";
		self.selectedRowIndex = NSNotFound;
	}
	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self.tableView registerNib:TweetTableViewCell.nib forCellReuseIdentifier:TweetCellIdentifier];
	
	self.tableView.separatorInset = UIEdgeInsetsZero;
	self.tableView.layoutMargins = UIEdgeInsetsZero;
	self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:1];
	[self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TweetCellIdentifier
															forIndexPath:indexPath];
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView beginUpdates];
	
	if (indexPath.row != self.selectedRowIndex)
	{
		self.selectedRowIndex = indexPath.row;
	}
	else
	{
		[tableView deselectRowAtIndexPath:indexPath animated:YES];
		self.selectedRowIndex = NSNotFound;
	}
	
	[tableView endUpdates];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [TweetTableViewCell heightOpened:indexPath.row == self.selectedRowIndex];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	tableView.layoutMargins = UIEdgeInsetsZero;
}

@end

























