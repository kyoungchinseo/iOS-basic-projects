//
//  SolitaireDeck.m
//  project05card
//
//  Created by Kyoungchin Seo on 2015. 7. 13..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "SolitaireDeck.h"

@implementation SolitaireDeck

@synthesize CardDeck;


- (void) ShuffleCards {
    
    NSArray *number_list = [[NSArray alloc] initWithObjects: @"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K",nil];
    NSArray *symbol_list = [[NSArray alloc] initWithObjects: @"c",@"d",@"h",@"s",nil];
    
    NSMutableArray *allCards = [[NSMutableArray alloc] init];
    
    for (int i=0;i<[symbol_list count];i++) {
        for (int j=0; j<[number_list count]; j++) {
            [allCards addObject: [NSString stringWithFormat:@"%@%@", [symbol_list objectAtIndex:i],[number_list objectAtIndex:j]]];
        }
    }
    
    CardDeck = [[NSMutableArray alloc]init];
    NSMutableArray *cards;
    NSInteger remained_num = 52;
    for (int i=0; i<7; i++) {
        cards = [[NSMutableArray alloc] init];
        for (int j=0; j<i+1; j++) {
            int index = arc4random()%remained_num;
            [cards addObject:[allCards objectAtIndex:index]];
            [allCards removeObjectAtIndex:index];
            remained_num--;
        }
        [CardDeck addObject:cards];
    }
    
    [CardDeck addObject:allCards];

}

- (void) DisplayCards {
    for (int i=0; i<8; i++) {
        NSLog(@"--- %d ---",i+1);
        for (int j=0; j<[[CardDeck objectAtIndex:i]count]; j++) {
            NSLog(@"%@",[[CardDeck objectAtIndex:i] objectAtIndex:j]);
        }
        NSLog(@"----------");
    }
}

@end
