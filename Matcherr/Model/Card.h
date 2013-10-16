//
//  Card.h
//  Matcherr
//
//  Created by Aaron Rama on 10/15/13.
//  Copyright (c) 2013 Aaron Rama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isFaceUp) BOOL faceup;
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
