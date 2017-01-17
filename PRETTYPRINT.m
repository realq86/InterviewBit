//
//  PRETTYPRINT.m
//  
//
//  Created by Developer on 1/16/17.
//
//

#import <Foundation/Foundation.h>


@implementation Solution
-(NSMutableArray *) prettyPrint:(NSInteger) A  {
    
    // NSMutableArray *solution = [[NSMutableArray alloc] init];
    NSMutableArray *solution = [NSMutableArray new];
    
    if (A <= 0) {
        return solution;
    }
    
    NSMutableArray *newArray = [NSMutableArray new];
    [solution addObject:newArray];
    
    int height = (A*2)-1;
    int centerX = A-1;
    int centerY = A-1;
    
    for (int i=0; i<height; i++) {
        
        if (i>solution.count-1) {
            [solution addObject:[NSMutableArray new]];
        }
        
        NSMutableArray *currentLine = [solution objectAtIndex:i];
        for (int j=0; j<height; j++) {
            
            int diffX = abs(j-centerX);
            int diffY = abs(i-centerY);
            int distance = MAX(diffX, diffY);
            int value = distance+1;
            
            [currentLine addObject:@(value)];
        }
    }
    
    return solution;
}
@end
