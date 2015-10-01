//
//  partitioning.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
// 

import Foundation

let partitioning = [linq20, linq21, linq22, linq23, linq24, linq25, linq26, linq27]

func linq20(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let first3Numbers = numbers[0...2]
    
    print("First 3 numbers:")
    first3Numbers.forEach { print($0) }
}

func linq21(){
    let customers = customersList()
    
    let first3WAOrders = customers
        .filter { $0.region == "WA" }
        .expand { c in c.orders
            .map { o -> (CustomerId: String, OrderId:Int, OrderDate:NSDate?) in
                (c.customerId, o.orderId, o.orderDate)
            }
        }
        .take(3)
    
    print("First 3 orders in WA:")
    first3WAOrders.forEach { print($0) }
}

func linq22(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let allButFirst4Numbers = numbers.skip(4)
    
    print("All but first 4 numbers:")
    allButFirst4Numbers.forEach { print($0) }
}

func linq23(){
    let customers = customersList()
    
    let waOrders = customers
        .filter { $0.region == "WA" }
        .expand { c in c.orders
            .map { o -> (CustomerId: String, OrderId:Int, OrderDate:NSDate?) in
                (c.customerId, o.orderId, o.orderDate)
            }
        }
    
    let allButFirst2Orders = waOrders.skip(2)
    
    print("All but first 2 orders in WA:")
    allButFirst2Orders.forEach { print($0) }
}

func linq24(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let firstNumbersLessThan6 = numbers.takeWhile { $0 < 6 }
    
    print("First numbers less than 6:")
    firstNumbersLessThan6.forEach { print($0) }
}

func linq25(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var index = 0
    let firstSmallNumbers = numbers.takeWhile { $0 >= index++ }
    
    print("First numbers not less than their position:")
    firstSmallNumbers.forEach { print($0) }
}

func linq26(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let allButFirst3Numbers = numbers.skipWhile { $0 % 3 != 0 }
    print("All elements starting from first element divisible by 3:")
    allButFirst3Numbers.forEach { print($0) }
}

func linq27(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var index = 0
    let laterNumbers = numbers.skipWhile { $0 >= index++ }
    
    print("All elements starting from first element less than its position:")
    laterNumbers.forEach { print($0) }
}


