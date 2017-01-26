//
//  Count_And_Say.m
//  
//
//  Created by Developer on 1/26/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSMutableString *) countAndSay:(NSInteger) A  {
    
    NSMutableString *string = [@"1211" mutableCopy];
    
    if (A==0) {
        return @"";
    }
    if (A==1) {
        return @"1";
    }
    if (A==2) {
        return @"11";
    }
    if (A==3) {
        return @"21";
    }
    if (A==4) {
        return string;
    }
    
    for (int i=4; i<A; i++) {
        
        string = [self findNextStringFrom:string];
    }
    
    return string;
}


- (NSString *)findNextStringFrom:(NSString *)currentString {
    
    NSMutableString *newString = [NSMutableString new];
    int currentIndex = 0;
    int runnerIndex = 1;
    int count = 1;
    while (runnerIndex < currentString.length) {
        
        char current = [currentString characterAtIndex:currentIndex];
        char runner = [currentString characterAtIndex:runnerIndex];
        
        if (current == runner) {
            runnerIndex++;
            count++;
            
            if (runnerIndex == currentString.length) {
                [newString appendFormat:@"%d%c",count, current];
                break;
            }
        }
        else {
            [newString appendFormat:@"%d%c",count, current];
            currentIndex = runnerIndex;
            runnerIndex++;
            count = 1;
            
            if (runnerIndex == currentString.length) {
                [newString appendFormat:@"%d%c",count, [currentString characterAtIndex:runnerIndex-1]];
                break;
            }
        }
    }
    
    return newString;
}
@end
