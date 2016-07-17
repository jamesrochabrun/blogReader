//
//  BlogPost.m
//  BlogReaderApp
//
//  Created by James Rochabrun on 16-07-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost



- (instancetype)initWithtitle:(NSString*)title author:(NSString*)author {
    
    self = [super init];
    if (self) {
        self.title = title;
        self.author = author;
        self.thumbnail = nil;
        self.date = nil;
        self.url = nil;
    }
    return self;
}

+ (id)blogPostWithTitleAndAuthor:(NSString*)title author:(NSString*)author {
    return [[self alloc] initWithtitle:title author:author];
}

//instance method to create a url
- (NSURL*)thumbnailURL {
    return  [NSURL URLWithString:self.thumbnail];
}

- (NSString*)formatedDate {
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormater dateFromString:self.date];
    [dateFormater setDateFormat:@"EE MMM,dd"];
    return [dateFormater stringFromDate:tempDate];
}




@end
