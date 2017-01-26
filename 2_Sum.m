//
//  2_Sum.m
//  
//
//  Created by Developer on 1/26/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSMutableArray *) twoSum:(NSArray *) A :(NSInteger) B  {
    
    if (A.count <2) {
        return [NSArray new];
    }
    
    NSNumber *index1;
    NSNumber *index2;
    
    NSMutableDictionary *hash = [NSMutableDictionary new];
    
    for (int i=0; i<A.count; i++) {
        
        NSNumber *current = [A objectAtIndex:i];
        
        
        //Look in hash for k-current
        
        NSNumber *kLessB = @(B - current.intValue);
        NSNumber *indexOfKLessB = [self searchIndexOf:kLessB inHash:hash];
        
        if (indexOfKLessB) {
            index1 = @(indexOfKLessB.intValue+1);
            index2 = @(i+1);
            
            break;
        }
        [self hash:@(i) withKey:current intoHash:hash];
    }
	   
	   if (index1 && index2) {
           return @[index1, index2];
       }
	   
    return [NSArray new];
}

- (NSNumber *)searchIndexOf:(NSNumber *)key inHash:(NSMutableDictionary *)hash {
    
	   NSNumber *value = [hash objectForKey:key];
    
    return value;
}

- (void)hash:(NSNumber *)value withKey:(NSNumber *)key intoHash:(NSMutableDictionary *)hash {
    
    NSNumber *existingValue = [hash objectForKey:key];
	   
    if (existingValue == nil) {
        
        [hash setObject:value forKey:key];
    }
}


@end
