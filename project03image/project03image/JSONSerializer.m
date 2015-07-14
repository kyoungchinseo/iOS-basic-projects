//
//  JSONSerializer.m
//  project03json
//
//  Created by Kyoungchin Seo on 2015. 6. 28..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "JSONSerializer.h"

@implementation JSONSerializer


- (id) init
{
    self = [super init];

    if (self) {
        
    }

    return self;
}


- (id)JSONSerializationFrom:(NSString *)jsonData
{
    NSArray* result;
    NSError *error;
    
    NSData* data = [jsonData dataUsingEncoding:NSUTF8StringEncoding];
    
    result = [NSJSONSerialization
              JSONObjectWithData:data
              options:kNilOptions
              error:&error];
    
    if (error) {
        NSLog(@"error: %@",error.localizedDescription);
    }
    return result;
}

- (NSString *)JSONMakerWithArray: (NSArray*)arrayData
{
    NSString *result;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:0 error:nil];
    result = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return result;
}

- (NSString *)JSONMakerWithDictionary: (NSDictionary*)dictionaryData
{
    NSString *result;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionaryData options:0 error:nil];
    result = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return result;
}


@end
