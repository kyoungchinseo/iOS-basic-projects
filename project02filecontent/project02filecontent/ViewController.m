//
//  ViewController.m
//  project02filecontent
//
//  Created by Kyoungchin Seo on 2015. 6. 23..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "ViewController.h"
#import "NXPersonModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *personFilePath = [[NSBundle mainBundle]pathForResource:@"persons" ofType:@"txt"];
    NXPersonModel *personModel = [[NXPersonModel alloc]initWithPathName:personFilePath];
    
    //NSLog(@"name %@",[personModel personNameAtIndex:0]);
    //NSLog(@"number %d",[[personModel personNameAtIndex:0] intValue]);
    //NSLog(@"team %d",[[personModel personTeamAtIndex:0] intValue]);
    //NSLog(@"%@",[personModel findPersonNameByNumber:[personModel personNumberAtIndex:3]]);
    
    //NSLog(@"%d", [[personModel findPersonNumberByName:[personModel personNameAtIndex:3]]intValue]);
    
    //NSArray *sortedArray = [personModel sortedByName];
    //NSArray *sortedArray = [personModel sortedByNumber];
    NSArray *sortedArray = [personModel sortedByTeam];
    
    for (int i=0; i<[sortedArray count]; i++) {
        NSLog(@"%@ %d %d",[[sortedArray objectAtIndex:i] objectForKey:@"name"],[[[sortedArray objectAtIndex:i] objectForKey:@"number"]intValue],[[[sortedArray objectAtIndex:i] objectForKey:@"team"] intValue]);
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
