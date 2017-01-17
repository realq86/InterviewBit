//
//  All_Unique_Permutations.m
//  
//
//  Created by Developer on 1/16/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSMutableArray *) permute:(NSMutableArray *) A  {
    return [self customPermuteOf:A];
}


-(NSMutableArray *) customPermuteOf:(NSMutableArray *) A {
    
    NSMutableArray *solutions = [NSMutableArray new];
    
    if (A.count == 0) {
        NSMutableArray *solution = [NSMutableArray new];
        
        [solutions addObject:solution];
        return solutions;
    }
    
    NSMutableDictionary *duplicateChecker = [NSMutableDictionary new];
    
    for (int i=0; i<A.count; i++) {
        
        NSMutableArray *temp = [A mutableCopy];
        
        NSNumber *current = [temp objectAtIndex:i];
        if ([duplicateChecker objectForKey:current]) {
            continue;
        }
        [duplicateChecker setObject:@(YES) forKey:current];
        
        [temp removeObjectAtIndex:i];
        
        NSMutableArray *subffixSolutions = [self customPermuteOf:temp];
        
        for (int j=0; j<subffixSolutions.count; j++) {
            
            NSMutableArray *eachSubffix = [subffixSolutions objectAtIndex:j];
            [eachSubffix insertObject:current atIndex:0];
        }
        
        [solutions addObjectsFromArray:subffixSolutions];
    }
    
    
    return solutions;
}
@end
