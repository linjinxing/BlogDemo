//
//  SumClass.h
//  FPDemo
//
//  Created by 林金星 on 17/4/4.
//  Copyright © 2017年 Pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

//@protocol SumBaseFun <NSObject>
//+ (
//@end

@interface SumClass : NSObject
- (NSInteger)baseFun:(NSInteger)a;
- (NSInteger)sum:(NSInteger)a b:(NSInteger)b;
@end

@interface SumSquareClass : SumClass
@end


@interface SumCubeClass : SumClass
@end




