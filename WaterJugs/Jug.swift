//
//  Jug.swift
//  WaterJugs
//
//  Created by Christopher Fonseka on 11/12/2016.
//  Copyright © 2016 ChristopherFonseka. All rights reserved.
//

import Foundation

struct Jug: CustomStringConvertible, Equatable
{
    let contents: Int
    let capacity: Int

    var description: String
    {
        return "\(contents)(\(capacity))"
    }

    init (_ size: Int)
    {
        precondition(size > 0)

        contents = 0
        capacity = size
    }

    init (contents cont: Int, capacity cap: Int)
    {
        precondition (cont <= cap)

        contents = cont
        capacity = cap
    }

    static func ==(lhs: Jug, rhs: Jug) -> Bool
    {
        return lhs.capacity == rhs.capacity
               && lhs.contents == rhs.contents
    }
}
