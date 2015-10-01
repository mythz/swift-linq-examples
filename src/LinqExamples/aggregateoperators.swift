//
//  aggregateoperators.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
// 

import Foundation

let aggregateoperators = [
    linq73, linq74, linq76, linq77, linq78, linq79, linq80, linq81, linq82, linq83,
    linq84, linq85, linq86, linq87, linq88, linq89, linq90, linq91, linq92, linq93
]

func linq73(){
    let factorsOf300 = [ 2, 2, 3, 5, 5 ]
    
    let uniqueFactors = distinct(factorsOf300).count
    
    print("There are \(uniqueFactors) unique factors of 300.")
}

func linq74(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let oddNumbers = numbers.filter { $0 % 2 == 1 }.count
    
    print("There are \(oddNumbers) odd numbers in the list.")
}

func linq76(){
    let customers = customersList()
    
    let orderCounts = customers
        .map { c -> (CustomerId:String, OrderCount:Int) in
            (c.customerId, c.orders.count)
    }
    
    orderCounts.forEach { print($0) }
}

func linq77(){
    let products = productsList()
    
    let categoryCounts = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String,ProductCount:Int) in
            (g.key, g.items.count)
    }
    
    categoryCounts.forEach { print($0) }
}

func linq78(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let numSum:Int = numbers.sum()
    
    print("The sum of the numbers is \(numSum).")
}

func linq79(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let totalChars = words.sum { (s:String) in s.length }
    
    print("There are a total of \(totalChars) characters in these words.")
}

func linq80(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, TotalUnitsInStock:Int) in
            (g.key, g.items.sum { (p:Product) in p.unitsInStock })
    }
    
    categories.forEach { print($0) }
}

func linq81(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let minNum = numbers.minElement()!
    
    print("The minimum number is \(minNum).")
}

func linq82(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let shortestWord = words.minElement { (s:String) in s.length }
    
    print("The shortest word is \(shortestWord) characters long.")
}

func linq83(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product)in p.category }
        .map { g -> (Category:String, CheapestPrice:Double) in
            (g.key, g.items.map { (p:Product) in p.unitPrice }.minElement()! )
    }
    
    categories.forEach { print($0) }
}

func linq84(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, CheapestProducts:[Product]) in
            let minPrice:Double = g.items.minElement { (p:Product) in p.unitPrice }
            return (g.key, g.items.filter { $0.unitPrice == minPrice })
    }
    
    categories.forEach {
        print("\($0.Category): ")
        $0.CheapestProducts.forEach { print($0) }
    }
}

func linq85(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let maxNum = numbers.maxElement()!
    
    print("The maximum number is \(maxNum).")
}

func linq86(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let longestLength:Int = words.map { (s:String) in s.length }.maxElement()!
    
    print("The longest word is \(longestLength) characters long.")
}

func linq87(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, MostExpensivePrice:Double) in
            (g.key, g.items.maxElement { (p:Product) in p.unitPrice } )
    }
    
    for c in categories {
        print("Category: \(c.Category), MaximumPrice: \(c.MostExpensivePrice)")
    }
}

func linq88(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, MostExpensiveProducts:[Product]) in
            let maxPrice:Double = g.items.maxElement { (p:Product) in p.unitPrice }
            return (g.key, g.items.filter { $0.unitPrice == maxPrice })
    }
    
    categories.forEach {
        print("\($0.Category): ")
        $0.MostExpensiveProducts.forEach { print($0) }
    }
}

func linq89(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let averageNum = numbers.avg { $0 as Int }
    
    print("The average number is \(averageNum).")
}

func linq90(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let averageLength = words.map { $0.length }.avg { $0 as Int }
    
    print("The average word length is \(averageLength) characters.")
}

func linq91(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, AveragePrice:Double) in
            (g.key, g.items.avg { (p:Product) in p.unitPrice } )
    }
    
    for c in categories {
        print("Category: \(c.Category), AveragePrice: \(c.AveragePrice)")
    }
}

func linq92(){
    let doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]
    
    let product = doubles.reduce(1) { runningProduct, nextFactor in runningProduct * nextFactor }
    
    print("Total product of all numbers: \(product)")
}

func linq93(){
    let startBalance = 100.0
    
    let attemptedWithdrawals = [ 20, 10, 40, 50, 10, 70, 30 ]
    
    let endBalance = attemptedWithdrawals.map { Double($0) }.reduce(startBalance) {
        balance, nextWithdrawal -> Double in
        (nextWithdrawal <= balance) ? (balance - nextWithdrawal) : balance
    }
    
    print("Ending balance: \(endBalance)")
}
