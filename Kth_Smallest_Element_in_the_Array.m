//
//  Kth_Smallest_Element_in_the_Array.m
//  
//
//  Created by Developer on 1/16/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSInteger) kthsmallest:(NSArray *) A :(NSInteger) B  {
    
    int max = [[A objectAtIndex:0] intValue];
    int min = [[A objectAtIndex:0] intValue];
    for (int i=0; i<A.count; i++) {
        
        int current = [[A objectAtIndex:i] intValue];
        
        if (current >= max) {
            max = current;
        }
        if (current <= min) {
            min = current;
        }
    }
    
    while (min <= max) {
        int mid = (max - min)/2 + min;
        int countOfBefore = 0;
        int countOfEqual = 0;
        
        for (int i=0; i<A.count; i++) {
            
            int current = [[A objectAtIndex:i] intValue];
            
            if (current < mid) {
                countOfBefore++;
            }
            if (current == mid) {
                countOfEqual++;
            }
            if (countOfBefore > B) {
                break;
            }
        }
        
        if (countOfBefore < B && countOfBefore+countOfEqual >= B) {
            return mid;
        }
        if (countOfBefore < B) {
            min = mid+1;
        }
        else {
            max = mid-1;
        }
    }
    
    return -1;
}
@end
