//
//  TweetViewController.m
//  FastTweet
//
//  Created by Masahiro Sakoda on 11/10/13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "TweetViewController.h"

@interface TweetViewController()
- (void)setSendButton;
- (void)setDoneButton;
@end

@implementation TweetViewController

@synthesize navigationBar = _navigationBar;
@synthesize textView = _textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_textView.backgroundColor = [UIColor darkGrayColor];
	_textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	
	UINavigationItem *item = [self.navigationBar.items objectAtIndex:0];
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemCancel target:self action:@selector(tapCancel)];
	item.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(tapSend)];
	item.rightBarButtonItem = sendButton;
	[sendButton release];
	item.rightBarButtonItem.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	//キーボード表示・非表示の通知の開始
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	//キーボード表示・非表示の通知を終了
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark --TweetViewController private method--
- (void)tapSend {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	TwitterHanlder *twitterHandler = [[TwitterHanlder alloc] init];
	twitterHandler.delegate = self;
	[twitterHandler sendTweet:[NSDictionary dictionaryWithObject:self.textView.text forKey:@"status"]];
	[twitterHandler release];
}

- (void)tapDone {
	[self.textView resignFirstResponder];
	if ([self.textView text] != nil || ![[self.textView text] isEqualToString:@""]) {
		UINavigationItem *item = [self.navigationBar.items objectAtIndex:0];
		item.rightBarButtonItem.enabled = YES;
	}
}

- (void)tapCancel {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)setSendButton {
	UINavigationItem *item = [self.navigationBar.items objectAtIndex:0];
	UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(tapSend)];
	item.rightBarButtonItem = sendButton;
	[sendButton release];
}

- (void)setDoneButton {
	UINavigationItem *item = [self.navigationBar.items objectAtIndex:0];
	UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(tapDone)];
	item.rightBarButtonItem = sendButton;
	[sendButton release];
}

#pragma mark --Notification method--
- (void)keyboardWillShow:(NSNotification *)aNotification {
	[self setDoneButton];
	//キーボードのCGRectを取得
    CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
	// NSLog(@"keyboardRect: %f, %f, %f, %f", keyboardRect.origin.x, keyboardRect.origin.y, keyboardRect.size.width, keyboardRect.size.height);
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.5];
	self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.textView.frame.size.width, self.view.frame.size.height - self.navigationBar.frame.size.height - keyboardRect.size.height);
	[UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)aNotification {
	[self setSendButton];
    CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.5];
	self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.textView.frame.size.width, self.view.frame.size.height - self.navigationBar.frame.size.height + keyboardRect.size.height);
	[UIView commitAnimations];
}

#pragma mark --TwitterHandlerDelegate protocol method--
- (void)didFinishTweetingWithStatusCode:(NSInteger)statusCode {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	switch (statusCode) {
		case 200:
			// hide indicator
			break;
		default:
			// show alert
			
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

@end
