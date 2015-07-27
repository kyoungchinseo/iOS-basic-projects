//
//  ViewController.m
//  project07customTableView
//
//  Created by Kyoungchin Seo on 2015. 7. 21..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "ViewController.h"

#import "NXDataModel.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NXDataModel *model = [[NXDataModel alloc]init];
    [model load];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadFinshedHandler:) name:@"loadFinished" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) loadFinshedHandler: (NSNotification *)notification
{
    NSLog(@"notification is %@",[notification object]);
    
}




@end
