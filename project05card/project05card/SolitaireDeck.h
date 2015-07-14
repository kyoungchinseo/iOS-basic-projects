//
//  SolitaireDeck.h
//  project05card
//
//  Created by Kyoungchin Seo on 2015. 7. 13..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolitaireDeck : NSObject

@property NSMutableArray *CardDeck;


- (void)ShuffleCards;
- (void)DisplayCards;

@end
