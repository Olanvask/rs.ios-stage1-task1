#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    int maxSum = 0;
    int minSum = 0;
    int tempSum = 0;
    
    for (int i = 1; i< [array count]; i++) {
        tempSum += [array[i] intValue];
        
    }
    maxSum = tempSum;
    minSum = tempSum;
    for (int i = 1; i < [array count]; i++) {
        tempSum = 0;
        for (int j = 0; j < [array count]; j++) {
            if (j != i) {
                tempSum += [array[j] intValue];
            }
        }
        if (tempSum < minSum) {
            minSum = tempSum;
        }
        if (tempSum > maxSum){
            maxSum = tempSum;
        }
    }
    return @[[NSNumber numberWithInt: minSum], [NSNumber numberWithInt: maxSum]];
}

@end
