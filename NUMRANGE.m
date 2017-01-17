//
//  NUMRANGE.m
//  
//
//  Created by Developer on 1/16/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSInteger) numRange:(NSMutableArray *) A :(NSInteger) B :(NSInteger) C  {
    
    int solution = 0;
    
    int sum = 0;
	   // int progressOfSum = 0;
	   
    for (int i=0; i<A.count; i++) {
        
        int current = [[A objectAtIndex:i] intValue];
        sum += current;
        [A replaceObjectAtIndex:i withObject:@(sum)];
    }
    
    int currentIndex = 0;
    int lowIndex = 0;
    int highIndex = 0;
    int currentValue = [[A objectAtIndex:0] intValue];
    int currentSum = [[A objectAtIndex:0] intValue];
    
    //For each value as candidate for start of subArray
    while (currentIndex < A.count) {
        //If valid starting point for subArray
        if (currentValue <= C) {
            
            if (currentIndex >= lowIndex) {
                lowIndex = currentIndex;
            }
            
            if (currentIndex >= highIndex) {
                highIndex = currentIndex;
            }
            
            int lowDiffSum = B - currentValue;
            int lowTargetSum = currentSum + lowDiffSum;
            
            int highDiffSum = C - currentValue;
            int highTargetSum = currentSum + highDiffSum;
            
            //Search for suitable range
            while (lowIndex <A.count) {
                
                int lowSum = [[A objectAtIndex:lowIndex] intValue];
                int highSum = [[A objectAtIndex:highIndex] intValue];
                
                if ( lowSum < lowTargetSum) {
                    lowIndex++;
                }
                
                if (highIndex < A.count-1 && [[A objectAtIndex:highIndex+1] intValue] <= highTargetSum ) {
                    highIndex++;
                }
                
	               else if (lowSum >= lowTargetSum && (highSum <= highTargetSum || highIndex == A.count-1)) {
                       int solutionInRange = highIndex-lowIndex+1;
                       solution += solutionInRange;
                       break;
                   }
            }
        }
        
        currentIndex++;
        if (currentIndex < A.count) {
            currentValue = [[A objectAtIndex:currentIndex] intValue] - currentSum;
            currentSum = [[A objectAtIndex:currentIndex] intValue];
        }
        
    }
    
    return solution;
    
	   // int solution = 0;
    
	   // NSMutableDictionary *hash = [NSMutableDictionary new];
    
	   // int sum = 0;
	   // for (int i=0; i<A.count; i++) {
    
	   //     NSNumber *current = [A objectAtIndex:i];
	   //     sum += current.intValue;
    
	   //     [A replaceObjectAtIndex:i withObject:@(sum)];
    
	   //     NSNumber *hashValue = [hash objectForKey:@(sum)];
	   //     if (!hashValue) {
	   //         hashValue = @(0);
	   //     }
	   //     hashValue = @(hashValue.intValue+1);
	   //     [hash setObject:hashValue forKey:@(sum)];
    
	   // }
    
	   // for (int i=0; i<A.count; i++) {
    
	   //     int candidateSum = [[A objectAtIndex:i] intValue];
	   //     int candidate = 0;
    
	   //     if (i==0) {
	   //         candidate = [[A objectAtIndex:0] intValue];
	   //     }
	   //     else {
	   //         candidate = candidateSum - [[A objectAtIndex:(i-1)] intValue];
	   //     }
    
	   //     if (candidate > C) {
	   //         continue;
	   //     }
    
    
	   //     if (candidate <= C) {
	   //         for (int j=B; j<=C; j++) {
    
	   //             if (candidate <= j) {
	   //                 int diff = j-candidate;
    
	   //                 int searchValue = diff+candidateSum;
    
	   //                 NSNumber *hashValue = [hash objectForKey:@(searchValue)];
	   //                 solution += hashValue.intValue;
    
	   //            // NSArray *hashRow = [hash objectForKey:@(searchValue)];
	   //            // if (hashRow) {
	   //            //     for (int k=0; k<hashRow.count; k++) {
	   //            //         int hashRowValue = [[hashRow objectAtIndex:k] intValue];
    
	   //            //         if (hashRowValue >= i) {
	   //            //             solution++;
	   //            //         }
	   //            //     }
	   //            // }
	   //             }
    
	   //         }
    
    
    
	   //     }
    
    
	   // }
    
	   // return solution;
}
@end
