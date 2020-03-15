#import "T1Array.h"

@implementation T1Array
- (BOOL) isHappy: (NSArray *) array {
    BOOL happy = YES;
    for (int i = 1; i < ([array count]-1); i++) {
        if (([array[i-1] intValue] + [array[i+1] integerValue]) < [array[i] intValue]) {
            happy = NO;
            break;
        }
    }
    return happy;
}
// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if ([sadArray isEqual:@[]]){
        return sadArray;
    }
    NSMutableArray *tempArray = [sadArray mutableCopy];
    
    while (([self isHappy: tempArray] == NO) && ([tempArray count]>2)) {
        for (int i=1; i<([tempArray count]-1); i++) {
            if (([tempArray[i-1] intValue] + [tempArray[i+1] integerValue]) < [tempArray[i] intValue]) {
                [tempArray removeObjectAtIndex:i];
                break;
            }
        }
        
    }
    return tempArray;
}

@end
