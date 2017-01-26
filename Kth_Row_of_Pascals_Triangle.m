//
//  Kth_Row_of_Pascals_Triangle.m
//  
//
//  Created by Developer on 1/26/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSMutableArray *) getRow:(NSInteger) A  {
    
    NSMutableArray *row = [NSMutableArray new];
    
    [row addObject:@(1)];
    if (A==0) {
        return row;
    }
    
    [row addObject:@(1)];
    if (A==1) {
        return row;
    }
    
    for (int i=2; i<A+1; i++) {
        
        NSMutableArray *nextRow = [NSMutableArray new];
        [nextRow addObject:@(1)];
        
        for (int j=1; j<i; j++) {
	           int currentAtLastRow = [[row objectAtIndex:j] intValue];
	           int previousAtLastRow = [[row objectAtIndex:j-1] intValue];
	           int newValue = currentAtLastRow + previousAtLastRow;
	           [nextRow addObject:@(newValue)];
        }
        
        [nextRow addObject:@(1)];
        
        row = nextRow;
    }
    
    return row;
}
@end
