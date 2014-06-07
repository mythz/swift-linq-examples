//
//  queryexecution.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/7/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let queryexecution = [linq101]

func linq99(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var i = 0;
    let q = numbers.map { n in { ++i } }
    
    for f in q {
        let v = f()
        println("v = \(v), i = \(i)")
    }
}

func linq100(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var i = 0;
    var q = numbers.map { n in ++i }
    
    for v in q {
        println("v = \(v), i = \(i)")
    }
}

func linq101(){
    var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    var lowNumbers = { numbers.find { $0 < 4 } }
    
    println("First run numbers <= 3:")
    lowNumbers().each(println)
    
    for i in 0..10 {
        numbers[i] = -numbers[i]
    }
    
    println("Second run numbers <= 3:")
    lowNumbers().each(println)
}
