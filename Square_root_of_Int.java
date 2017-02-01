//
//  Square_root_of_Int.m
//  
//
//  Created by Developer on 2/1/17.
//
//

//  THIS IS JAVA CODE!!!!

#import <Foundation/Foundation.h>


public class Solution {
    public int sqrt(int a) {
        
        if (a <= 1) {
            return a;
        }
        
        long start = 0;
        long end = a;
        long solution = 0;
        
        while (solution*solution != a) {
            // System.out.println("start= "+start+"end= "+end);
            if (start == end-1) {
                if (end*end < a){
                    solution = end;
                }
                else {
                    solution = start;
                }
                break;
            }
            
            long p = ((end - start)/2) + start;
            
            if ((p*p) < a) {
                
                start = p;
            }
            else if ((p*p) == a) {
                solution = p;
            }
            else {
                end = p;
            }
        }
        
        return (int)solution;
    }
}
