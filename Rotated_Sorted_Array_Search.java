//
//  Rotated_Sorted_Array_Search.m
//  
//
//  Created by Developer on 2/9/17.
//
// THIS IS JAVA CODE

public class Solution {
    // DO NOT MODIFY THE LIST
    public int search(final List<Integer> a, int b) {
        
        if (a.size()==0) {
            return -1;
        }
        if (a.size()==1 ) {
            if (a.get(0) == b) {
                return 0;
            }
            else {
                return -1;
            }
        }
        
        
        int solution = customSearch(a, b, 0, a.size()-1);
        
        
        return solution;
    }
    
    public int customSearch(final List<Integer> a, int b, int startIndex, int endIndex) {
        
        int pivot = (endIndex+startIndex)/2;
        // System.out.println("pivot = "+pivot);
        if (a.get(pivot) == b) {
            return pivot;
        }
        
        if (startIndex == endIndex) {
            return -1;
        }
        
        int leftStart = startIndex;
        int leftEnd = pivot;
        
        int rightStart = pivot+1;
        int rightEnd = endIndex;
        
        int solution = -1;
        // int rotatedStart = leftStart;
        // int rotatedEnd = leftEnd;
        if (a.get(rightStart) > a.get(rightEnd)) { //right is rotated
            int leftStartValue = a.get(leftStart);
            int leftEndValue = a.get(leftEnd);
            
            if (leftStartValue <= b && b <= leftEndValue ) { //within left
                
                solution = customSearch(a, b, leftStart, leftEnd);
            }
            else {
                solution = customSearch(a, b, rightStart, rightEnd);
            }
        }
        else { //left is rotated
            int rightStartValue = a.get(rightStart);
            int rightEndValue = a.get(rightEnd);
            
            if (rightStartValue <= b && b <= rightEndValue ) { //within right
                solution = customSearch(a, b, rightStart, rightEnd);
            }
            else {
                solution = customSearch(a, b, leftStart, leftEnd);
            }
            
        }
        
        return solution;
    }
}
