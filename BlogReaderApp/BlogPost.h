//
//  BlogPost.h
//  BlogReaderApp
//
//  Created by James Rochabrun on 16-07-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSURL *url;




//designated initializer
- (instancetype)initWithtitle:(NSString*)title author:(NSString*)author thumbnail:(NSString*)thumbnail date:(NSString*)date url:(NSURL*)url;

//convenience constructor
//+ (id)blogPostWithTitleAndAuthor:(NSString*)title author:(NSString*)author;

//properties attributes

// atomic ..if we dont specify anything by default it will be athomic
   //meant for a multi-threaded enviroment

//nonatomic if its not a multithreaded enviroment, "we should always specify nonatomic

//strong , is when there is a Parent - > child relationship
//weak , is when  there is  as Child -> Parent relationship


//instance methods or helpers
- (NSURL*)thumbnailURL;
- (NSString*)formatedDate;


@end
