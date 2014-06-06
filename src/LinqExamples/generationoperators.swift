//
//  generationoperators.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let generationoperators = [linq66]

func linq65(){
    Range(start:1,end:2).by(-1)
    var numbers = (100...150)
        .map { n -> (Number:Int, OddEven:String) in
            (n, n % 2 == 1 ? "odd" : "even")
        }
    
    for n in numbers {
        println("The number \(n.Number) is \(n.OddEven).")
    }
}

func linq66(){
    var numbers = Array(count:10, repeatedValue:7)
    
    numbers.each(println)
}
