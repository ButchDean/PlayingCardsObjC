#import <Cards.h>

@implementation Cards

- (void) _addCardToDeck: (NSInteger) cardEnum withString: (NSString *) cardString andValue: (NSInteger) cardValue
{
    currentCard = (CardDetail){cardEnum, (NSMutableString *)cardString, cardValue};
    card = [NSValue valueWithBytes: &currentCard objCType: @encode(CardDetail)];
    [deck addObject: card];
}

- (id) initCardDeck
{
    // Set up actual deck with card detail.
    deck = [[NSMutableArray alloc] init];

    // Set up deck indexes into deck to allow randomization and dealing.
    deckIdx = [[NSMutableArray alloc] init];

    [self _addCardToDeck: SPADES_A withString: @"Ace of Spades" andValue: 21];
    [self _addCardToDeck: SPADES2 withString: @"2 of Spades" andValue: 2];
    [self _addCardToDeck: SPADES3 withString: @"3 of Spades" andValue: 3];
    [self _addCardToDeck: SPADES4 withString: @"4 of Spades" andValue: 4];
    [self _addCardToDeck: SPADES5 withString: @"5 of Spades" andValue: 5];
    [self _addCardToDeck: SPADES6 withString: @"6 of Spades" andValue: 6];
    [self _addCardToDeck: SPADES7 withString: @"7 of Spades" andValue: 7];
    [self _addCardToDeck: SPADES8 withString: @"8 of Spades" andValue: 8];
    [self _addCardToDeck: SPADES9 withString: @"9 of Spades" andValue: 9];
    [self _addCardToDeck: SPADES10 withString: @"10 of Spades" andValue: 10];
    [self _addCardToDeck: SPADES_J withString: @"Jack of Spades" andValue: 11];
    [self _addCardToDeck: SPADES_Q withString: @"Queen of Spades" andValue: 12];
    [self _addCardToDeck: SPADES_K withString: @"King of Spades" andValue: 13];

    [self _addCardToDeck: CLUBS_A withString: @"Ace of Clubs" andValue: 21];
    [self _addCardToDeck: CLUBS2 withString: @"2 of Clubs" andValue: 2];
    [self _addCardToDeck: CLUBS3 withString: @"3 of Clubs" andValue: 3];
    [self _addCardToDeck: CLUBS4 withString: @"4 of Clubs" andValue: 4];
    [self _addCardToDeck: CLUBS5 withString: @"5 of Clubs" andValue: 5];
    [self _addCardToDeck: CLUBS6 withString: @"6 of Clubs" andValue: 6];
    [self _addCardToDeck: CLUBS7 withString: @"7 of Clubs" andValue: 7];
    [self _addCardToDeck: CLUBS8 withString: @"8 of Clubs" andValue: 8];
    [self _addCardToDeck: CLUBS9 withString: @"9 of Clubs" andValue: 9];
    [self _addCardToDeck: CLUBS10 withString: @"10 of Clubs" andValue: 10];
    [self _addCardToDeck: CLUBS_J withString: @"Jack of Clubs" andValue: 11];
    [self _addCardToDeck: CLUBS_Q withString: @"Queen of Clubs" andValue: 12];
    [self _addCardToDeck: CLUBS_K withString: @"King of Clubs" andValue: 13];

    [self _addCardToDeck: HEARTS_A withString: @"Ace of Hearts" andValue: 21];
    [self _addCardToDeck: HEARTS2 withString: @"2 of Hearts" andValue: 2];
    [self _addCardToDeck: HEARTS3 withString: @"3 of Hearts" andValue: 3];
    [self _addCardToDeck: HEARTS4 withString: @"4 of Hearts" andValue: 4];
    [self _addCardToDeck: HEARTS5 withString: @"5 of Hearts" andValue: 5];
    [self _addCardToDeck: HEARTS6 withString: @"6 of Hearts" andValue: 6];
    [self _addCardToDeck: HEARTS7 withString: @"7 of Hearts" andValue: 7];
    [self _addCardToDeck: HEARTS8 withString: @"8 of Hearts" andValue: 8];
    [self _addCardToDeck: HEARTS9 withString: @"9 of Hearts" andValue: 9];
    [self _addCardToDeck: HEARTS10 withString: @"10 of Hearts" andValue: 10];
    [self _addCardToDeck: HEARTS_J withString: @"Jack of Hearts" andValue: 11];
    [self _addCardToDeck: HEARTS_Q withString: @"Queen of Hearts" andValue: 12];
    [self _addCardToDeck: HEARTS_K withString: @"King of Hearts" andValue: 13];

    [self _addCardToDeck: DIAMONDS_A withString: @"Ace of Diamonds" andValue: 21];
    [self _addCardToDeck: DIAMONDS2 withString: @"2 of Diamonds" andValue: 2];
    [self _addCardToDeck: DIAMONDS3 withString: @"3 of Diamonds" andValue: 3];
    [self _addCardToDeck: DIAMONDS4 withString: @"4 of Diamonds" andValue: 4];
    [self _addCardToDeck: DIAMONDS5 withString: @"5 of Diamonds" andValue: 5];
    [self _addCardToDeck: DIAMONDS6 withString: @"6 of Diamonds" andValue: 6];
    [self _addCardToDeck: DIAMONDS7 withString: @"7 of Diamonds" andValue: 7];
    [self _addCardToDeck: DIAMONDS8 withString: @"8 of Diamonds" andValue: 8];
    [self _addCardToDeck: DIAMONDS9 withString: @"9 of Diamonds" andValue: 9];
    [self _addCardToDeck: DIAMONDS10 withString: @"10 of Diamonds" andValue: 10];
    [self _addCardToDeck: DIAMONDS_J withString: @"Jack of Diamonds" andValue: 11];
    [self _addCardToDeck: DIAMONDS_Q withString: @"Queen of Diamonds" andValue: 12];
    [self _addCardToDeck: DIAMONDS_K withString: @"King of Diamonds" andValue: 13];

    // Output all cards in array.
    for(NSUInteger i = 0; i < [deck count]; i++)
    {
        // Build card deck indexes to be randomized.
        NSNumber* idx = [NSNumber numberWithInt: i];
        [deckIdx addObject: idx];
    }

    return self;
}

- (void) printCard: (NSInteger) idx
{
    if(idx >= 0)
    {
        card = [deck objectAtIndex: idx];
        [card getValue: &currentCard];
        NSLog(@"Dealt %@ with value %i", currentCard.cardStr, currentCard.cardVal);
    }
}

- (void) shuffle;
{
    NSUInteger idxCnt = [deckIdx count];

    if(idxCnt > 1)
    {
        for(NSUInteger i = idxCnt - 1; i > 0; i--)
        {
            [deckIdx exchangeObjectAtIndex: i withObjectAtIndex: arc4random_uniform((int32_t)(i + 1))];
        }
    }
}

- (NSInteger) deal
{
    NSUInteger idx = [deckIdx count];
    NSUInteger idxToCardDetail = 0;

    if(idx > 0)
    {
        // Fetch the last idx.
        idxToCardDetail = [[deckIdx objectAtIndex: (idx - 1)] integerValue];

        // Remove this last index from index array.
        [deckIdx removeLastObject];

        return idxToCardDetail;
    }

    NSLog(@"Card deck is empty!");

    return -1;
}

- (NSInteger) deckCount
{
    return [deckIdx count];
}

- (void) deallocCards
{
    [deck release];
    [deckIdx release];

    [super dealloc];
}

@end
