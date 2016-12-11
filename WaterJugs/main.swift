//
//  main.swift
//  WaterJugs
//
//  Created by Christopher Fonseka on 11/12/2016.
//  Copyright © 2016 ChristopherFonseka. All rights reserved.
//

import Foundation

let jugA = Jug(5)
let jugB = Jug(3)

var solver = JugSolver()

let result = solver.solve(jugs: JugPair(jugA, jugB), amountNeeded: 4)

print (result)


