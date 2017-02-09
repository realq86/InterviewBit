//
//  Permutations.m
//  
//
//  Created by Developer on 2/9/17.
//
//

#import <Foundation/Foundation.h>
@implementation Solution
-(NSMutableArray *) permute:(NSMutableArray *) A  {
    
    
    NSMutableArray *permutations = [NSMutableArray new];
    if (A.count == 1) {
        NSMutableArray *permutation = [NSMutableArray new];
        [permutation addObject:[A objectAtIndex:0]];
        [permutations addObject:permutation];
        
        return permutations;
    }
    
    for (int i=0; i<A.count; i++) {
        
        NSMutableArray *nextList = [A mutableCopy];
        
        NSNumber *current = [nextList objectAtIndex:i];
        [nextList removeObjectAtIndex:i];
        NSMutableArray *suffixPermuations = [self permute:nextList];
        suffixPermuations = [self add:current to:suffixPermuations];
        [permutations addObjectsFromArray:suffixPermuations];
    }
    
    
    
    //Testing return
		  //  NSMutableArray *permutations = [NSMutableArray new];
	   // NSMutableArray *permutation = [NSMutableArray new];
	   // [permutation addObject:@(1)];
	   // 	    [permutation addObject:@(2)];
    
	   // [permutations addObject:permutation];
	   // 	    [permutations addObject:permutation];
    
    return permutations;
    
}

- (NSMutableArray *)add:(NSNumber *)number to:(NSMutableArray *)permutations {
    
    
    for (int j=0; j<permutations.count; j++) {
        NSMutableArray *currentPermutation = [permutations objectAtIndex:j];
        
        [currentPermutation addObject:number];
        
    }
    return permutations;
}

@end
