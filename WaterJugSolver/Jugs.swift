//
//  Jugs.swift
//  WaterJugSolver
//
//  Created by Christopher Fonseka on 18/04/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Jugs
{
    let one: Jug
    let two: Jug
    
    init(_ jugOneSize: Int, _ jugTwoSize: Int)
    {
        self.one = Jug(contents: 0, capacity: jugOneSize)
        self.two = Jug(contents: 0, capacity: jugTwoSize)
    }
    
    init (_ jugOne: Jug, _ jugTwo: Jug)
    {
        self.one = jugOne
        self.two = jugTwo
    }
}

extension Jugs: Equatable
{
    static func ==(lhs: Jugs, rhs: Jugs) -> Bool
    {
        return (lhs.one == rhs.one) && (lhs.two == rhs.two)
    }
}
