//
//  Types.swift
//  WaterJugs
//
//  Created by Christopher Fonseka on 11/12/2016.
//  Copyright © 2016 ChristopherFonseka. All rights reserved.
//

import Foundation

typealias JugPair = (Jug, Jug)

struct JugAction
{
    let action:      (JugPair) -> JugPair
    let description: String
}
