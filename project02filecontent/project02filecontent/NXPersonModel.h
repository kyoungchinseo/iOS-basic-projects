//
//  NXPersonModel.h
//  project02filecontent
//
//  Created by Kyoungchin Seo on 2015. 6. 26..
//  Copyright © 2015년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXPersonModel : NSObject

@property NSMutableArray *personList;


- (id)initWithPathName:(NSString*)Path;

- (NSString*)personNameAtIndex:(int)index;
- (NSNumber*)personNumberAtIndex:(int)index;
- (NSNumber*)personTeamAtIndex:(int)index;
- (NSDictionary*)getPersonObjectAtIndex:(int)index;

- (NSString*)findPersonNameByNumber: (NSNumber*)number;
- (NSNumber*)findPersonNumberByName: (NSString*)name;

- (NSArray *)sortedByName;
- (NSArray *)sortedByNumber;
- (NSArray *)sortedByTeam;

@end
