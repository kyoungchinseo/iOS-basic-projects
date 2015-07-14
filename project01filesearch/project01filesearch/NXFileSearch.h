//
//  NXFileSearch.h
//  project01filesearch
//
//  Created by Kyoungchin Seo on 2015. 6. 22..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXFileSearch : NSObject

@property NSString *path;
@property NSArray *fileList;
@property NSArray *dirPath;

- (id)initWithPathName:(NSString*)Path;

- (void)displayFileList;
- (void)displayDirPath;

- (NSArray*)getFileList;



@end
