#import <Foundation/Foundation.h>
#import <Cards.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    NSUInteger remainingCards;

    Cards* cards = [[Cards alloc] init];

    [cards shuffle];

    [cards printCard: [cards deal]];
    [cards printCard: [cards deal]];

    NSLog(@"Dealing reamining cards...");
    remainingCards = [cards deckCount];

    for(NSUInteger i = 0; i < remainingCards; i++)
    {
        [cards printCard: [cards deal]];
    }

    NSLog(@"Try to deal from empty deck...");
    [cards printCard: [cards deal]];

    [cards dealloc];

    [pool drain];

    return 0;
}
