//
//  WhyCurry.m
//  FPDemo
//
//  Created by 林金星 on 17/4/4.
//  Copyright © 2017年 Pingan. All rights reserved.
//

#import "WhyCurry.h"

//@implementation WhyCurry
//
//@end


/**********************   字符串处理   *****************/

typedef NSString*(^StringBlock)(NSString*);

StringBlock ToUpperCase =  ^(NSString*str){
    return [str uppercaseString];
};

StringBlock Excailm = ^(NSString*str){
    return [str stringByAppendingString:@"!"];
};

////  可读性不好，让代码从右向左运行，而不是由内而外运行
StringBlock Shout = ^(NSString* str){
    return Excailm(ToUpperCase(str));
};

StringBlock StringFunCompose(StringBlock fun, ...){
    NSMutableArray *argsArray = [[NSMutableArray alloc] initWithObjects:fun, nil];
    va_list params;
    va_start(params, fun);
    NSString *arg;
    while( (arg = va_arg(params,NSString *)) )
    {
        if ( arg )
        {
            [argsArray addObject:arg];
        }
    }
    va_end(params);         //置空
    return ^(NSString* str){
        NSEnumerator *enumerator = [argsArray reverseObjectEnumerator];
        StringBlock block;
        while (block = [enumerator nextObject]) {
            str = block(str);
            NSLog(@"%@", str);
        }
        return str;
    };
}

/**********************   打折   *****************/

//typedef double (^DoubleBlock)(double);
//
//DoubleBlock Discount(double rate){
//    return ^(double money){
//        return money*rate;
//    };
//}
//
//double ShuoldPayMoney(DoubleBlock discount, double daijin){
//    
//}
//               
//DoubleBlock Discount = ^(double money){
//    return <#expression#>
//};

void sampleCurry(){
    NSLog(@"[sampleCurry]");
    NSLog(@"%@", Shout(@"Let's get started with FP"));
    NSLog(@"%@", StringFunCompose(Excailm, ToUpperCase)(@"Let's get started with FP"));
}








