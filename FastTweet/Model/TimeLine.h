//
//  TimeLine.h
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeLine : NSObject {
	NSString	*userName;
	UIImage		*thumbImage;
	NSString	*tweetText;
	NSString	*created;
}

@property (nonatomic, retain) NSString	*userName;
@property (nonatomic, retain) UIImage	*thumbImage;
@property (nonatomic, retain) NSString	*tweetText;
@property (nonatomic, retain) NSString	*created;

- (id)initWithTweetDictionary:(NSDictionary *)tweetDict;

@end
