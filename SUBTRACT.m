//
//  SUBTRACT.m
//  
//
//  Created by Developer on 1/16/17.
//
//

#import <Foundation/Foundation.h>


/**
 * Definition for singly-linked list.
 * @interface ListNode: NSObject {
 *     NSInteger val;
 *     ListNode *next;
 * }
 * @end
 */
@implementation Solution
-(ListNode *) subtract:(ListNode *) A  {
    
    ListNode *midPoint = A;
    ListNode *runner = A;
    
    //Only 1 long
    if (A.next == nil) {
        return A;
    }
    
    
    
    //Find middle of the array
    while (runner.next.next != nil) {
        
        ListNode *temp = midPoint;
        midPoint = midPoint.next;
        runner = runner.next;
        runner = runner.next;
    }
    
    ListNode *endOfFront = midPoint;
    midPoint = midPoint.next;
    endOfFront.next = nil;
    
    //Reverse lower half
    ListNode *reversedBack = nil;
    while (midPoint != nil) {
        ListNode *temp = midPoint;
        midPoint = midPoint.next;
        
        temp.next = reversedBack;
        reversedBack = temp;
    }
    
    //Add reversedBack to front
    ListNode *frontPointer = A;
    ListNode *backPointer = reversedBack;
    while (backPointer != nil) {
        
        int valFront = frontPointer.val;
        int valBack = backPointer.val;
        
        frontPointer.val = valBack - valFront;
        
        frontPointer = frontPointer.next;
        backPointer = backPointer.next;
    }
    
    //Restore back
    midPoint = nil;
    while (reversedBack != nil) {
        
        ListNode *temp = reversedBack;
        reversedBack = reversedBack.next;
        
        temp.next = midPoint;
        midPoint = temp;
    }
    
    endOfFront.next = midPoint;
    
    return A;
    
    
    
    
}
@end
