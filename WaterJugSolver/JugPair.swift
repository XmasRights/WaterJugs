//
//  JugPair.swift
//  WaterJugSolver
//
//  Created by Christopher Fonseka on 18/04/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation
import SearchTreeKit

struct JugPair
{
    let one: Jug
    let two: Jug
    
    init(_ jugOneSize: Int, _ jugTwoSize: Int)
    {
        self.one = Jug(contents: 0, capacity: oneSize)
        self.two = Jug(contents: 0, capacity: twoSize)
    }
}

extension JugPair: Equatable
{
    static func ==(lhs: JugPair, rhs: JugPair) -> Bool
    {
        return (lhs.one == rhs.one) && (lhs.two == rhs.two)
    }
}
