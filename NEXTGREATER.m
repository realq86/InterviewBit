//
//  NEXTGREATER.m
//  
//
//  Created by Developer on 1/16/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSMutableArray *) nextGreater:(NSMutableArray *) A  {
    
    NSMutableArray *stack = [NSMutableArray new];
    
    for (int i=A.count-1; i>=0; i--) {
        
        int currentValue = [[A objectAtIndex:i] intValue];
        
        int solution = -1;
        
        while (stack.count > 0) {
            NSNumber *stackPeek = [stack lastObject];
            
            if (stackPeek.intValue > currentValue) {
                solution = stackPeek.intValue;
                break;
            }
            
            [stack removeLastObject];
        }
        
        [stack addObject:[A objectAtIndex:i]];
        
        [A replaceObjectAtIndex:i withObject:@(solution)];
        
    }
    
    return A;
}
@end
