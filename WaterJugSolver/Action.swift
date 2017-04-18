//
//  Action.swift
//  WaterJugs
//
//  Created by Christopher Fonseka on 11/12/2016.
//  Copyright © 2016 ChristopherFonseka. All rights reserved.
//

import Foundation
import SearchTreeKit

typealias JugsNode = SearchNode<Jugs>

struct JugActions
{
    static func all() -> [(JugsNode) -> JugsNode?]
    {
        return [Actions.fillJugOne,
                Actions.fillJugTwo,
                Actions.emptyJugOne,
                Actions.emptyJugTwo,
                Actions.transferFromOneToTwo,
                Actions.transferFromTwoToOne]
    }
}

private struct Actions
{
    static func fillJugOne(jugs: JugsNode) -> JugsNode?
    {
        if (!jugs.value.one.isFull())
        {
            let newJugs = Jugs(jugs.value.one.fill(), jugs.value.two)
            let log     = jugs.log + "\nFill Jug One (\(newJugs.one.contents):\(newJugs.one.capacity),\(newJugs.two.contents):\(newJugs.two.capacity))"
            
            return JugsNode(newJugs, log: log)
        }
        return nil
    }

    static func fillJugTwo(jugs: JugsNode) -> JugsNode?
    {
        if (!jugs.value.one.isFull())
        {
            let newJugs = Jugs(jugs.value.one, jugs.value.two.fill())
            let log     = jugs.log + "\nFill Jug Two (\(newJugs.one.contents):\(newJugs.one.capacity),\(newJugs.two.contents):\(newJugs.two.capacity))"
            
            return JugsNode(newJugs, log: log)
        }
        return nil
    }

    static func emptyJugOne(jugs: JugsNode) -> JugsNode?
    {
        if (!jugs.value.one.isEmpty())
        {
            let newJugs = Jugs(jugs.value.one.empty(), jugs.value.two)
            let log     = jugs.log + "\nEmpty Jug One (\(newJugs.one.contents):\(newJugs.one.capacity),\(newJugs.two.contents):\(newJugs.two.capacity))"
            
            return JugsNode(newJugs, log: log)
        }
        return nil
    }

    static func emptyJugTwo (jugs: JugsNode) -> JugsNode?
    {
        if (!jugs.value.two.isEmpty())
        {
            let newJugs = Jugs(jugs.value.one, jugs.value.two.empty())
            let log     = jugs.log + "\nEmpty Jug Two (\(newJugs.one.contents):\(newJugs.one.capacity),\(newJugs.two.contents):\(newJugs.two.capacity))"
            
            return JugsNode(newJugs, log: log)
        }
        return nil
    }

    static func transferFromOneToTwo (jugs: JugsNode) -> JugsNode?
    {
        if (jugs.value.one.isEmpty() || jugs.value.two.isFull())
        {
            return nil
        }

        if (jugs.value.one.contents >= jugs.value.two.spaceAvailable)
        {
            let newJugs = Jugs(jugs.value.one.empty(amount: jugs.value.two.spaceAvailable), jugs.value.two.fill())
            let log     = jugs.log + "\nTransfer from one to two (\(newJugs.one.contents):\(newJugs.one.capacity),\(newJugs.two.contents):\(newJugs.two.capacity))"
            
            return JugsNode(newJugs, log: log)
        }
        else
        {
            let newJugs = Jugs(jugs.value.one.empty(), jugs.value.two.fill(amount: jugs.value.one.contents))
            let log     = jugs.log + "\nTransfer from one to two (\(newJugs.one.contents):\(newJugs.one.capacity),\(newJugs.two.contents):\(newJugs.two.capacity))"
            
            return JugsNode(newJugs, log: log)
        }
    }

    static func transferFromTwoToOne (jugs: JugsNode) -> JugsNode?
    {
        if (jugs.value.two.isEmpty() || jugs.value.one.isFull())
        {
            return nil
        }

        let swapped = swap(jugs)
        if let transferred = transferFromOneToTwo(jugs: swapped)
        {
            let swappedBack = swap(transferred)
            
            let newJugs     = swappedBack.value
            let log         = jugs.log + "\nTransfer from two to one (\(newJugs.one.contents):\(newJugs.one.capacity),\(newJugs.two.contents):\(newJugs.two.capacity))"
            
            return JugsNode(newJugs, log:log)
        }
        return nil
    }

    private static func swap (_ jugs: JugsNode) -> JugsNode
    {
        return JugsNode(Jugs(jugs.value.two, jugs.value.one))
    }
}
