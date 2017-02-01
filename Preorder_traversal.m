//
//  Preorder_traversal.m
//  
//
//  Created by Developer on 2/1/17.
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
-(NSMutableArray *) preorderTraversal:(TreeNode *) A  {
    
    NSMutableArray *solution = [NSMutableArray new];
    NSMutableArray *queue = [NSMutableArray new];
    
    if (!A) {
        return @[];
    }
    
    [queue addObject:A];
    
    while (queue.count > 0) {
        
        TreeNode *current = [queue lastObject];
	       // printf("%d\n", current.val);
        [queue removeLastObject];
        
        [solution addObject:@(current.val)];
        
        //loas child of current into queue
        
        if (current.right) {
            //  printf("insert right= %d \n", current.right.val);
            [queue addObject:current.right];
        }
        
        if (current.left) {
	           // printf("insert left = %d \n", current.left.val);
            [queue addObject:current.left];
        }
    }
    
    return solution;
}
@end
