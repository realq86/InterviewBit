//
//  Find_Duplicate_in_Array.m
//  
//
//  Created by Developer on 1/26/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSInteger) repeatedNumber:(NSArray *) A  {
    
    NSMutableDictionary *hash = [NSMutableDictionary new];
    
    int returnValue = -1;
    
    int arrayCount = A.count;
    for (int i=0; i<arrayCount; i++) {
        
        NSNumber *current = [A objectAtIndex:i];
        
        if ([hash objectForKey:current]) {
            
            returnValue = current.intValue;
            break;
        }
        else {
            
            [hash setObject:@(YES) forKey:current];
        }
    }
    
    NSLog(@"Found %d", returnValue);
    return returnValue;
}
@end
