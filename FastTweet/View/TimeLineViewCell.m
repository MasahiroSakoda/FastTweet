//
//  TimeLineViewCell.m
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "TimeLineViewCell.h"

@implementation TimeLineViewCell

@synthesize userNameLabel, timeLabel, thumbImageView, tweetLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
		thumbImageView.backgroundColor = [UIColor clearColor];
		// thumbImageView.backgroundColor = [UIColor yellowColor];
		thumbImageView.contentMode = UIViewContentModeScaleAspectFit;
		[self addSubview:thumbImageView];
		[thumbImageView release];
		
		userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 160, 20)];
		userNameLabel.backgroundColor = [UIColor clearColor];
		// userNameLabel.backgroundColor = [UIColor orangeColor];
		userNameLabel.numberOfLines = 1;
		userNameLabel.font = [UIFont boldSystemFontOfSize:10];
		userNameLabel.minimumFontSize = 5;
		[self addSubview:userNameLabel];
		[userNameLabel release];
		
		timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(215, 5, 100, 20)];
		timeLabel.backgroundColor = [UIColor clearColor];
		// timeLabel.backgroundColor = [UIColor purpleColor];
		timeLabel.numberOfLines = 1;
		timeLabel.font = [UIFont systemFontOfSize:9];
		timeLabel.minimumFontSize = 5;
		[self addSubview:timeLabel];
		[timeLabel release];
		
		tweetLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, userNameLabel.frame.origin.y + userNameLabel.frame.size.height + 5, 250, 70)];
		tweetLabel.backgroundColor = [UIColor clearColor];
		// tweetLabel.backgroundColor = [UIColor blueColor];
		tweetLabel.numberOfLines = 0;
		tweetLabel.font = [UIFont systemFontOfSize:12];
		tweetLabel.minimumFontSize = 6;
		[self addSubview:tweetLabel];
		[tweetLabel release];
	}
	return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

@end
