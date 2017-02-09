//
//  Combinations.m
//  
//
//  Created by Developer on 2/9/17.
//
//

#import <Foundation/Foundation.h>
@implementation Solution
-(NSMutableArray *) combine:(NSInteger) A :(NSInteger) B  {
    
    
    return [self combine:A :B start:1];
}


-(NSMutableArray *) combine:(NSInteger) A :(NSInteger) B start:(NSInteger) start  {
    NSMutableArray *combines = [NSMutableArray new];
    
    if (B == 1) {
	       
	       for (int i=start; i<=A; i++) {
               NSMutableArray *current = [NSMutableArray new];
               [current addObject:@(i)];
               [combines addObject:current];
           }
	       return combines;
	       // NSMutableArray *combine = [NSMutableArray new];
	       // [combine addObject:@(start)];
        
	       // [combines addObject:combine];
	       // return combines;
    }
    
    for (int i=start; i<=A; i++) {
        
        NSMutableArray *combine = [self combine:A :(B-1) start:i+1];
        //add i
        combine = [self add:@(i) to:combine];
        [combines addObjectsFromArray:combine];
        
    }
    
    return combines;
}

- (NSMutableArray *) add:(NSNumber *)prefix to:(NSMutableArray *)combine {
    
    for (int i=0; i<combine.count; i++) {
        
        NSMutableArray *current = [combine objectAtIndex:i];
	       // [current addObject:prefix];
	       [current insertObject:prefix atIndex:0];
    }
    
    return combine;
}



@end
