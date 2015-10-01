//
//  queryexecution.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/7/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
// 

import Foundation

let queryexecution = [linq99, linq100, linq101]

func linq99(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var i = 0
    let q = numbers.map { n in { ++i } }
    
    for f in q {
        let v = f()
        print("v = \(v), i = \(i)")
    }
}

func linq100(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var i = 0
    let q = numbers.map { n in ++i }
    
    for v in q {
        print("v = \(v), i = \(i)")
    }
}

func linq101(){
    var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let lowNumbers = { numbers.filter { $0 < 4 } }
    
    print("First run numbers <= 3:")
    lowNumbers().forEach { print($0) }
    
    for i in 0..<10 {
        numbers[i] = -numbers[i]
    }
    
    print("Second run numbers <= 3:")
    lowNumbers().forEach { print($0) }
}
