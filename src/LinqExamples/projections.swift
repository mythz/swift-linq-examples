//
//  projections.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let projections = [linq6, linq7, linq8, linq9, linq10, linq11, linq12, linq13, linq14, linq15, linq16, linq17, linq18, linq19]

func linq6(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let numsPlusOne = numbers.map { $0 + 1 }
    
    print("Numbers + 1:")
    numsPlusOne.forEach { print($0) }
}

func linq7(){
    let products = productsList()
    
    let productNames = products.map { $0.productName }
    
    print("Product Names:")
    productNames.forEach { print($0) }
}

func linq8(){
    let numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]
    let strings = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    let textNums = numbers.map { strings[$0] }
    
    print("Number strings:")
    textNums.forEach { print($0) }
}

func linq9(){
    let words = ["aPPLE", "BlUeBeRrY", "cHeRry"]
    
    let upperLowerWords = words.map { s -> (Upper: String, Lower:String) in
        (s.uppercaseString, s.lowercaseString)
    }
    
    for ul in upperLowerWords {
        print("Uppercase: \(ul.Upper), Lowercase: \(ul.Lower)")
    }
}

func linq10(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let digitOddEvens = numbers.map { i -> (Digit: String, Even:Bool) in
        (strings[i], (i % 2 == 0))
    }
    
    for d in digitOddEvens {
        print("The digit \(d.Digit) is " + (d.Even ? "even" : "odd") + ".")
    }
}

func linq11(){
    let products = productsList()
    
    let productInfos = products.map { p -> (ProductName: String, Category:String, Price:Double) in
        (p.productName, p.category, p.unitPrice)
    }
    
    print("Product Info:")
    for p in productInfos {
        print("\(p.ProductName) is in the category \(p.Category) and costs \(p.Price) per unit.")
    }
}

func linq12(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var index = 0
    let numsInPlace = numbers.map { i -> (Num: Int, InPlace:Bool) in
        (i, i == index++)
    }
    
    print("Number: In-place?")
    for n in numsInPlace {
        print("\(n.Num): \(n.InPlace)")
    }
}

func linq13(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let lowNums = numbers
        .filter { $0 < 5 }
        .map { digits[$0] }
    
    print("Numbers < 5:")
    lowNums.forEach { print($0) }
}

func linq14(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let pairs = numbersA.expand { a in
        numbersB
            .filter { b in a < b }
            .map { i -> (a: Int, b:Int) in (a, i) }
        }
    
    print("Pairs where a < b:")
    for pair in pairs {
        print("\(pair.a) is less than \(pair.b)")
    }
}

func linq15(){
    let customers = customersList()
    
    let orders = customers.expand { c in
        c.orders
            .filter { $0.total < 500 }
            .map { o -> (CustomerId: String, OrderId:Int, Total:Double) in
                (c.customerId, o.orderId, o.total)
            }
        }
    
    orders.forEach { print($0) }
}

func linq16(){
    let customers = customersList()
    
    let date = NSDate(year: 1998, month: 1, day: 1)
    let orders = customers.expand { c in
        c.orders
            .filter { $0.orderDate! >= date }
            .map { o -> (CustomerId: String, OrderId:Int, OrderDate:NSDate) in
                (c.customerId, o.orderId, o.orderDate!)
            }
        }
    
    orders.forEach { print($0) }
}

func linq17(){
    let customers = customersList()
    
    let orders = customers.expand { c in
        c.orders
            .filter { $0.total >= 2000 }
            .map { o -> (CustomerId: String, OrderId:Int, Total:Double) in
                (c.customerId, o.orderId, o.total)
            }
        }
    
    orders.forEach { print($0) }
}

func linq18(){
    let customers = customersList()
    
    let cutoffDate = NSDate(year: 1997, month: 1, day: 1)
    
    let orders = customers
        .filter { $0.region == "WA" }.expand { c in
            c.orders
                .filter { $0.orderDate! > cutoffDate }
                .map { o -> (CustomerId: String, OrderId:Int) in
                    (c.customerId, o.orderId)
                }
            }
    
    orders.forEach { print($0) }
}

func linq19(){
    let customers = customersList()
    
    var custIndex = 0
    let customerOrders = customers.expand { c -> [String]? in
        custIndex++
        return c.orders.map { "Customer #\(custIndex) has an order with OrderID \($0.orderId)" }
    }
    
    customerOrders.forEach { print($0) }
}


