#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    
    int localSumForAnna = 0;
    for (int i = 0 ; i<[bill count]; i++) {
        
        if (index != i) {
            localSumForAnna += [bill[i] intValue];
        }
        
    }
    if ((localSumForAnna/2) == [sum intValue]) {
        return @"Bon Appetit";
    } else{
        return [NSString stringWithFormat: @"%d", ([sum intValue] - localSumForAnna/2)];
    }
    return @"";
}

@end
