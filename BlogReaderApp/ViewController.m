//
//  ViewController.m
//  BlogReaderApp
//
//  Created by James Rochabrun on 16-07-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "BlogPost.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *blogUrl = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary"];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogUrl];
    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error: &error];
    
    self.blogPosts = [NSMutableArray new];
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *blogDict in blogPostsArray) {
        NSString *title = [blogDict objectForKey:@"title"];
        NSString *author = [blogDict objectForKey:@"author"];
        BlogPost *blogPost = [BlogPost blogPostWithTitleAndAuthor:title author:author];
        blogPost.thumbnail = [blogDict objectForKey:@"thumbnail"];
        blogPost.date = [blogDict objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[blogDict objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    //checking for null values handling errors
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]) {
        NSURL *url = [blogPost thumbnailURL];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    }
    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ on %@", blogPost.author, [blogPost formatedDate]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.blogPosts.count;
}


//uisng this method just to perform something , prepareforsegue is when we want to pass data in other hand
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    //then we can call the sharedinstance of the UIAplication
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:blogPost.url];

    
}


@end








