//
//  TweetDetailViewController.h
//  FastTweet
//
//  Created by 迫田 雅弘 on 11/10/20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetDetailView.h"
#import "AppDelegate.h"
#import "TimeLine.h"

@interface TweetDetailViewController : UIViewController <TweetDetailViewDelegate> {
}

@property (nonatomic, retain) TimeLine *timeLine;
@property (nonatomic, retain) TweetDetailView *tweetDetailView;

@end
