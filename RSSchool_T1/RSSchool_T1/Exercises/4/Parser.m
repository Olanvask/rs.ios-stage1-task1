#import "Parser.h"

@implementation Parser

// Complete the parseString function below.

- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSDictionary *dicOfBraces = @{@">":@"<", @")":@"(", @"]":@"["};
    NSMutableArray<NSMutableString *> *stackArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [string length]; i++) {
        NSString *currentSymbol = [string substringWithRange:NSMakeRange(i, 1)];
        if ([[dicOfBraces allValues] containsObject: currentSymbol]){
            if ([stackArray count] > 0){
                for (int j = [stackArray count] -1; j >= 0; j--) {
                    NSString *lastSymbArrayJ = [stackArray[j] substringWithRange:NSMakeRange([stackArray[j] length]-1, 1)];
                    NSString *firstSymbArrayJ = [stackArray[j] substringWithRange:NSMakeRange(0, 1)];
                    if (!([dicOfBraces[lastSymbArrayJ] isEqualToString: firstSymbArrayJ])) {
                        [stackArray[j] appendString:currentSymbol];
                    }
                }
            }
            [stackArray addObject:[currentSymbol mutableCopy]];
            
            
        }else{
            if ([stackArray count] > 0){
                for (int j = [stackArray count] -1; j >= 0; j--) {
                    NSString *lastSymbArrayJ = [stackArray[j] substringWithRange:NSMakeRange([stackArray[j] length]-1, 1)];
                    NSString *firstSymbArrayJ = [stackArray[j] substringWithRange:NSMakeRange(0, 1)];
                    if (!([dicOfBraces[lastSymbArrayJ] isEqualToString: firstSymbArrayJ])) {
                        [stackArray[j] appendString:currentSymbol];
                    }else{
                        int openBracesCouter = 0;
                        int closeBracesCounter = 0;
                        for (int counterIndex = 0; counterIndex < [stackArray[j] length]; counterIndex++) {
                            if ([[stackArray[j] substringWithRange:NSMakeRange(counterIndex, 1)] isEqualToString: firstSymbArrayJ]) {
                                openBracesCouter ++;
                            }
                            if ([[stackArray[j] substringWithRange:NSMakeRange(counterIndex, 1)] isEqualToString: lastSymbArrayJ]) {
                                closeBracesCounter ++;
                            }
                        }
                        if (openBracesCouter>closeBracesCounter){
                            [stackArray[j] appendString:currentSymbol];
                        }
                    }
                }
            }
        }
    }
    for (NSMutableString *mString in stackArray) {
        NSString *lastSymbArrayJ = [mString substringWithRange:NSMakeRange([mString length]-1, 1)];
        NSString *firstSymbArrayJ = [mString substringWithRange:NSMakeRange(0, 1)];
        if ([dicOfBraces[lastSymbArrayJ] isEqualToString: firstSymbArrayJ]) {
            [resultArray addObject:[mString substringWithRange:NSMakeRange(1, [mString length] - 2)]];
        }
        
    }
    if ([resultArray count] > 0) {
        return resultArray;
        
    }else{
        return @[];
    }
}

@end
