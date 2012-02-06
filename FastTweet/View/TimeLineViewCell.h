//
//  TimeLineViewCell.h
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineViewCell : UITableViewCell {
	UILabel *userNameLabel;
	UILabel *timeLabel;
	UIImageView *thumbImageView;
	UILabel *tweetLabel;
}

@property (nonatomic, retain) UILabel *userNameLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UIImageView *thumbImageView;
@property (nonatomic, retain) UILabel *tweetLabel;

@end
