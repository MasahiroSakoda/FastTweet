//
//  NetworkUtil.h
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
#import <netdb.h>
#import <arpa/inet.h>

@interface NetworkUtil : NSObject {
	
}

+ (BOOL)isConnectToNetwork;

@end
