//
//  NXDataModel.m
//  project07customTableView
//
//  Created by Kyoungchin Seo on 2015. 7. 27..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "NXDataModel.h"

@implementation NXDataModel


- (void)load
{

    NSLog(@"TEST!");
    
    NSString *data =
    @"[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20140116\"},{\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20140505\"},{\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20131212\"},{\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20130301\"},{\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20140101\"},{\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20130707\"},{\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20130815\"},{\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20131231\"},{\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20140102\"}]";
    
    JSONSerializer *jsonSerializer = [[JSONSerializer alloc]init];
    
    NSArray *serializedData = [jsonSerializer JSONSerializationFrom:data];
    
//    for (int i=0; i<[serializedData count]; i++) {
//        NSLog(@"title = %@",[[serializedData objectAtIndex:i] objectForKey:@"title"]);
//        NSLog(@"image = %@",[[serializedData objectAtIndex:i] objectForKey:@"image"]);
//        NSLog(@"date = %@",[[serializedData objectAtIndex:i] objectForKey:@"date"]);
//    }
//    
    
    // notification
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadFinished" object:serializedData];

}


@end
