//
//  Max_depth_of_binarytree.m
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
-(NSInteger) maxDepth:(TreeNode *) A  {
    
    if (!A) {
        return 0;
    }
    
    if (!A.left && !A.right) {
        return 1;
    }
    
    int leftLength = [self maxDepth:A.left];
    int rightLength = [self maxDepth:A.right];
    
    int solution = leftLength;
    if (leftLength < rightLength) {
        solution = rightLength;
    }
    
    
    return solution+1 ;
}
@end
