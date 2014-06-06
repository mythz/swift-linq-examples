//
//  data.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation


class Product : Printable {
    var productId : Int
    var productName : String
    var category : String
    var unitPrice : Double
    var unitsInStock : Int
    
    init(id: Int, name: String, category: String, unitPrice: Double, unitsInStock: Int) {
        productId = id
        productName = name
        self.category = category
        self.unitPrice = unitPrice
        self.unitsInStock = unitsInStock
    }
    
    var description: String {
        return "[Product id:\(productId), " +
            "name:\(productName), " +
            "cat:\(category), " +
            "price:\(unitPrice), " +
            "inStock:\(unitsInStock)]"
    }
    
    class var type : Product {
        return Product(id: 0,name: "name",category: "category",unitPrice: 0.0, unitsInStock: 0)
    }
}

//Avoid repitition of naming properties
func newProduct(id: Int, name: String, category: String, unitPrice: Double, unitsInStock: Int) -> Product {
    return Product(id: id, name: name, category: category, unitPrice: unitPrice, unitsInStock: unitsInStock)
}

class Order : Printable
{
    var orderId: Int
    var orderDate: NSDate?
    var total: Double
    
    init(orderId: Int, orderDate: NSDate?, total: Double){
        self.orderId = orderId
        self.orderDate = orderDate
        self.total = total
    }
    
    var description: String {
        return "[Order id:\(orderId), total:\(total)]"
    }
}

class Customer : Printable
{
    var customerId: String
    var companyName: String
    var address: String
    var city: String
    var region: String?
    var postalCode: String?
    var country: String?
    var phone: String?
    var fax: String?
    var orders: Order[]
    
    init(customerId: String, companyName: String,
         address: String, city: String, region: String?, postalCode: String?, country: String?,
         phone: String?, fax: String?, orders: Order[])
    {
        self.customerId = customerId
        self.companyName = companyName
        self.address = address
        self.city = city
        self.region = region
        self.postalCode = postalCode
        self.country = country
        self.phone = phone
        self.fax = fax
        self.orders = orders
    }
    
    var description: String {
        return "[Customer id:\(customerId), name:\(companyName), orders:\(orders.count)]"
    }
}


func productsList() -> Product[] {
    var products = [
        newProduct(1, "Chai", "Beverages", 18.000, 39),
        newProduct(2, "Chang", "Beverages", 19.000, 17),
        newProduct(3, "Aniseed Syrup", "Condiments", 10.000, 13),
        newProduct(4, "Chef Anton's Cajun Seasoning", "Condiments", 22.000, 53),
        newProduct(5, "Chef Anton's Gumbo Mix", "Condiments", 21.350, 0),
        newProduct(6, "Grandma's Boysenberry Spread", "Condiments", 25.000, 120),
        newProduct(7, "Uncle Bob's Organic Dried Pears", "Produce", 30.000, 15),
        newProduct(8, "Northwoods Cranberry Sauce", "Condiments", 40.000, 6),
        newProduct(9, "Mishi Kobe Niku", "Meat/Poultry", 97.000, 29),
        newProduct(10, "Ikura", "Seafood", 31.000, 31),
        newProduct(11, "Queso Cabrales", "Dairy Products", 21.000, 22),
        newProduct(12, "Queso Manchego La Pastora", "Dairy Products", 38.000, 86),
        newProduct(13, "Konbu", "Seafood", 6.000, 24),
        newProduct(14, "Tofu", "Produce", 23.250, 35),
        newProduct(15, "Genen Shouyu", "Condiments", 15.500, 39),
        newProduct(16, "Pavlova", "Confections", 17.450, 29),
        newProduct(17, "Alice Mutton", "Meat/Poultry", 39.000, 0),
        newProduct(18, "Carnarvon Tigers", "Seafood", 62.500, 42),
        newProduct(19, "Teatime Chocolate Biscuits", "Confections", 9.200, 25),
        newProduct(20, "Sir Rodney's Marmalade", "Confections", 81.000, 40),
        newProduct(21, "Sir Rodney's Scones", "Confections", 10.000, 3),
        newProduct(22, "Gustaf's Knäckebröd", "Grains/Cereals", 21.000, 104),
        newProduct(23, "Tunnbröd", "Grains/Cereals", 9.000, 61),
        newProduct(24, "Guaraná Fantástica", "Beverages", 4.500, 20),
        newProduct(25, "NuNuCa Nuß-Nougat-Creme", "Confections", 14.000, 76),
        newProduct(26, "Gumbär Gummibärchen", "Confections", 31.230, 15),
        newProduct(27, "Schoggi Schokolade", "Confections", 43.900, 49),
        newProduct(28, "Rössle Sauerkraut", "Produce", 45.600, 26),
        newProduct(29, "Thüringer Rostbratwurst", "Meat/Poultry", 123.790, 0),
        newProduct(30, "Nord-Ost Matjeshering", "Seafood", 25.890, 10),
        newProduct(31, "Gorgonzola Telino", "Dairy Products", 12.500, 0),
        newProduct(32, "Mascarpone Fabioli", "Dairy Products", 32.000, 9),
        newProduct(33, "Geitost", "Dairy Products", 2.500, 112),
        newProduct(34, "Sasquatch Ale", "Beverages", 14.000, 111),
        newProduct(35, "Steeleye Stout", "Beverages", 18.000, 20),
        newProduct(36, "Inlagd Sill", "Seafood", 19.000, 112),
        newProduct(37, "Gravad lax", "Seafood", 26.000, 11),
        newProduct(38, "Côte de Blaye", "Beverages", 263.500, 17),
        newProduct(39, "Chartreuse verte", "Beverages", 18.000, 69),
        newProduct(40, "Boston Crab Meat", "Seafood", 18.400, 123),
        newProduct(41, "Jack's New England Clam Chowder", "Seafood", 9.650, 85),
        newProduct(42, "Singaporean Hokkien Fried Mee", "Grains/Cereals", 14.000, 26),
        newProduct(43, "Ipoh Coffee", "Beverages", 46.000, 17),
        newProduct(44, "Gula Malacca", "Condiments", 19.450, 27),
        newProduct(45, "Rogede sild", "Seafood", 9.500, 5),
        newProduct(46, "Spegesild", "Seafood", 12.000, 95),
        newProduct(47, "Zaanse koeken", "Confections", 9.500, 36),
        newProduct(48, "Chocolade", "Confections", 12.750, 15),
        newProduct(49, "Maxilaku", "Confections", 20.000, 10),
        newProduct(50, "Valkoinen suklaa", "Confections", 16.250, 65),
        newProduct(51, "Manjimup Dried Apples", "Produce", 53.000, 20),
        newProduct(52, "Filo Mix", "Grains/Cereals", 7.000, 38),
        newProduct(53, "Perth Pasties", "Meat/Poultry", 32.800, 0),
        newProduct(54, "Tourtière", "Meat/Poultry", 7.450, 21),
        newProduct(55, "Pâté chinois", "Meat/Poultry", 24.000, 115),
        newProduct(56, "Gnocchi di nonna Alice", "Grains/Cereals", 38.000, 21),
        newProduct(57, "Ravioli Angelo", "Grains/Cereals", 19.500, 36),
        newProduct(58, "Escargots de Bourgogne", "Seafood", 13.250, 62),
        newProduct(59, "Raclette Courdavault", "Dairy Products", 55.000, 79),
        newProduct(60, "Camembert Pierrot", "Dairy Products", 34.000, 19),
        newProduct(61, "Sirop d'érable", "Condiments", 28.500, 113),
        newProduct(62, "Tarte au sucre", "Confections", 49.300, 17),
        newProduct(63, "Vegie-spread", "Condiments", 43.900, 24),
        newProduct(64, "Wimmers gute Semmelknödel", "Grains/Cereals", 33.250, 22),
        newProduct(65, "Louisiana Fiery Hot Pepper Sauce", "Condiments", 21.050, 76),
        newProduct(66, "Louisiana Hot Spiced Okra", "Condiments", 17.000, 4),
        newProduct(67, "Laughing Lumberjack Lager", "Beverages", 14.000, 52),
        newProduct(68, "Scottish Longbreads", "Confections", 12.500, 6),
        newProduct(69, "Gudbrandsdalsost", "Dairy Products", 36.000, 26),
        newProduct(70, "Outback Lager", "Beverages", 15.000, 15),
        newProduct(71, "Flotemysost", "Dairy Products", 21.500, 26),
        newProduct(72, "Mozzarella di Giovanni", "Dairy Products", 34.800, 14),
        newProduct(73, "Röd Kaviar", "Seafood", 15.000, 101),
        newProduct(74, "Longlife Tofu", "Produce", 10.000, 4),
        newProduct(75, "Rhönbräu Klosterbier", "Beverages", 7.750, 125),
        newProduct(76, "Lakkalikööri", "Beverages", 18.000, 57),
        newProduct(77, "Original Frankfurter grüne Soße", "Condiments", 13.000, 32)
    ]
    return products
}

var customers : Customer[]?

func customersList() -> Customer[] {
    if (customers) {
        return customers!
    }
    
    var files = NSFileManager.defaultManager()
    var jsonData = files.contentsAtPath(NSBundle.mainBundle().pathForResource("customers", ofType: "json"))
    var rawCustomers = NSJSONSerialization.JSONObjectWithData(jsonData, options:nil, error:nil) as NSDictionary
    var customersArray = rawCustomers["customers"] as NSArray
    let fmt = NSNumberFormatter()

    var to = Array<Customer>()
    for o : AnyObject in customersArray {
        var c = o as NSDictionary

        func str(key: String) -> String? {
            if let o : AnyObject? = c[key] {
                return String(o as NSString)
            }
            return nil
        }
        
        var dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone(name:"UTC")
        dateFmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" //1996-08-12T00:00:00

        func createOrders(orders: NSArray?) -> Order[] {
            var to = Order[]()
            if orders {
                for o: AnyObject in orders! {
                    var m = o as NSDictionary
                    var orderDate: NSDate?
                    if let dateStr : AnyObject = m["orderdate"] {
                        orderDate = dateFmt.dateFromString(dateStr as String)
                    }
                    to += Order(
                        orderId:fmt.numberFromString(m["id"] as String).integerValue,
                        orderDate:orderDate,
                        total:fmt.numberFromString(m["total"] as String).doubleValue)
                }
            }
            return to
        }
        
        to += Customer(
            customerId: str("id")!,
            companyName: str("name")!,
            address: str("address")!,
            city: str("city")!,
            region: str("region"),
            postalCode: str("postalCode"),
            country: str("country"),
            phone: str("phone"),
            fax: str("fax"),
            orders: createOrders((c["orders"]? as NSDictionary?)?["order"] as NSArray?)
        )
    }
    
    customers = to
    return to
}

