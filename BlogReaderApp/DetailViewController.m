//
//  DetailViewController.m
//  BlogReaderApp
//
//  Created by James Rochabrun on 17-07-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "DetailViewController.h"
#import "BlogPost.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSURLRequest *request = [NSURLRequest requestWithURL:self.blogPost.url];
    
    dispatch_async(dispatch_get_main_queue(), ^(void){

    [self.webView loadRequest:request];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
