//
//  Card.m
//  Matcherr
//
//  Created by Aaron Rama on 10/15/13.
//  Copyright (c) 2013 Aaron Rama. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
  int score = 0;
  
  for (Card *card in otherCards) {
    if ([card.contents isEqualToString:self.contents]) {
      score = 1;
    }
  }
  return score;
}

@end
