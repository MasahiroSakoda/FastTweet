//
//  TimeLine.m
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "TimeLine.h"

@implementation TimeLine

@synthesize userName, thumbImage, tweetText, created;

- (id)init {
	self = [super init];
	if (self) {
		
	}
	return self;
}

- (id)initWithTweetDictionary:(NSDictionary *)tweetDict {
	self = [super init];
	if (self) {
		userName	= [tweetDict objectForKey:@"screen_name"];
		NSData *thumbData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[tweetDict objectForKey:@"profile_image_url_https"]]];
		thumbImage	= [UIImage imageWithData:thumbData];
		tweetText	= [tweetDict objectForKey:@"text"];
		created		= [tweetDict objectForKey:@""];
		NSLog(@"%@", userName);
	
	}
	return self;
}

- (void)dealloc {
	[userName		release];
	[thumbImage		release];
	[tweetText		release];
	[created		release];
	[super dealloc];
}

@end
