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
        if (!jugs.a.isFull())
        {
            return JugPair(jugs.a.fill(),  jugs.b)
        }
        return nil
    }

    static func fillJugTwo  (jugs: JugPair) -> JugPair?
    {
        if (!jugs.a.isFull())
        {
            return JugPair(jugs.a, jugs.b.fill())
        }
        return nil
    }

    static func emptyJugOne (jugs: JugPair) -> JugPair?
    {
        if (!jugs.a.isEmpty())
        {
            return JugPair(jugs.a.empty(), jugs.b)
        }
        return nil
    }

    static func emptyJugTwo (jugs: JugPair) -> JugPair?
    {
        if (!jugs.b.isEmpty())
        {
            return JugPair(jugs.a, jugs.b.empty())
        }
        return nil
    }

    static func transferFromOneToTwo (jugs: JugPair) -> JugPair?
    {
        if (jugs.a.isEmpty() || jugs.b.isFull())
        {
            return nil
        }

        if (jugs.a.contents >= jugs.b.spaceAvailable)
        {
            return JugPair(jugs.a.empty(amount: jugs.b.spaceAvailable), jugs.b.fill())
        }
        else
        {
            return JugPair(jugs.a.empty(), jugs.b.fill(amount: jugs.a.contents))
        }
    }

    static func transferFromTwoToOne (jugs: JugPair) -> JugPair?
    {
        if (jugs.b.isEmpty() || jugs.a.isFull())
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
        return JugPair(jugs.b, jugs.a)
    }
}
