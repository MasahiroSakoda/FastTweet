//
//  RootViewController.m
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController()
- (void)refreshTimeLine;
@end

@implementation RootViewController

@synthesize tableView = _tableView;

- (void)dealloc {
	[timeLineArray release];
	[super dealloc];
}

#pragma mark --UIViewController life cycle--
- (void)viewDidLoad {
	[super viewDidLoad];
	
	_tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height) style:UITableViewStylePlain];
	_tableView.dataSource	= self;
	_tableView.delegate		= self;
	[self.view addSubview:_tableView];
	[_tableView release];
	
	self.navigationItem.title = @"aa";
	
	UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(tapRefresh)];
	self.navigationItem.leftBarButtonItem = refreshButton;
	[refreshButton release];
	
	UIBarButtonItem *tweetButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(tapTweet)];
	self.navigationItem.rightBarButtonItem = tweetButton;
	[tweetButton release];
	timeLineArray = [[NSMutableArray alloc] initWithCapacity:0];;
	
	// navigation CustomView
	UIView *navigationView = [[UIView alloc] initWithFrame:CGRectMake(self.navigationItem.titleView.frame.origin.x, self.navigationItem.titleView.frame.origin.y, 200, 44)];
	navigationView.backgroundColor = [UIColor blueColor];
	
	UILabel *naviLabel = [[UILabel alloc] initWithFrame:navigationView.frame];
	naviLabel.numberOfLines = 0;
	naviLabel.font = [UIFont boldSystemFontOfSize:14];
	naviLabel.minimumFontSize = 10;
	naviLabel.text = @"aaaaaaaa";
	naviLabel.textAlignment = UITextAlignmentCenter;
	[navigationView addSubview:naviLabel];
	[naviLabel release];

	UIButton *naviButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[naviButton addTarget:self action:@selector(tapNaviBtn:) forControlEvents:UIControlEventTouchUpInside];
	naviButton.backgroundColor = [UIColor clearColor];
	[navigationView addSubview:naviButton];
	
	self.navigationItem.titleView = navigationView;
	[navigationView release];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

#pragma mark --UITableViewDataSource protocol method--
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// return 10;
	return [timeLineArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    TimeLineViewCell *cell = (TimeLineViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[TimeLineViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	TimeLine *tl = [timeLineArray objectAtIndex:indexPath.row];
	// cell.textLabel.text = tl.tweetText;
	
	cell.userNameLabel.text = tl.userName;
	cell.tweetLabel.text	= tl.tweetText;
	cell.timeLabel.text		= tl.created;
	cell.thumbImageView.image = tl.thumbImage;
    return cell;
}

#pragma mark --UITableViewDelegate protocol method--
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	TweetDetailViewController *tweetDetailViewCtrl = [[TweetDetailViewController alloc] initWithNibName:@"TweetDetailViewController" bundle:nil];
	TimeLine *tl = [timeLineArray objectAtIndex:indexPath.row];
	tweetDetailViewCtrl.timeLine = tl;
	[self.navigationController pushViewController:tweetDetailViewCtrl animated:YES];
	[tweetDetailViewCtrl release];
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
}

#pragma mark --RootViewController private method--
- (void)tapRefresh {
	UIAlertView *_alertView = nil;
	switch ([TwitterHanlder confirmTweetStatus]) {
		case TwitterStatusActivated:
			[self refreshTimeLine];
			break;
		case TwitterStatusNetworkDisconnected:
			_alertView = [[UIAlertView alloc] initWithTitle:@"network error" message:@"your device is not connect to network" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[_alertView show];
			[_alertView release];
			break;
		case TwitterStatusAccountNotVerified:
			_alertView = [[UIAlertView alloc] initWithTitle:@"account error" message:@"set account with setting application" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[_alertView show];
			[_alertView release];
			break;
		case TwitterStatusUnknown:
			break;
		default:
			break;
	}
	
}

- (void)tapTweet {
	TweetViewController *tweetViewController =[[TweetViewController alloc] initWithNibName:@"TweetViewController" bundle:nil];
	tweetViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController:tweetViewController animated:YES];
	[tweetViewController release];
}

- (void)refreshTimeLine {
	TwitterHanlder *twitterHandler = [[TwitterHanlder alloc] init];
	// [twitterHandler getPublicTimeLine];
	// [twitterHandler getUserTimeLine];
	[twitterHandler getHomeTimeLine];
	twitterHandler.delegate = self;
	[twitterHandler release];
}

#pragma mark --RootViewController public method--

#pragma mark --TwitterHandlerDelegate protocol method--
- (void)didFinishGettingTimeLine:(NSData *)timeLineData {
	JSONDecoder *jsonDecoder = [[JSONDecoder alloc] initWithParseOptions:JKParseOptionLooseUnicode];
	id timeLineComponent = [jsonDecoder objectWithData:timeLineData];
	[jsonDecoder release];
	for (NSDictionary *timeLineDict in timeLineComponent) {
		NSLog(@"%@", [timeLineDict description]);
		// NSLog(@"%@", [timeLineDict objectForKey:@"profile_image_url"]);
		TimeLine *timeLine	= [[TimeLine alloc] init];
		timeLine.tweetText	= [timeLineDict objectForKey:@"text"];
		
		NSDictionary *metaDataDict = [timeLineDict objectForKey:@"user"];
		
		timeLine.userName	= [metaDataDict objectForKey:@"screen_name"];
		NSData *thumbImgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[metaDataDict objectForKey:@"profile_image_url"]]];
		if (thumbImgData != nil) {
			timeLine.thumbImage	= [UIImage imageWithData:thumbImgData];
		}
		timeLine.created	= [metaDataDict objectForKey:@"created_at"];
		[timeLineArray addObject:timeLine];
		[timeLine release];
	}
	[_tableView reloadData];
}

@end
