//
//  Swap_ListNodes_in_Pairs.m
//  
//
//  Created by Developer on 2/1/17.
//
// THIS IS JAVA CODE!

/**
 * Definition for singly-linked list.
 * class ListNode {
 *     public int val;
 *     public ListNode next;
 *     ListNode(int x) { val = x; next = null; }
 * }
 */
public class Solution {
    public ListNode swapPairs(ListNode a) {
        
        if (a == null || a.next == null) {
            return a;
        }
        
        ListNode front = a;
        ListNode back = a.next;
        
        while (back != null) {
            
            int temp = front.val;
            
            front.val = back.val;
            back.val = temp;
            
            if (back.next == null || back.next.next == null) {
                break;
            }
            
            front = back.next;
            back = back.next.next;
            
        }
        
        return a;
        
        
    }
}
