//
//  Jug.swift
//  WaterJugSolver
//
//  Created by Christopher Fonseka on 18/04/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Jug
{
    let contents: Int
    let capacity: Int
}

extension Jug: Equatable
{
    static func ==(lhs: Jug, rhs: Jug) -> Bool
    {
        return (   lhs.contents == rhs.contents
                && lhs.capacity == rhs.capacity)
    }
}
