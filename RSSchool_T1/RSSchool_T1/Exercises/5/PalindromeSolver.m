#import "PalindromeSolver.h"
#import "Math.h"

@implementation PalindromeSolver
- (BOOL) isPalindrome: (NSMutableString *) sMutable{
    NSMutableString *sMutableReversed = [[NSMutableString alloc] initWithCapacity:[sMutable length]];
    int len = [sMutable length]-1;
    for (int i = [sMutable length]-1; i>=0 ;i--) {
        [sMutableReversed appendFormat:@"%c",[sMutable characterAtIndex:i]];
    }
    if ([sMutable isEqualToString:sMutableReversed]) {
        return YES;
    } else {
        return NO;
    }
    return YES;
}
// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    //   s = @"1221";
    NSMutableString *sMutable = [s mutableCopy];
    int digitCounter = [k intValue];
    int rightIndex = [sMutable length]-1;
    int leftIndex = 0;
    while (leftIndex < rightIndex) {
        if ((int) [s characterAtIndex:leftIndex] > (int) [s characterAtIndex:rightIndex]){
            [sMutable replaceCharactersInRange:NSMakeRange(rightIndex, 1) withString:[s substringWithRange:NSMakeRange(leftIndex, 1)]];
            digitCounter--;
        }else if ((int) [s characterAtIndex:leftIndex] < (int) [s characterAtIndex:rightIndex]){
            [sMutable replaceCharactersInRange:NSMakeRange(leftIndex, 1) withString:[s substringWithRange:NSMakeRange(rightIndex, 1)]];
            digitCounter--;
        }
        leftIndex++;
        rightIndex--;
    }
    if (digitCounter < 0) {
        return @"-1";
    }
    leftIndex = 0;
    rightIndex = [sMutable length]-1;
    while (leftIndex<=rightIndex) {
        if (leftIndex == rightIndex){
            if (digitCounter > 0){
                [sMutable replaceCharactersInRange:NSMakeRange(leftIndex, 1) withString:@"9"];
            }
        }
        if ([sMutable characterAtIndex:leftIndex] < '9') {
            if (([sMutable characterAtIndex:leftIndex] == [s characterAtIndex:leftIndex]) && ([sMutable characterAtIndex:rightIndex] == [s characterAtIndex:rightIndex]) && (digitCounter >= 2)){
                [sMutable replaceCharactersInRange:NSMakeRange(leftIndex, 1) withString:@"9"];
                [sMutable replaceCharactersInRange:NSMakeRange(rightIndex, 1) withString:@"9"];
                digitCounter -= 2;
            }else if ((([sMutable characterAtIndex:leftIndex] == [s characterAtIndex:leftIndex]) || ([sMutable characterAtIndex:rightIndex] == [s characterAtIndex:rightIndex])) && (digitCounter == 1)){
                digitCounter --;
                [sMutable replaceCharactersInRange:NSMakeRange(leftIndex, 1) withString:@"9"];
                [sMutable replaceCharactersInRange:NSMakeRange(rightIndex, 1) withString:@"9"];            }
        }
        leftIndex ++;
        rightIndex --;
    }
    
    //    BOOL iss = [self isPalindrome:sMutable];
    
    
    return sMutable;
}

@end
