//
//  RevertTree.h
//  FPDemo
//
//  Created by 林金星 on 17/4/3.
//  Copyright © 2017年 Pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject
@property(strong) id value;
@property(strong) TreeNode* left;
@property(strong) TreeNode* right;
+ (instancetype)treeNodeWithVaule:(id)value
                             left:(TreeNode*) left
                            right:(TreeNode*) right;
@end

TreeNode* RevertTree(TreeNode* root);

//@interface RevertTree : NSObject
//
//@end



