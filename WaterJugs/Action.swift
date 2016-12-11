//
//  Action.swift
//  WaterJugs
//
//  Created by Christopher Fonseka on 11/12/2016.
//  Copyright © 2016 ChristopherFonseka. All rights reserved.
//

import Foundation

extension Jug
{
    func fill() -> Jug
    {
        return Jug(contents: self.capacity, capacity: self.capacity)
    }

    func fill (amount: Int) -> Jug
    {
        precondition (self.contents + amount <= self.capacity)
        return Jug(contents: self.contents + amount, capacity: self.capacity)
    }

    func empty() -> Jug
    {
        return Jug(contents: 0, capacity: self.capacity)
    }

    func empty(amount: Int) -> Jug
    {
        precondition (amount <= self.contents)
        return Jug(contents: self.contents - amount, capacity: self.capacity)
    }

    var spaceAvailable: Int
    {
        return self.capacity - self.contents
    }
}

struct Action
{
    static func fillJugOne  (jugs: JugPair) -> JugPair?
    {
        if (!jugs.0.isFull())
        {
            return (jugs.0.fill(),  jugs.1)
        }
        return nil
    }

    static func fillJugTwo  (jugs: JugPair) -> JugPair?
    {
        if (!jugs.1.isFull())
        {
            return (jugs.0, jugs.1.fill())
        }
        return nil
    }

    static func emptyJugOne (jugs: JugPair) -> JugPair?
    {
        if (!jugs.0.isEmpty())
        {
            return (jugs.0.empty(), jugs.1)
        }
        return nil
    }

    static func emptyJugTwo (jugs: JugPair) -> JugPair?
    {
        if (!jugs.1.isEmpty())
        {
            return (jugs.0, jugs.1.empty())
        }
        return nil
    }

    static func transferFromOneToTwo (jugs: JugPair) -> JugPair?
    {
        if (jugs.0.isEmpty() || jugs.1.isFull())
        {
            return nil
        }

        if (jugs.0.contents >= jugs.1.spaceAvailable)
        {
            return (jugs.0.empty(amount: jugs.1.spaceAvailable), jugs.1.fill())
        }
        else
        {
            return (jugs.0.empty(), jugs.1.fill(amount: jugs.0.contents))
        }
    }

    static func transferFromTwoToOne (jugs: JugPair) -> JugPair?
    {
        if (jugs.1.isEmpty() || jugs.0.isFull())
        {
            return nil
        }

        let swapped = swap(jugs)
        if let transferred = transferFromOneToTwo(jugs: swapped)
        {
            return swap(transferred)
        }
        return nil
    }

    static func getAllActions() -> [JugAction]
    {
        return [JugAction(action: fillJugOne,  description: "Fill Jug One"),
                JugAction(action: fillJugTwo,  description: "Fill Jug Two"),
                JugAction(action: emptyJugOne, description: "Empty Jug One"),
                JugAction(action: emptyJugTwo, description: "Empty Jug Two"),
                JugAction(action: transferFromOneToTwo, description: "Transfer from One to Two"),
                JugAction(action: transferFromTwoToOne, description: "Transfer from Two to One"),
        ]
    }

    private static func swap (_ jugs: JugPair) -> JugPair
    {
        return (jugs.1, jugs.0)
    }
}
