//
//  CardDeck.m
//  project04card
//
//  Created by Kyoungchin Seo on 2015. 7. 8..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "CardDeck.h"

@implementation CardDeck


- (void)randomize
{
    NSLog(@"%d",arc4random());
    
    NSUInteger index_symbol = arc4random() % 4;
    NSUInteger index_number = arc4random() % 13;
    
    NSLog(@"%lu %lu", (unsigned long)index_symbol, (unsigned long)index_number);
    
    
    NSArray *number_list = [NSArray arrayWithObjects: @"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K",nil];
    NSArray *symbol_list = [NSArray arrayWithObjects: @"c",@"d",@"h",@"s",nil];
    
    
    NSString *card = [NSString stringWithFormat:@"%@%@",[symbol_list objectAtIndex:index_symbol],[number_list objectAtIndex:index_number]];
    
    NSLog(@"%@",card);
    
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NewCard" object:card];
    
    
    
    
    
    
}


@end
