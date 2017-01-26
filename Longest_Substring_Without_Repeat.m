//
//  Longest_Substring_Without_Repeat.m
//  
//
//  Created by Developer on 1/26/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSInteger) lengthOfLongestSubstring:(NSMutableString *) A  {
    
    if (A.length < 2) {
        return A.length;
    }
    
    int maxLength = 0;
    
    NSInteger left = 0;
    NSInteger right = 0;
    NSInteger length = 0;
    NSMutableDictionary *hash = [NSMutableDictionary new];
    while (right < A.length) {
        
        NSString *character = [A substringWithRange:NSMakeRange(right, 1)];
        
        NSNumber *hasSeenIndex = [hash objectForKey:character];
        
        if (!hasSeenIndex) {
            
            [hash setObject:@(right) forKey:character];
            length = right - left +1;
        }
        else {
            
            length = right - left;
            
            
            
            while (left <= hasSeenIndex.intValue) {
                NSString *removeChar = [A substringWithRange:NSMakeRange(left, 1)];
                
                [hash removeObjectForKey:removeChar];
                
                left++;
            }
            
            [hash setObject:@(right) forKey:character];
        }
        
        if (length > maxLength) {
            maxLength = length;
        }
        right++;
    }
    
    return maxLength;
    
}
@end
