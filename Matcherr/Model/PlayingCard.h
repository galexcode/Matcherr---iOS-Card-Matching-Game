//
//  PlayingCard.h
//  Matcherr
//
//  Created by Aaron Rama on 10/15/13.
//  Copyright (c) 2013 Aaron Rama. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
