//
//  CardMatchingGame.m
//  Matcherr
//
//  Created by Aaron Rama on 10/15/13.
//  Copyright (c) 2013 Aaron Rama. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
  if (!_cards) _cards = [[NSMutableArray alloc] init];
  return _cards;
}

- (id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
  self = [super init];
  
  if (self) {
    for (int i = 0; i < cardCount; i++) {
      Card *card = [deck drawRandomCard];
      if (card) {
        self.cards[i] = card;
      } else {
        self = nil;
      }
    }
  }
  
  return self;
  
}

# define MATCH_BONUS 4
# define MISMATCH_PENALTY 2
# define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
  Card *card = [self cardAtIndex:index];
  
  if (!card.isUnplayable) {
    if (!card.isFaceUp) {
      for (Card *otherCard in self.cards) {
        if (otherCard.isFaceUp && !otherCard.isUnplayable) {
          int matchScore = [card match:@[otherCard]];
          if (matchScore) {
            otherCard.unplayable = YES;
            card.unplayable = YES;
            self.score += matchScore * MATCH_BONUS;
          } else {
            otherCard.faceup = NO;
            self.score -= MISMATCH_PENALTY;
          }
          break;
        }
      }
    }
    card.faceup = !card.isFaceUp;
  }
  self.score -= FLIP_COST;
  
}

- (Card *)cardAtIndex:(NSUInteger)index
{
  if (index < self.cards.count) {
    return self.cards[index];
  } else {
    return nil;
  }
  
}


@end
