//
//  PlayingCardDeck.m
//  Matcherr
//
//  Created by Aaron Rama on 10/15/13.
//  Copyright (c) 2013 Aaron Rama. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id) init
{
  self = [super init];
  
  if (self) {
    // Nested for loop. ToDo: Check permutation function for obj-c
    // like Ruby's array1.product(array2)
    for (NSString *suit in [PlayingCard validSuits]) {
      for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
        PlayingCard *card = [[PlayingCard alloc] init];
        card.suit = suit;
        card.rank = rank;
        [self addCard:card atTop:YES];
      }
    }
  }
  
  return self;
}

@end
