#import <Foundation/Foundation.h>

typedef enum { SPADES_A = 0, SPADES2, SPADES3, SPADES4, SPADES5, SPADES6, SPADES7, SPADES8, SPADES9, SPADES10, SPADES_J, SPADES_Q, SPADES_K,
        CLUBS_A, CLUBS2, CLUBS3, CLUBS4, CLUBS5, CLUBS6, CLUBS7, CLUBS8, CLUBS9, CLUBS10, CLUBS_J, CLUBS_Q, CLUBS_K,
        HEARTS_A, HEARTS2, HEARTS3, HEARTS4, HEARTS5, HEARTS6, HEARTS7, HEARTS8, HEARTS9, HEARTS10, HEARTS_J, HEARTS_Q, HEARTS_K,
        DIAMONDS_A, DIAMONDS2, DIAMONDS3, DIAMONDS4, DIAMONDS5, DIAMONDS6, DIAMONDS7, DIAMONDS8, DIAMONDS9, DIAMONDS10, DIAMONDS_J, DIAMONDS_Q, DIAMONDS_K,
        EMPTY_DECK } CardRefs;

typedef struct _CardDetail
{
    CardRefs cRef;
    NSMutableString* cardStr;
    int cardVal;
} CardDetail;

@interface Cards : NSObject
{
    NSMutableArray* deck;
    NSValue* card;
    CardDetail currentCard;
    NSMutableArray* deckIdx;
}

- (id) initCardDeck;
- (void) printCard: (NSInteger) idx;
- (void) shuffle;
- (NSInteger) deal;
- (NSInteger) deckCount;
- (void) deallocCards;

@end
