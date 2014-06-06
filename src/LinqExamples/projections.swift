//
//  projections.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let projections  = [ linq6, linq7, linq8, linq9, linq10, linq11, linq12, linq13, linq14, linq15, linq16, linq17, linq18, linq19 ]

func linq7(){
    let products = productsList()
    
    let productNames = products.map { $0.productName }
    
    println("Product Names:")
    productNames.each(println)
}

func linq8(){
    let numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]
    let strings = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    let textNums = numbers.map { strings[$0] }
    
    println("Number strings:")
    textNums.each(println)
}

func linq9(){
    let words = ["aPPLE", "BlUeBeRrY", "cHeRry"]
    
    let upperLowerWords = words.map { s -> (Upper: String, Lower:String) in
        (s.uppercaseString, s.lowercaseString)
    }
    
    for ul in upperLowerWords {
        println("Uppercase: \(ul.Upper), Lowercase: \(ul.Lower)")
    }
}

func linq10(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let digitOddEvens = numbers.map { i -> (Digit: String, Even:Bool) in
        (strings[i], (i % 2 == 0))
    }
    
    for d in digitOddEvens {
        println("The digit \(d.Digit) is " + (d.Even ? "even" : "odd") + ".")
    }
}

func linq11(){
    let products = productsList()
    
    let productInfos = products.map { p -> (ProductName: String, Category:String, Price:Double) in
        (p.productName, p.category, p.unitPrice)
    }
    
    println("Product Info:")
    for p in productInfos {
        println("\(p.ProductName) is in the category \(p.Category) and costs \(p.Price) per unit.")
    }
}

func linq12(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var index = 0
    let numsInPlace = numbers.map { i -> (Num: Int, InPlace:Bool) in
        (i, i == index++)
    }
    
    println("Number: In-place?")
    for n in numsInPlace {
        println("\(n.Num): \(n.InPlace)")
    }
}

func linq13(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let lowNums = numbers
        .find { $0 < 5 }
        .map { digits[$0] }
    
    println("Numbers < 5:")
    lowNums.each(println)
}

func linq14(){
    var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    var numbersB = [ 1, 3, 5, 7, 8 ]
    
    var pairs = numbersA.expand { a in
        numbersB
            .find { b in a < b }
            .map { i -> (a: Int, b:Int) in (a, i) }
        }
    
    println("Pairs where a < b:")
    for pair in pairs {
        println("\(pair.a) is less than \(pair.b)")
    }
}

func linq15(){
    var customers = customersList()
    
    var orders = customers.expand { c in
        c.orders
            .find { $0.total < 500 }
            .map { o -> (CustomerId: String, OrderId:Int, Total:Double) in
                (c.customerId, o.orderId, o.total)
            }
        }
    
    orders.each(println)
}

func linq16(){
    var customers = customersList()
    
    var date = Date.New(year: 1998, month: 1, day: 1)
    var orders = customers.expand { c in
        c.orders
            .find { Date.isAfter($0.orderDate, other: date) }
            .map { o -> (CustomerId: String, OrderId:Int, OrderDate:NSDate?) in
                (c.customerId, o.orderId, o.orderDate)
            }
        }
    
    orders.each(println)
}

func linq17(){
    var customers = customersList()
    
    var orders = customers.expand { c in
        c.orders
            .find { $0.total >= 2000 }
            .map { o -> (CustomerId: String, OrderId:Int, Total:Double) in
                (c.customerId, o.orderId, o.total)
            }
        }
    
    orders.each(println)
}

func linq18(){
    var customers = customersList()
    
    var cutoffDate = Date.New(year: 1997, month: 1, day: 1)
    
    var orders = customers
        .find { $0.region == "WA" }.expand { c in
            c.orders
                .find { Date.isAfter($0.orderDate, other: cutoffDate) }
                .map { o -> (CustomerId: String, OrderId:Int, Total:Double) in
                    (c.customerId, o.orderId, o.total)
                }
            }
    
    orders.each(println)
}

func linq19(){
    var customers = customersList()
    
    var custIndex = 0
    var customerOrders = customers.expand { c in
        c.orders.map { "Customer #\(++custIndex) has an order with OrderID \($0.orderId)" }
    }
    
    customerOrders.each(println)
}


