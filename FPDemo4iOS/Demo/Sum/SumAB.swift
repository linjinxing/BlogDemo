//
//  Sum.swift
//  FPDemo
//
//  Created by 林金星 on 17/4/3.
//  Copyright © 2017年 Pingan. All rights reserved.
//

import Foundation


typealias SumFromAToB = (Int32, Int32)->Int32

func createSumFunOfFromAToB(_ clojure:@escaping (Int32) -> Int32) -> SumFromAToB {
    func sum(_ a:Int32,_ b:Int32)->Int32{
        if (a > b){
            return 0;
        }
        return (clojure(a) + sum(a + 1, b));
    }
    return sum;
}

func sampleSumSwift(){
    let sumInt = createSumFunOfFromAToB({$0})
    let sumSqaure = createSumFunOfFromAToB({$0 * $0})
    let sumCube = createSumFunOfFromAToB({$0 * $0 * $0})
    let a:Int32 = 10
    let b:Int32 = 20
    print("\(sumInt(a, b)), \(sumSqaure(a, b)),\(sumCube(a, b))")
}

@objc public  class SampleSwift:NSObject {
    public static func run(){
        sampleSumSwift();
    }
}




