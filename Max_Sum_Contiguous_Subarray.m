//
//  Max_Sum_Contiguous_Subarray.m
//  
//
//  Created by Developer on 1/26/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSInteger) maxSubArray:(NSArray *) A  {
    
    
    if (A.count == 0) {
        return 0;
    }
    if (A.count < 2) {
        return [[A objectAtIndex:0] intValue];
    }
    
    int max = [[A objectAtIndex:0] intValue];
    int maxIndex = 0;
    int sum = 0;
    for (int i=1; i<A.count; i++) {
        
        NSNumber *current = [A objectAtIndex:i];
        
        sum = MAX(current.intValue, sum+current.intValue);
        
        if (sum > max) {
            max = sum;
            maxIndex = i;
        }
    }
    
    return max;
}

@end
