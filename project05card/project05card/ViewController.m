//
//  ViewController.m
//  project05card
//
//  Created by Kyoungchin Seo on 2015. 7. 13..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "ViewController.h"
#import "SolitaireDeck.h"

@interface ViewController ()
{
    SolitaireDeck *deck;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    deck = [[SolitaireDeck alloc]init];
    [deck ShuffleCards];
    [deck DisplayCards];
    [deck release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
