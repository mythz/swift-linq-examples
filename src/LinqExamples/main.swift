//
//  main.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

func runExamples(fns: (() -> ())[]) {
    for fn in fns {
        fn()
        println()
    }
    println()
}

runExamples(restrictions)
runExamples(projections)
runExamples(partitioning)
runExamples(ordering)
runExamples(grouping)
runExamples(setoperators)
runExamples(conversions)
runExamples(elementoperators)
runExamples(generationoperators)
runExamples(quantifiers)
runExamples(aggregateoperators)
runExamples(miscoperators)
runExamples(queryexecution)
runExamples(joinoperators)
