//
//  NXPerson.h
//  project01object
//
//  Created by Kyoungchin Seo on 2015. 6. 22..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXPerson : NSObject

@property (readwrite) NSString* _name;

// constructor
- (id)initWithName:(NSString*)aName;

// getter
- (NSString*)personName;

// display
- (void)printName;


@end
