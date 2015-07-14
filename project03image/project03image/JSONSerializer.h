//
//  JSONSerializer.h
//  project03json
//
//  Created by Kyoungchin Seo on 2015. 6. 28..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONSerializer : NSObject



//
//- (id) init;
- (id) JSONSerializationFrom: (NSString*)jsonData;
- (NSString *)JSONMakerWithArray: (NSArray*)arrayData;
- (NSString *)JSONMakerWithDictionary: (NSDictionary*)dictionaryData;


@end
