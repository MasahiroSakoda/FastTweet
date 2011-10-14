//
//  TweetViewController.h
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterHanlder.h"

@interface TweetViewController : UIViewController <TwitterHandlerDelegate> {
}

@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@end
