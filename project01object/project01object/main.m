//
//  main.m
//  project01object
//
//  Created by Kyoungchin Seo on 2015. 6. 22..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NXPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NXPerson *aPerson = [[NXPerson alloc]initWithName:@"Kim Cheolsoo"];
        NSString *aPersonName = [aPerson personName];
        NSLog(@"aPerson's name is %@",aPersonName);
        [aPerson printName];
        
    }
    return 0;
}
