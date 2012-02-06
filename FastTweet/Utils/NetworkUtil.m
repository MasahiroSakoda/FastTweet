//
//  NetworkUtil.m
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "NetworkUtil.h"

@implementation NetworkUtil

+ (BOOL)isConnectToNetwork {
	struct sockaddr_in zeroAddress;
	bzero(&zeroAddress, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;
	
	// network status check
	SCNetworkReachabilityRef defRootReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
	SCNetworkReachabilityFlags flags;
	BOOL didRetriveFlag = SCNetworkReachabilityGetFlags(defRootReachability, &flags);
	CFRelease(defRootReachability);
	
	if (!didRetriveFlag) {
		return NO;
	}
	BOOL isReachable = flags & kSCNetworkFlagsReachable;
	BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
	return (isReachable && !needsConnection) ? YES : NO;
}

@end
