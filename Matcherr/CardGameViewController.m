//
//  CardGameViewController.m
//  Matcherr
//
//  Created by Aaron Rama on 10/15/13.
//  Copyright (c) 2013 Aaron Rama. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck *deck;

@end

@implementation CardGameViewController

- (Deck *)deck
{
  if (!_deck) _deck = [[PlayingCardDeck alloc] init];
  return _deck;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
  _cardButtons = cardButtons;
  for (UIButton *cardButton in cardButtons) {
    Card *card = [self.deck drawRandomCard];
    [cardButton setTitle:card.contents forState:UIControlStateSelected];
  }
}

- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.flipCount++;
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}


@end
