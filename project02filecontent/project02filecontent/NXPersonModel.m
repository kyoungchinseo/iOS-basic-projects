//
//  NXPersonModel.m
//  project02filecontent
//
//  Created by Kyoungchin Seo on 2015. 6. 26..
//  Copyright © 2015년 nhnnext. All rights reserved.
//

#import "NXPersonModel.h"

@implementation NXPersonModel

@synthesize personList;


- (id)initWithPathName:(NSString *)Path
{
    self = [super init];
    
    if (self) {
        NSFileManager * fileManager = [NSFileManager defaultManager];
        
        if ([fileManager fileExistsAtPath:Path]) {
        
            // load content as string from a file
            NSString *content = [NSString stringWithContentsOfFile:Path encoding:NSUTF8StringEncoding error:nil];
            
            // seperate by line
            NSArray *brokenByLines= [content componentsSeparatedByString:@"\n"];
            
            personList = [[NSMutableArray alloc] initWithCapacity:0];
            
            for (int i=0 ; i<[brokenByLines count] ; i++) {
                
                // seperate by comma
                NSArray *personElement = [[brokenByLines objectAtIndex:i] componentsSeparatedByString:@","];
                
                NSString *personName = [personElement objectAtIndex:0];
                NSNumber *personNumber = [NSNumber numberWithInt:[[personElement objectAtIndex:1] intValue]];
                NSNumber *personTeam = [NSNumber numberWithInt:[[personElement objectAtIndex:2] intValue]];
                
                NSDictionary *personObject = [NSDictionary dictionaryWithObjects:@[personName, personNumber, personTeam] forKeys:@[@"name",@"number",@"team"]];
                
                [personList addObject:personObject];
//                NSLog(@"%@", personList[i]);
//                NSLog(@"%@", [personList[i] objectForKey:@"name"]);
//                NSLog(@"%d", [[personList[i] objectForKey:@"number"] intValue]);
            }
        }
        
    }
    
    return self;
}

- (NSString*)personNameAtIndex:(int)index
{
    return [personList[index] objectForKey:@"name"];
}

- (NSNumber*)personNumberAtIndex:(int)index
{
    return [personList[index] objectForKey:@"number"];
}

- (NSNumber*)personTeamAtIndex:(int)index
{
    return [personList[index] objectForKey:@"team"];
}

- (NSDictionary*)getPersonObjectAtIndex:(int)index
{
    return personList[index];
}


- (NSString*)findPersonNameByNumber: (NSNumber*)number
{
    for (int i=0; i<[personList count]; i++) {
        if ([self personNumberAtIndex:i] == number) {
            return [self personNameAtIndex:i];
        }
    }
    return nil;
}

- (NSNumber*)findPersonNumberByName: (NSString*)name
{
    for (int i=0; i<[personList count]; i++) {
        if ([self personNameAtIndex:i] == name) {
            return [self personNumberAtIndex:i];
        }
    }
    return nil;
}


- (NSArray *)sortedByName
{
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortedDescriptors = [NSArray arrayWithObjects:nameDescriptor, nil];
    NSArray *sortedArray = [personList sortedArrayUsingDescriptors:sortedDescriptors];
    
    return sortedArray;
}

- (NSArray *)sortedByNumber
{
    NSSortDescriptor *numberDescriptor = [[NSSortDescriptor alloc]initWithKey:@"number" ascending:YES];
    NSArray *sortedDescriptors = [NSArray arrayWithObjects:numberDescriptor, nil];
    NSArray *sortedArray = [personList sortedArrayUsingDescriptors:sortedDescriptors];
    
    return sortedArray;
}

- (NSArray *)sortedByTeam
{
    NSSortDescriptor *teamDescriptor = [[NSSortDescriptor alloc] initWithKey:@"team" ascending:YES];
    NSArray *sortedDescriptors = [NSArray arrayWithObjects:teamDescriptor, nil];
    NSArray *sortedArray = [personList sortedArrayUsingDescriptors:sortedDescriptors];
    
    return sortedArray;
}



@end
