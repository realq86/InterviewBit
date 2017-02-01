//
//  Sorted_Insert_Position.m
//  
//
//  Created by Developer on 2/1/17.
//
// THIS IS JAVA CODE!!

public class Solution {
    public int searchInsert(ArrayList<Integer> a, int b) {
        
        long solution = -1;
        int p = 0;
        int pValue = 0;
        int start = 0;
        int end = a.size()-1;
        
        while (pValue != b) {
            
            int startValue = a.get(start);
            int endValue = a.get(end);
            
            if (startValue >= b) {
                solution = start;
                break;
            }
            if (endValue <= b) {
                solution = end+1;
                break;
            }
            
            if (start == end-1) {
                if (startValue <= b) {
                    solution = start+1;
                    break;
                }
            }
            
            p = ((end - start)/2 )+start;
            pValue = a.get(p);
            if (b<pValue) {
                end = p;
            }
            else if (pValue == b) {
                solution = p;
                // break;
            }
            else {
                start = p;
            }
        }
        
        return (int)solution;
    }
}
