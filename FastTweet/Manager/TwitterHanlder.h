//
//  TwitterHanlder.h
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

typedef enum {
	TwitterStatusNetworkDisconnected,
	TwitterStatusAccountNotVerified,
	TwitterStatusActivated,
	TwitterStatusUnknown
} TwitterStatus;

@interface TwitterHanlder : NSObject {
	NSMutableDictionary *publicTimeLine;
}

@property (nonatomic, retain) id delegate;

+ (TwitterStatus)confirmTweetStatus;
- (NSMutableDictionary *)getUserTimeLine;
- (NSMutableDictionary *)getHomeTimeLine;
- (NSMutableDictionary *)getPublicTimeLine;
- (void)sendTweet:(NSDictionary *)paramDict;

@end

@protocol TwitterHandlerDelegate <NSObject>
@optional
- (void)didFinishTweetingWithStatusCode:(NSInteger)statusCode;
- (void)didFinishGettingTimeLine:(NSData *)timeLineData;
@end
