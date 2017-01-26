//
//  Roman_To_Integer.m
//  
//
//  Created by Developer on 1/26/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSInteger) romanToInt:(NSMutableString *) A  {
    
    int currentIndex = A.length-1;
    int sum = 0;
    
    while (currentIndex >=0) {
        
        char current = [A characterAtIndex:currentIndex];
        
        if (current == 'I') {
            
            if (sum >= 5) {
                sum -= 1;
            }
            else {
                sum += 1;
            }
        }
        
        if (current == 'V') {
            sum += 5;
        }
        
        if (current == 'X') {
            
            if (sum >= 50) {
                sum -= 10;
            }
            else {
                sum += 10;
            }
        }
        
        if (current == 'L') {
            
            sum += 50;
        }
        
        if (current == 'C') {
            
            if (sum >= 500) {
                sum -= 100;
            }
            else {
                sum += 100;
            }
        }
        
        if (current == 'D') {
            
            sum += 500;
        }
        
        if (current == 'M') {
            
            sum += 1000;
        }
        
        currentIndex--;
    }
    
    return sum;
}
@end
