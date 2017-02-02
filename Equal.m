//
//  Equal.m
//  
//
//  Created by Developer on 2/1/17.
//
//

#import <Foundation/Foundation.h>
@implementation Solution
-(NSMutableArray *) equal:(NSMutableArray *) A  {
    
    NSMutableDictionary *hash = [NSMutableDictionary new];
    
    int i=0;
    while (i<A.count) { //hash A into key:Array
        
        NSNumber *current = [A objectAtIndex:i];
        
        NSArray *array = [hash objectForKey:current];
	       // NSNumber *index = [hash objectForKey:current];
        if (!array) {
            array = [NSMutableArray new];
        }
        [array addObject:@(i)];
        
        [hash setObject:array forKey:current];
        i++;
    }
    
    //test for hash
	   // NSNumber *test = [[hash objectForKey:@(3)] objectAtIndex:0];
    
    //     return @[test];
    
    int j=0;
    int k = 0;
    int l = 0;
    int cIndex = 0;
    while (j<A.count) {
        
        k=j+1;
        while (k < A.count) {
            
            l = j+1;
            while (l < A.count) {
                if (l != k) {
                    
                    int a = [[A objectAtIndex:j] intValue];
                    int b = [[A objectAtIndex:k] intValue];
                    int c = [[A objectAtIndex:l] intValue];
                    
                    NSNumber *target = @(a+b-c);
                    
                    NSArray *array = [hash objectForKey:target];
                    
                    if (array) {
                        
                        int m = 0;
                        while (m<array.count) {
                            int temp = [[array objectAtIndex:m] intValue];
                            cIndex = 0;
                            if (temp > l && temp != k) {
                                cIndex = temp;
                                NSArray *solution = @[@(j), @(k), @(l), @(cIndex)];
                                return solution;
                            }
                            m++;
                        }
                    }
                }
                l++;
            }
            k++;
        }
        j++;
    }
    
    return @[];
}
@end




// O(n^2) time O(n^2)space attempt
// @implementation Solution
// 	-(NSMutableArray *) equal:(NSMutableArray *) A  {

//     NSMutableArray *array = [NSMutableArray new];


// 	int i=0;
// 	while (i<A.count) {
// 	    NSMutableDictionary *hash = [NSMutableDictionary new];


// 	    i++;
// 	}




// 	return A;
// 	}
// @end
