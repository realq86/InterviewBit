/**
 * Definition for binary tree
 * @interface TreeNode: NSObject {
 *     NSInteger val;
 *     TreeNode *left;
 *     TreeNode *right;
 * }
 * @end
 */
//
//  Identical_Binary_Tree.m
//  
//
//  Created by Developer on 2/1/17.
//
//

#import <Foundation/Foundation.h>

@implementation Solution
-(NSInteger) isSameTree:(TreeNode *) A :(TreeNode *) B  {
    
    if (!A && !B) {
        return 1;
    }
    if ( (!A&&B) || (A&&!B) ) {
        return 0;
    }
    
    if (A.val != B.val) {
        return 0;
    }
    
    int left = [self isSameTree:A.left :B.left];
    int right = [self isSameTree:A.right :B.right];
    
    if (left && right) {
        return 1;
    }
    
    return 0;
}
@end
