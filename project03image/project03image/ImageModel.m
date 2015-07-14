//
//  ImageModel.m
//  project03image
//
//  Created by Kyoungchin Seo on 2015. 7. 5..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "ImageModel.h"
#import "JSONSerializer.h"

@implementation ImageModel

@synthesize imageList;

- (id)initWithPathName:(NSString*)Path
{
    self = [super init];
    
    if (self) {
        NSFileManager * fileManager = [NSFileManager defaultManager];
        
        if ([fileManager fileExistsAtPath:Path]) {
            
            // load content as string from a file
            NSString *content = [NSString stringWithContentsOfFile:Path encoding:NSUTF8StringEncoding error:nil];
            
            NSLog(@"%@",content);
            JSONSerializer *jsonSerializer = [[JSONSerializer alloc]init];
            NSArray *serializedData = [jsonSerializer JSONSerializationFrom:content];
            
            imageList = [[NSArray alloc]initWithArray:serializedData];
        }
        
    }
    
    
    return self;
}

- (NSDictionary*) itemAtIndex: (int)index
{
    NSDictionary * item;
    
    item = [imageList objectAtIndex:index];
    
    return item;
}

- (NSUInteger)countOfImageList
{
    return imageList.count;
}


@end
