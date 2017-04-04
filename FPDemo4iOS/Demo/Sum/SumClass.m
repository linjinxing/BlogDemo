//
//  SumClass.m
//  FPDemo
//
//  Created by 林金星 on 17/4/4.
//  Copyright © 2017年 Pingan. All rights reserved.
//

#import "SumClass.h"

@implementation SumClass
- (NSInteger)baseFun:(NSInteger)a{
    return a;
}
- (NSInteger)sum:(NSInteger)a b:(NSInteger)b
{
    if (a > b) return 0;
    return ([self baseFun:a] + [self sum:a + 1 b:b]);
}
@end


@implementation SumSquareClass
+ (NSInteger)baseFun:(NSInteger)a{
    return a*a;
}
@end

@implementation SumCubeClass
+ (NSInteger)baseFun:(NSInteger)a{
    return a*a*a;
}
@end

void sumClassSample(){
    NSInteger a = 10, b = 20;
    SumClass* sum = [[SumClass alloc] init];
    SumClass* sumSquare = [[SumSquareClass alloc] init];
    SumClass* sumCube = [[SumCubeClass alloc] init];
    NSLog(@"%ld, %ld, %ld",
          [sum sum:a b:b],
          [sumSquare sum:a b:b],
          [sumCube sum:a b:b]
          );
}






