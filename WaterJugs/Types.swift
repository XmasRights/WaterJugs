//
//  Types.swift
//  WaterJugs
//
//  Created by Christopher Fonseka on 11/12/2016.
//  Copyright © 2016 ChristopherFonseka. All rights reserved.
//

import Foundation

struct JugPair: Hashable
{
    let a : Jug
    let b : Jug

    init(_ one: Jug, _ two: Jug)
    {
        a = one
        b = two
    }

    static func ==(lhs: JugPair, rhs: JugPair) -> Bool
    {
        return lhs.a == rhs.a
                && lhs.b == rhs.b
    }

    var hashValue: Int
    {
        get {
            return "\(a),\(b)".hashValue
        }
    }
}

struct JugAction
{
    let action:      (JugPair) -> JugPair?
    let description: String
}
