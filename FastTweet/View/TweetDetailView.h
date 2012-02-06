//
//  TweetDetailView.h
//  FastTweet
//
//  Created by 迫田 雅弘 on 11/10/20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeLine.h"

@interface TweetDetailView : UIView <UIWebViewDelegate> {
	UIImageView *accountImgView;
	UILabel *accountLabel;
	UILabel *createdDateLabel;
}

@property (nonatomic, retain) TimeLine *timeLine;
@property (nonatomic, retain) UIImageView *accountImgView;
@property (nonatomic, retain) UILabel *accountLabel;
@property (nonatomic, retain) UILabel *createdDateLabel;
@property (nonatomic, retain) UIWebView	*webView;
@property (nonatomic, retain) id delegate;

- (void)loadTweetDetail:(NSString *)htmlString;

@end

@protocol TweetDetailViewDelegate
- (void)didStartLoadingTweetDetail;
- (void)didFinishLoadingTweetDetail;
- (void)didFailLoadingTweetDetailWithError:(NSError *)error;
@end
