//
//  extensions.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

//Reusable extensions used in examples

extension Array {
    func each(fn: (T) -> ()) {
        for i in self {
            fn(i)
        }
    }
    
    func find(fn: (T) -> Bool) -> T[] {
        var to = T[]()
        for x in self {
            let t = x as T
            if fn(t) {
                to += t
            }
        }
        return to
    }
    
    func find(fn: (T, Int) -> Bool) -> T[] {
        var to = T[]()
        var i = 0
        for x in self {
            let t = x as T
            if fn(t, i++) {
                to += t
            }
        }
        return to
    }
    
    func expand<TResult>(fn: (T) -> TResult[]?) -> TResult[] {
        var to = TResult[]()
        for x in self {
            if let result = fn(x as T) {
                for r in result {
                    to += r
                }
            }
        }
        return to
    }
    
    func take(count:Int) -> T[] {
        var to = T[]()
        var i = 0
        while i < self.count && i < count {
            to += self[i++]
        }
        return to
    }
    
    func skip(count:Int) -> T[] {
        var to = T[]()
        var i = count
        while i < self.count {
            to += self[i++]
        }
        return to
    }
    
    func takeWhile(fn: (T) -> Bool) -> T[] {
        var to = T[]()
        for x in self {
            let t = x as T
            if fn(t) {
                to += t
            }
            else {
                break
            }
        }
        return to
    }
    
    func skipWhile(fn: (T) -> Bool) -> T[] {
        var to = T[]()
        var keepSkipping = true
        for x in self {
            let t = x as T
            if !fn(t) {
                keepSkipping = false
            }
            if !keepSkipping {
                to += t
            }
        }
        return to
    }
    
    func firstWhere(fn: (T) -> Bool) -> T? {
        for x in self {
            if fn(x) {
                return x
            }
        }
        return nil
    }
    
    func firstWhere(fn: (T) -> Bool, orElse: () -> T) -> T {
        for x in self {
            if fn(x) {
                return x
            }
        }
        return orElse()
    }

    func sortBy(fns: ((T,T) -> Int)...) -> T[]
    {
        var items = self.copy()
        items.sort { x, y in
            for f in fns {
                let r = f(x,y)
                if r != 0 {
                    return r > 0
                }
            }
            return false
        }
        return items
    }
    
    func groupBy<Key : Hashable, Item>(fn:(Item) -> Key) -> Group<Key,Item>[] {
        return self.groupBy(fn, nil, nil)
    }

    func groupBy<Key : Hashable, Item>(fn:(Item) -> Key, matchWith:((Key,Key) -> Bool)?) -> Group<Key,Item>[] {
        return self.groupBy(fn, matchWith, nil)
    }
    
    func groupBy<Key : Hashable, Item>
    (
        fn:        (Item) -> Key,
        matchWith: ((Key,Key) -> Bool)?,
        valueAs:   (Item -> Item)?
    )
        -> Group<Key,Item>[]
    {
        var ret = Item[]()
        var map = Dictionary<Key, Group<Key,Item>>()
        for x in self {
            var e = x as Item
            var val = fn(e)

            var key = val as Key
            
            if matchWith {
                for k in map.keys {
                    if matchWith!(val, k) {
                        key = k
                        break
                    }
                }
            }
            
            if valueAs {
                e = valueAs!(e)
            }
            
            var group = map[key] ? map[key]! : Group<Key,Item>(key:key)
            group.append(e)
            map[key] = group //always copy back struct
        }
        
        return map.values.map { $0 as Group<Key,Item> }
    }

    func contains<T : Equatable>(x:T) -> Bool {
        return self.indexOf(x) != nil
    }
    
    func indexOf<T : Equatable>(x:T) -> Int? {
        for i in 0..self.count {
            if self[i] as T == x {
                return i
            }
        }
        return nil
    }
}

func distinct<T : Equatable>(this:T[]) -> T[] {
    return union(this)
}

func union<T : Equatable>(arrays:T[]...) -> T[] {
    return _union(arrays)
}

func _union<T : Equatable>(arrays:T[][]) -> T[] {
    var to = T[]()
    for arr in arrays {
        outer: for x in arr {
            var e = x as T
            for y in to {
                if y == e {
                    continue outer
                }
            }
            to += e
        }
    }
    return to
}

func intersection<T : Equatable>(arrays:T[]...) -> T[] {
    var all: T[] = _union(arrays)
    var to = T[]()
    
    for x in all {
        var count = 0
        var e = x as T
        outer: for arr in arrays {
            for y in arr {
                if y == e {
                    count++
                    continue outer
                }
            }
        }
        if count == arrays.count {
            to += e
        }
    }
    
    return to
}

func difference<T : Equatable>(from:T[], other:T[]...) -> T[] {
    var to = T[]()
    for arr in other {
        for x in from {
            if !arr.contains(x) && !to.contains(x) {
                to += x
            }
        }
    }
    return to
}

//Generic classes not supported yet? Crashes XCode
struct Group<Key,Item> : Sequence, Printable {
    var key: Key
    var items = Item[]()
    
    init(key:Key) {
        self.key = key
    }
    
    mutating func append(item: Item) {
        items.append(item)
    }
    
    func generate() -> IndexingGenerator<Item[]> {
        return items.generate()
    }
    
    var description: String {
    var s = ""
        for x in items {
            if s.length > 0 {
                s += ", "
            }
            s += "\(x)"
        }
        return "\(key): [\(s)]"
    }
}

func anagramComparer(a:String, b:String) -> Bool {
    let aChars = Array(a.nulTerminatedUTF8)
    let bChars = Array(b.nulTerminatedUTF8)
    sort(aChars)
    sort(bChars)
    return aChars == bChars
}

func caseInsensitiveComparer (a:String,b:String) -> Bool {
    return a.uppercaseString.compare(b.uppercaseString) < 0
}

func compareIgnoreCase (a:String,b:String) -> Int {
    return a.uppercaseString.compare(b.uppercaseString)
}

extension MapCollectionView {
    
    func map<T,U>(fn: (T) -> (U)) -> U[] {
        var to = U[]()
        for x in self {
            var e = x as U
            to.append(e)
        }
        return to
    }
}

//anagramEqualityComparer(a, b) =>
//    new String.fromCharCodes(orderBy(a.codeUnits.toList()))
//        .compareTo(new String.fromCharCodes(orderBy(b.codeUnits.toList())))

func compare<T : Comparable>(a:T, b:T) -> Int {
    return a == b
        ? 0
        : a > b ? -1 : 1
}

extension Slice {
    func each(fn: (T) -> ()) {
        for i in self {
            fn(i)
        }
    }
}

extension String {
    var length: Int { return countElements(self) }

    func contains(s:String) -> Bool {
        return (self as NSString).containsString(s)
    }
    
    func charAt(index:Int) -> String {
        let c = (self as NSString).characterAtIndex(index)
        let s = NSString(format:"%c",c)
        return s
    }
    
    func trim() -> String {
        return (self as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}

class Date {
    
    class func New(#year:Int, month:Int, day:Int) -> NSDate {
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        var gregorian = NSCalendar(identifier:NSGregorianCalendar)
        var date = gregorian.dateFromComponents(c)
        return date
    }
    
    class func isAfter(this:NSDate?, other:NSDate) -> Bool {
        if this == nil {
            return false
        }
        return this!.compare(other) == NSComparisonResult.OrderedDescending
    }
    
    class func components(this:NSDate) -> NSDateComponents {
        var compnents  = NSCalendar.currentCalendar().components(
            NSCalendarUnit.DayCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.YearCalendarUnit,
            fromDate: this)
        
        return compnents
    }
    
    class func getYear(this:NSDate) -> Int {
        return components(this).year
    }
    
    class func getMonth(this:NSDate) -> Int {
        return components(this).month
    }
    
    class func getDay(this:NSDate) -> Int {
        return components(this).day
    }
}

