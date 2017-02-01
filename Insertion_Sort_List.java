//
//  Insertion_Sort_List.m
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
    public ListNode insertionSortList(ListNode a) {
        
        if (a == null) {
            return a;
        }
        
        ListNode sortedList = a;
        
        ListNode beforeCurrent = a;
        
        while (beforeCurrent.next != null) {
            
            if (beforeCurrent.val <= beforeCurrent.next.val) {
                beforeCurrent = beforeCurrent.next;
                continue;
            }
            
            ListNode temp = beforeCurrent.next;
            beforeCurrent.next = beforeCurrent.next.next;
            temp.next = null;
            
            sortedList = this.insert(temp, sortedList, beforeCurrent);
            
        }
        
        return sortedList;
    }
    
    public ListNode insert(ListNode node, ListNode list, ListNode end) {
        
        if (list.val >= node.val) {
            
            node.next = list;
            list = node;
            
            return list;
        }
        
        if (end.val <= node.val) {
            
            node.next = end.next;
            end.next = node;
            
            return list;
        }
        
        ListNode current = list;
        while (current != end.next) {
            
            if (current.next == null) {
                
                current.next = node;
                break;
            }
            
            else if (current.val <= node.val && node.val <= current.next.val) {
                
                //insert behind current
                node.next = current.next;
                current.next = node;
                break;
            }
            
            current = current.next;
        }
        
        return list;
    }
}
