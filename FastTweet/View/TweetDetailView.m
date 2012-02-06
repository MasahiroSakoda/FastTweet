//
//  TweetDetailView.m
//  FastTweet
//
//  Created by 迫田 雅弘 on 11/10/20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "TweetDetailView.h"

@implementation TweetDetailView

@synthesize webView		= _webView;
@synthesize accountImgView, accountLabel, createdDateLabel;
@synthesize delegate	= _delegate;
@synthesize timeLine = _timeLine;

- (void)dealloc {
	[super dealloc];
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		accountImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60, 60)];
		accountImgView.backgroundColor = [UIColor lightGrayColor];
		accountImgView.contentMode = UIViewContentModeScaleAspectFit;
		[self addSubview:accountImgView];
		[accountImgView release];
		
		accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 240, 60)];
		accountLabel.backgroundColor = [UIColor greenColor];
		accountLabel.font = [UIFont boldSystemFontOfSize:16];
		accountLabel.minimumFontSize = 12;
		accountLabel.numberOfLines = 1;
		[self addSubview:accountLabel];
		[accountLabel release];
		
		_webView = [[UIWebView alloc] initWithFrame:CGRectMake(5, 80, 310, 320)];
		_webView.backgroundColor = [UIColor purpleColor];
		// _webView = [[UIWebView alloc] initWithFrame:frame];
		_webView.delegate = self;
		[self addSubview:_webView];
		[_webView release];
	}
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	// Drawing code
}
*/

- (void)loadTweetDetail:(NSString *)htmlString {
	[self.webView loadHTMLString:htmlString baseURL:nil];
}

#pragma mark --UIWebViewDelegate protocol method--
- (void)webViewDidStartLoad:(UIWebView *)webView {
	[_delegate didStartLoadingTweetDetail];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[_delegate didFinishLoadingTweetDetail];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[_delegate didFailLoadingTweetDetailWithError:error];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	return YES;
}

@end
