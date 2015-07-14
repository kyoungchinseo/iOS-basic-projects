//
//  main.m
//  project01filesearch
//
//  Created by Kyoungchin Seo on 2015. 6. 22..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NXFileSearch.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NXFileSearch *fileSearch = [[NXFileSearch alloc] initWithPathName:@"/data"];
        
        NSArray *fileList = [fileSearch getFileList];
//        
//        for(int i=0;i<[fileList count];i++) {
//            NSLog(@"%@",[fileList objectAtIndex:i]);
//        }
//
        NSLog(@"number of files: %d",[fileList count]);
        
        [fileSearch displayDirPath];
        
//        [fileSearch displayFileList];
        
    }
    return 0;
}
