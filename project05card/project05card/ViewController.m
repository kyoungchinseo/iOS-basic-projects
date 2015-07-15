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
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //NSString *fileName;
    for (int i=0; i<8; i++) {
        for (int j=0; j<[[deck.CardDeck objectAtIndex:i]count]; j++) {
            NSString *fileName= [NSString stringWithFormat:@"%@.png",[[deck.CardDeck objectAtIndex:i] objectAtIndex:j]];
            UIImageView *cardImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:fileName]];
            if (i != 7) {
                [cardImage setFrame:CGRectMake(i*140+26, j*40+100, 130, 150)];
            } else {
                [cardImage setFrame:CGRectMake(j*24+26, 500, 130, 150)];
            }
            [self.view addSubview:cardImage];
        }
    }
    
    [deck release];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
