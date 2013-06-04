//
//  ViewController.m
//  Labs 1.4
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *startLabel;
@property (nonatomic, strong) UILabel *endLabel;
@property (nonatomic, strong) UILabel *durationLabel;
@property (nonatomic, strong) UIButton *actionButton;

@property (nonatomic, readonly) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) NSDate *beginDate;
@property (nonatomic, strong) NSDate *endDate;

- (void)buttonPressed:(UIButton *)sender;

@end


@implementation ViewController

@synthesize dateFormatter = _dateFormatter; // Obligatoire car une propriété readonly n'est pas synthesize automatiquement avec une variable d'instance créée par le compilateur, essaye de commenter cette ligne pour voir les erreurs de compilation ;-)

#pragma mark - Memory Management

- (void)dealloc
{
	[super dealloc];
}


- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}


#pragma mark - View lifecycle

- (void)viewDidUnload
{
	[super viewDidUnload];
	
	self.timeLabel = nil;
	self.startLabel = nil;
	self.endLabel = nil;
	self.durationLabel = nil;
	self.actionButton = nil;
}


- (void)loadView
{
	self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	self.view.backgroundColor = [UIColor lightGrayColor];
	
	[self.view addSubview:self.timeLabel];
	[self.view addSubview:self.startLabel];
	[self.view addSubview:self.endLabel];
	[self.view addSubview:self.durationLabel];
	[self.view addSubview:self.actionButton];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Initial state
	self.beginDate = nil; // Cache aussi le label de début
	self.endDate = nil; // Cache aussi le label de fin
	self.durationLabel.hidden = YES;
}


- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateClock:) userInfo:nil repeats:YES];
	[[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


#pragma mark - Lazy views

#define MARGIN_LEFT 20
#define BIG_LABEL_HEIGHT 150
#define SMALL_LABEL_HEIGHT 60
#define BUTTON_WIDTH 100
#define BUTTON_HEIGHT 44

- (UILabel *)timeLabel
{
	if (!_timeLabel)
	{
		_timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT, 20, CGRectGetWidth(self.view.bounds) - MARGIN_LEFT * 2, BIG_LABEL_HEIGHT)];
		_timeLabel.textAlignment = NSTextAlignmentCenter;
		_timeLabel.font = [UIFont systemFontOfSize:46];
		_timeLabel.text = @"--:--";
	}
	
	return _timeLabel;
}


- (UILabel *)startLabel
{
	if (!_startLabel)
	{
		_startLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT, CGRectGetMaxY(self.timeLabel.frame) + 20, CGRectGetWidth(self.timeLabel.bounds), SMALL_LABEL_HEIGHT)];
		_startLabel.font = [UIFont systemFontOfSize:14];
		_startLabel.text = NSLocalizedString(@"Started at:", nil);
	}
	
	return _startLabel;
}


- (UILabel *)endLabel
{
	if (!_endLabel)
	{
		_endLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT, CGRectGetMaxY(self.startLabel.frame) + 10, CGRectGetWidth(self.timeLabel.bounds), SMALL_LABEL_HEIGHT)];
		_endLabel.font = self.startLabel.font;
		_endLabel.text = NSLocalizedString(@"Ended at:", nil);
	}
	
	return _endLabel;
}


- (UILabel *)durationLabel
{
	if (!_durationLabel)
	{
		_durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT, CGRectGetMaxY(self.endLabel.frame) + 10, CGRectGetWidth(self.timeLabel.bounds), SMALL_LABEL_HEIGHT)];
		_durationLabel.font = self.startLabel.font;
		_durationLabel.text = NSLocalizedString(@"Total duration:", nil);
	}
	
	return _durationLabel;
}


- (UIButton *)actionButton
{
	if (!_actionButton)
	{
		_actionButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
		_actionButton.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - BUTTON_HEIGHT - 10, BUTTON_WIDTH, BUTTON_HEIGHT);
		_actionButton.center = CGPointMake(self.view.center.x, _actionButton.center.y);
		[_actionButton setTitle:NSLocalizedString(@"Start", @"Start chronometer button text") forState:UIControlStateNormal];
		[_actionButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	return _actionButton;
}


#pragma mark - Lazy date formatter

- (NSDateFormatter *)dateFormatter
{
	if (!_dateFormatter)
	{
		_dateFormatter = [[NSDateFormatter alloc] init];
		[_dateFormatter setDateFormat:@"HH:mm"]; // with seconds format: HH:mm:ss
	}
	
	return _dateFormatter;
}


#pragma mark - Clock update

- (void)updateClock:(NSTimer *)timer
{
	self.timeLabel.text = [self.dateFormatter stringFromDate:[NSDate date]];
}


#pragma mark - Button pressed

- (void)buttonPressed:(UIButton *)sender
{
	if ([[sender titleForState:UIControlStateNormal] isEqualToString:NSLocalizedString(@"Start", @"Start chronometer button text")])
	{
		self.beginDate = [NSDate date];
		[sender setTitle:NSLocalizedString(@"Stop", @"Stop chronometer button text") forState:UIControlStateNormal];
	}
	else if ([[sender titleForState:UIControlStateNormal] isEqualToString:NSLocalizedString(@"Stop", @"Stop chronometer button text")])
	{
		self.endDate = [NSDate date];
		[sender setTitle:NSLocalizedString(@"Reset", @"Reset chronometer button text") forState:UIControlStateNormal];
		
		NSTimeInterval duration = [self.endDate timeIntervalSinceDate:self.beginDate];
		self.durationLabel.text = [NSLocalizedString(@"Total duration:", nil) stringByAppendingFormat:@" %.2f seconds.", duration];
		self.durationLabel.hidden = NO;
	}
	else
	{
		self.beginDate = nil;
		self.endDate = nil;
		self.durationLabel.hidden = YES;
		[sender setTitle:NSLocalizedString(@"Start", @"Start chronometer button text") forState:UIControlStateNormal];
	}
}


#pragma mark - Date updates

- (void)setBeginDate:(NSDate *)beginDate
{
	if (beginDate != _beginDate)
	{
		[_beginDate release];
		_beginDate = [beginDate retain];
	}
	
	if (_beginDate)
		self.startLabel.text = [NSLocalizedString(@"Started at:", nil) stringByAppendingFormat:@" %@", [self.dateFormatter stringFromDate:_beginDate]];
	
	self.startLabel.hidden = (_beginDate == nil);
}


- (void)setEndDate:(NSDate *)endDate
{
	if (endDate != _endDate)
	{
		[_endDate release];
		_endDate = [endDate retain];
	}
	
	if (_endDate)
		self.endLabel.text = [NSLocalizedString(@"Ended at:", nil) stringByAppendingFormat:@" %@", [self.dateFormatter stringFromDate:_endDate]];
	
	self.endLabel.hidden = (_endDate == nil);
}

@end
