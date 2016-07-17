//
//  DetailViewController.h
//  BlogReaderApp
//
//  Created by James Rochabrun on 17-07-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlogPost;

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property BlogPost *blogPost;

@end
