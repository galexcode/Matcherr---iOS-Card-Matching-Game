//
//  PlayingCard.m
//  Matcherr
//
//  Created by Aaron Rama on 10/15/13.
//  Copyright (c) 2013 Aaron Rama. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
- (NSString *)contents
{
  return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit ];
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit
{
  if ([[PlayingCard validSuits] containsObject:suit]) {
    _suit = suit;
  }
}

- (NSString *)suit
{
  return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
  static NSArray *rankStrings = nil;
  if (!rankStrings) {
     rankStrings = @[@"?", @"a", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"j", @"q", @"k"];
  }
  return rankStrings;
}

+ (NSArray *)validSuits
{
  return @[@"clubs", @"diamonds", @"hearts", @"spades"];
}

+ (NSUInteger)maxRank
{
  return [self rankStrings].count - 1;
}
@end
