//
//  RevertTree.m
//  FPDemo
//
//  Created by 林金星 on 17/4/3.
//  Copyright © 2017年 Pingan. All rights reserved.
//

#import "RevertTree.h"

@implementation TreeNode
+ (instancetype)treeNodeWithVaule:(id)value
                             left:(TreeNode*) left
                            right:(TreeNode*) right{
    TreeNode* tn = [[TreeNode alloc] init];
    tn.value = value;
    tn.left = left;
    tn.right = right;
    return tn;
}
@end


TreeNode* IPRevertTree(TreeNode* root){
    if (nil == root) {
        return nil;
    }
    if (root.left) {
        IPRevertTree(root.left);
    }
    if (root.right) {
        IPRevertTree(root.right);
    }
    TreeNode* tmp = root.left;
    root.left = root.right;
    root.right = tmp;
    return root;
}







TreeNode* FPRevertTree(TreeNode* root){
    if (nil == root) {
        return nil;
    }
    return [TreeNode treeNodeWithVaule:root.value
                                  left:FPRevertTree(root.right)
                                 right:FPRevertTree(root.left)];
}





