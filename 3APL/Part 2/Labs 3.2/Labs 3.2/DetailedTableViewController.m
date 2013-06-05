//
//  DetailedTableViewController.m
//  Labs 3.2
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "DetailedTableViewController.h"
#import "SliderCell.h"
#import "FooItem.h"

@interface DetailedTableViewController ()
@end


@implementation DetailedTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
	{
        self.title = @"Details";
    }
	
    return self;
}


- (void)setItem:(FooItem *)item
{
	if (item != _item)
	{
		_item = item;
		[self.tableView reloadData];
	}
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Details";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
	static NSString *ButtonCellIdentifier = @"Button Cell";
	static NSString *SliderCellIdentifier = @"Slider Cell";
	
	NSString *identifier = CellIdentifier;
	if (indexPath.row == 1)
		identifier = ButtonCellIdentifier;
	else if (indexPath.row == 2)
		identifier = SliderCellIdentifier;
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
	if (!cell)
	{
		switch (indexPath.row) {
			case 0:
			{
				cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
				cell.textLabel.text = self.item.title;
				break;
			}
				
			case 1:
			{
				cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
				cell.textLabel.text = @"Button Cell";
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
				
				UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
				button.frame = CGRectMake(0, 0, 100, 34);
				[button setTitle:@"Press me" forState:UIControlStateNormal];
				cell.accessoryView = button;
				break;
			}
				
			default:
			{
				SliderCell *sliderCell = [[SliderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
				sliderCell.textLabel.text = @"Item value";
				sliderCell.value = self.item.value;
				
				__block FooItem * __weak item = self.item;
				[sliderCell setOnSliderValueChanged:^(float value) {
					item.value = value;
				}];
				
				cell = sliderCell;
				break;
			}
		}
	}
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 2)
		return [SliderCell optimizedHeight];
	
	return 58;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 2)
	{
		SliderCell *cell = (SliderCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
		cell.value += 0.2;
	}
}

@end
