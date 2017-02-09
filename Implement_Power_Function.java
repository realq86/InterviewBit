//
//  Implement_Power_Function.m
//  
//
//  Created by Developer on 2/9/17.
//
//THIS IS JAVA CODE!

public class Solution {
    public int pow(int x, int n, int d) {
        
        if (x == 0) {
            return (0%d);
        }
        if (n == 0) {
            
            return (1%d);
        }
        
        if (x < 0) {
            x = x+d;
        }
        
        long longX = (long)x;
        long longN = (long)n;
        
        long solution = 1;
        while (longN>0) {
            
            longX = longX%d;
            
            
            if (longN%2!=0) {
                solution = (solution * longX)%d;
            }
            
            longX = longX*longX;
            longN = longN/2;
        }
        
        return (int)solution;
        
    }
    
    
    
    // 	public int powCustom(int x, int n, int d) {
    
    // 	     if (x == 0) {
    // 	        return (0%d);
    // 	    }
    // 	    if (n == 0) {
    // 	        return (1%d);
    // 	    }
    // 	    if (n==1) {
    // 	       	if (x<0) {
    // 	            return (d+x)%d;
    // 	        }
    // 	        return x%d;
    // 	    }
    // 	    if (n==2) {
    // 	        if (x<0) {
    // 	            return (x*x)%d;
    // 	        }
    // 	       // int pow2 = (x * x)%d;
    //         //     return pow2;
    // 	    }
    
    // 	    //check if needed split
    
    //         int newN = n/2;
    //         int newX = (x%d);
    
    //         if (n%2!=0) {
    //             newX = newX*(x%d);
    //         }
    
    //         newX = (newX*newX)%d;
    // 	    powCustom(newX*newX, newN, d);
    // 	}
    
    
    
}
