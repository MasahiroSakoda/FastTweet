//
//  TweetDetailViewController.m
//  FastTweet
//
//  Created by 迫田 雅弘 on 11/10/20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "TweetDetailViewController.h"

@interface TweetDetailViewController()
- (NSString *)htmlSourceWithTweetText:(NSString *)tweetText;
@end

@implementation TweetDetailViewController

@synthesize tweetDetailView = _tweetDetailView;
@synthesize timeLine;

- (void)dealloc {
	[_tweetDetailView release];
	[super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
	}
	return self;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	_tweetDetailView = [[TweetDetailView alloc] initWithFrame:self.view.frame];
	_tweetDetailView.delegate = self;
	[self.view addSubview:_tweetDetailView];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	NSError *error;
	NSString *htmlSource = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TweetDetail" ofType:@"html"] encoding:NSUTF8StringEncoding error:&error];
	NSString *convertedTweetText = [self htmlSourceWithTweetText:timeLine.tweetText];
	
	
	htmlSource = [NSString stringWithFormat:htmlSource, convertedTweetText];
	// [self.tweetDetailView loadTweetDetail:htmlSource];
	[self.tweetDetailView.webView loadHTMLString:htmlSource baseURL:nil];
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
- (void)viewDidUnload {
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark --TweetDetailViewDelegate protocol method--
- (void)didStartLoadingTweetDetail {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didFinishLoadingTweetDetail {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)didFailLoadingTweetDetailWithError:(NSError *)error {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

#pragma mark --TweetDetailViewController private method--
- (NSString *)htmlSourceWithTweetText:(NSString *)tweetText {
	return nil;
}

@end
