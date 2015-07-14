//
//  NXFileSearch.m
//  project01filesearch
//
//  Created by Kyoungchin Seo on 2015. 6. 22..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "NXFileSearch.h"

@implementation NXFileSearch

@synthesize path;
@synthesize fileList;
@synthesize dirPath;

- (id)initWithPathName:(NSString *)Path
{
    self = [super init];
    
    if (self) {
        path = Path;
    }
    
    return self;
}

- (NSArray*)getFileList
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    dirPath = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [dirPath objectAtIndex:0];
    
    fileList = [fileManager contentsOfDirectoryAtPath: documentPath error:NULL];
    
    return fileList;
}

- (void)displayFileList
{
    for(int i=0;i<[fileList count];i++) {
        NSLog(@"%@",[fileList objectAtIndex:i]);
    }
}

- (void)displayDirPath
{
    NSLog(@"%@",dirPath);
}





@end
