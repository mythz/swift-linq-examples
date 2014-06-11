// 
//  restrictions.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let restrictions = [linq1, linq2, linq3, linq4, linq5]

func linq1(){
    let numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]
    let lowNums = numbers.find { $0 < 5}
    
    println("Numbers < 5:")
    lowNums.each(println)
}

func linq2(){
    let products = productsList()
    
    let soldOutProducts = products
        .find { $0.unitsInStock == 0 }
    
    println("Sold out products:")
    for p in soldOutProducts {
        println("\(p.productName) is sold out!")
    }
}

func linq3(){
    let products = productsList()
    
    let expensiveInStockProducts = products
        .find { p in p.unitsInStock > 0 && p.unitPrice > 3.00 }
    
    println("In-stock products that cost more than 3.00:")
    for p in expensiveInStockProducts {
        println("\(p.productName) is in stock and costs more than 3.00.")
    }
}

func linq4(){
    let customers = customersList()
    let waCustomers = customers
        .find { $0.region == "WA" }
    
    println("Customers from Washington and their orders:")
    for c in waCustomers {
        println("Customer \(c.customerId): \(c.companyName)")
        for o in c.orders {
            println("  Order \(o.orderId): \(o.orderDate)")
        }
    }
}

func linq5(){
    let digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    let shortDigits = digits.find { $0.length < $1 }
    
    println("Short digits:")
    for d in shortDigits {
        println("The word \(d) is shorter than its value.")
    }
}

