//
//  Simple.m
//  FPDemo
//
//  Created by 林金星 on 17/4/3.
//  Copyright © 2017年 Pingan. All rights reserved.
//
#import <BlocksKit/BlocksKit.h>
#import "Simple.h"

//@implementation Simple
//
//@end


void Sample(){
    NSArray<NSNumber*>* ints = @[@1, @2, @3];
    for (int i = 0; i < ints.count; ++i) {
        NSLog(@"%@", ints[i]);
    }

    [ints bk_each:^(id obj) {
        NSLog(@"%@", obj);
    }];
    
    NSInteger sum = 0;
    for (int i = 0; i < ints.count; ++i) {
        sum += [ints[i] integerValue];
    }
    
    NSLog(@"sum:%@", @(sum));
    
    NSLog(@"sum:%@", @([ints bk_reduceInteger:0
                                    withBlock:^NSInteger(NSInteger result, id obj) {
                                        return result + [obj integerValue];
                                    }]));
}






