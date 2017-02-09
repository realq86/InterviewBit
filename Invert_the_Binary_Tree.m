//
//  Invert_the_Binary_Tree.m
//  
//
//  Created by Developer on 2/9/17.
//
//

#import <Foundation/Foundation.h>
/**
 * Definition for binary tree
 * @interface TreeNode: NSObject {
 *     NSInteger val;
 *     TreeNode *left;
 *     TreeNode *right;
 * }
 * @end
 */
@implementation Solution
-(TreeNode *) invertTree:(TreeNode *) A  {
    
    if (!A) {
        return nil;
    }
    
    [self invertTree:A.left];
    [self invertTree:A.right];
    
    TreeNode *temp = A.left;
    A.left = A.right;
    A.right = temp;
    
    return A;
}
@end
