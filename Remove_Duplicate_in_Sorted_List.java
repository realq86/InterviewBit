//
//  Remove_Duplicate_in_Sorted_List.java
//  
//
//  Created by Developer on 2/1/17.
//
//  THIS IS JAVA CODE!!

/**
 * Definition for singly-linked list.
 * class ListNode {
 *     public int val;
 *     public ListNode next;
 *     ListNode(int x) { val = x; next = null; }
 * }
 */
public class Solution {
    public ListNode deleteDuplicates(ListNode a) {
        
        ListNode current = a;
        ListNode runner = a;
        
        while (runner != null) {
            
            if (current.val == runner.val) {
                
                runner = runner.next;
            }
            else {
                
                current.next = runner;
                
                current = runner;
            }
            
            if (runner == null) {
                
                current.next = runner;
            }
        }
        
        
        return a;
    }
}
