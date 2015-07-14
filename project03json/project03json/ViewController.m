//
//  ViewController.m
//  project03json
//
//  Created by Kyoungchin Seo on 2015. 6. 28..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "ViewController.h"
#import "JSONSerializer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JSONSerializer *jsonSerializer = [[JSONSerializer alloc]init];
    
    //NSString *jsonData = @"[{“id”:“001”,“name”:“john”},{“id”:“007”,“name”:“james”}]";
    NSString *jsonData = @"[{\"id\":\"001\",\"name\":\"john\"},{\"id\":\"007\",\"name\":\"james\"}]";

    
    NSArray *serializedData = [jsonSerializer JSONSerializationFrom:jsonData];
    
    for (int i=0; i<[serializedData count]; i++) {
        NSLog(@"id = %@",[[serializedData objectAtIndex:i] objectForKey:@"id"]);
        NSLog(@"name = %@",[[serializedData objectAtIndex:i] objectForKey:@"name"]);
    }
    
    
    //
    NSMutableDictionary *dictData = [[NSMutableDictionary alloc]init];
    [dictData setValue:@"Login" forKey:@"methodName"];
    [dictData setValue:@"admin" forKey:@"username"];
    [dictData setValue:@"12345" forKey:@"password"];
    [dictData setValue:@"mobile" forKey:@"clientType"];
    
    NSString *strFromDicData = [jsonSerializer JSONMakerWithDictionary:dictData ];
    NSLog(@"%@",strFromDicData);
    
    //
    NSMutableArray *arrayData = [[NSMutableArray alloc]init];
    [arrayData addObject:@"Login"];
    [arrayData addObject:@"admin"];
    [arrayData addObject:@"12345"];
    [arrayData addObject:@"mobile"];
    
    NSString *strFromArrData = [jsonSerializer JSONMakerWithArray:arrayData];
    NSLog(@"%@", strFromArrData);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
