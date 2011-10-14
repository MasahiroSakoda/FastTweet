//
//  RootViewController.h
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TwitterHanlder.h"
#import "NetworkUtil.h"
#import "JSONKit.h"
#import "TimeLine.h"
#import "TimeLineViewCell.h"
#import "TweetViewController.h"

@interface RootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, TwitterHandlerDelegate> {
	NSMutableArray *timeLineArray;
}

@property (nonatomic, retain) UITableView *tableView;

@end
