//
//  Sum.m
//  FPDemo
//
//  Created by 林金星 on 17/4/3.
//  Copyright © 2017年 Pingan. All rights reserved.
//  分别是求a到b之间整数之和，平方和，立方和

#import "Sum.h"

typedef NSInteger(^FUN)(NSInteger);


FUN retSelf = ^(NSInteger a){ return a;};
FUN square = ^(NSInteger a){ return a*a;};
FUN cube = ^(NSInteger a){ return a*a*a;};

NSInteger sumInt(NSInteger a, NSInteger b){
    if (a > b) return 0;
    return (a + sumInt(a + 1, b));
}

NSInteger sumSquare(NSInteger a, NSInteger b){
    if (a > b) return 0;
    return (square(a) + sumSquare(a + 1, b));
}

NSInteger sumCube(NSInteger a, NSInteger b){
    if (a > b) return 0;
    return (cube(a) + sumCube(a + 1, b));
}







NSInteger sumWithFun(NSInteger(^fun)(NSInteger) , NSInteger a, NSInteger b){
    if (a > b) return 0;
    return (fun(a) + sumWithFun(fun, a + 1, b));
}


////// 柯里化

typedef NSInteger(^SumFromAToB)(NSInteger, NSInteger);

SumFromAToB sumFun(NSInteger(^fun)(NSInteger)){
    return ^(NSInteger a, NSInteger b){
        return sumWithFun(fun, a, b);
    };
}




void sampleSum(){
    NSInteger a = 10, b = 20;
    NSLog(@"%ld, %ld, %ld",
          sumWithFun(retSelf, a, b),
          sumWithFun(square, a, b),
          sumWithFun(cube, a, b)
          );
    
    SumFromAToB sumInt = sumFun(retSelf);
    SumFromAToB sumSqaure = sumFun(square);
    SumFromAToB sumCube = sumFun(cube);
    
    NSLog(@"%ld, %ld, %ld",
          sumInt(a, b),
          sumSqaure(a, b),
          sumCube(a, b)
          );
}






