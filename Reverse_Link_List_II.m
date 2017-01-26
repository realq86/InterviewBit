//
//  Reverse_Link_List_II.m
//  
//
//  Created by Developer on 1/26/17.
//
//

// THIS IS JAVA CODE NOT OBJECTIVE C!!!

/**
 * Definition for singly-linked list.
 * class ListNode {
 *     public int val;
 *     public ListNode next;
 *     ListNode(int x) { val = x; next = null; }
 * }
 */
public class Solution {
    public ListNode reverseBetween(ListNode a, int m, int n) {
        
        if (m == n) {
            return a;
        }
        
        ListNode sectionA = a;
        ListNode endOfA = a;
        ListNode sectionB = a;
        ListNode endOfB = a;
        
        for (int i=0; i<n-1; i++) {
            
            if (i < m-2) {
                endOfA = endOfA.next;
            }
            endOfB = endOfB.next;
        }
        if (m > 1) {
            sectionB = endOfA.next;
            endOfA.next = null;
        }
        else {
            sectionB = a;
        }
        
        
        ListNode sectionC = endOfB.next;
        endOfB.next = null;
        
        
        
        //reverse sectionB
        ListNode current = sectionB;
        ListNode reversedB = null;
        while (current != null) {
            
            ListNode temp = current;
            current = current.next;
            
            temp.next = reversedB;
            reversedB = temp;
        }
        
        endOfA.next = reversedB;
        sectionB.next = sectionC;
        
        if (m > 1) {
            
            return a;
        }
        
        return reversedB; 
    }
}
