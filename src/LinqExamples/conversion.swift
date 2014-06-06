//
//  conversion.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let conversions = [linq54]

func linq54(){
    var doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]
    
    var sortedDoubles = sort(doubles).reverse()
    
    var doublesArray = sortedDoubles
    
    println("Every other double from highest to lowest:")
    var d = 0
    while d < doublesArray.count {
        println(doublesArray[d])
        d += 2
    } 
}