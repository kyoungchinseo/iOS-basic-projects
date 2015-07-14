//
//  NXPerson.m
//  project01object
//
//  Created by Kyoungchin Seo on 2015. 6. 22..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "NXPerson.h"

@implementation NXPerson

@synthesize _name;

- (id)initWithName:(NSString *)aName
{
    self = [super init];
    if (self) {
        _name = aName;
    }
    return self;
}

- (NSString*)personName
{
    return _name;
}

- (void)printName
{
    NSLog(@"%@",_name);
}





@end
