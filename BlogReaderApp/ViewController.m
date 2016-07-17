//
//  ViewController.m
//  BlogReaderApp
//
//  Created by James Rochabrun on 16-07-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "BlogPost.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


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
        NSString *thumbnail = [blogDict objectForKey:@"thumbnail"];
        NSString *date = [blogDict objectForKey:@"date"];
        NSURL *url = [NSURL URLWithString:[blogDict objectForKey:@"url"]];
        BlogPost *blogPost = [[BlogPost alloc] initWithtitle:title author:author thumbnail:thumbnail date:date
                                                         url:url];
        [self.blogPosts addObject:blogPost];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    
        if ([blogPost.thumbnail isKindOfClass:[NSString class]]) {
            NSURL *url = [blogPost thumbnailURL];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:imageData];
            cell.imageView.image = image;
        }
        
        cell.textLabel.text = blogPost.title;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ on %@", blogPost.author, [blogPost formatedDate]];
    //checking for null values handling errors

    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.blogPosts.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"show"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        DetailViewController *detailVC = (DetailViewController*)segue.destinationViewController;
        detailVC.blogPost = blogPost;
    }
}

#pragma this is an example of this method and a comparisson to prepareforsegue
//uisng this method just to perform something , prepareforsegue is when we want to pass data in other hand
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   // BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    //then we can call the sharedinstance of the UIAplication
   // UIApplication *app = [UIApplication sharedApplication];
    //[app openURL:blogPost.url];
//}


@end








