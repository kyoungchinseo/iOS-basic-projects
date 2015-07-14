//
//  ImageModel.h
//  project03image
//
//  Created by Kyoungchin Seo on 2015. 7. 5..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

@property NSArray *imageList;


- (id)initWithPathName:(NSString*)Path;

- (NSDictionary*) itemAtIndex: (int)index;

- (NSUInteger)countOfImageList;


@end
