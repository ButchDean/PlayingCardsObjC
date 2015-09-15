#import <Foundation/Foundation.h>
#import <Cards.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    Cards* cards = [[Cards alloc] init];

    [cards initCardDeck];
    [cards dealloc];

    [pool drain];

    return 0;
}
