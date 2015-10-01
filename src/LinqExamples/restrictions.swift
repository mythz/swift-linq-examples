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
    let lowNums = numbers.filter { $0 < 5}
    
    print("Numbers < 5:")
    lowNums.forEach { print($0) }
}

func linq2(){
    let products = productsList()
    
    let soldOutProducts = products
        .filter { $0.unitsInStock == 0 }
    
    print("Sold out products:")
    for p in soldOutProducts {
        print("\(p.productName) is sold out!")
    }
}

func linq3(){
    let products = productsList()
    
    let expensiveInStockProducts = products
        .filter { p in p.unitsInStock > 0 && p.unitPrice > 3.00 }
    
    print("In-stock products that cost more than 3.00:")
    for p in expensiveInStockProducts {
        print("\(p.productName) is in stock and costs more than 3.00.")
    }
}

func linq4(){
    let customers = customersList()
    let waCustomers = customers
        .filter { $0.region == "WA" }
    
    print("Customers from Washington and their orders:")
    for c in waCustomers {
        print("Customer \(c.customerId): \(c.companyName)")
        for o in c.orders {
            print("  Order \(o.orderId): \(o.orderDate)")
        }
    }
}

func linq5(){
    let digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    let shortDigits = digits.filteri { $0.length < $1 }
    
    print("Short digits:")
    for d in shortDigits {
        print("The word \(d) is shorter than its value.")
    }
}

