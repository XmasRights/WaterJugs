//
//  Solver.swift
//  WaterJugs
//
//  Created by Christopher Fonseka on 11/12/2016.
//  Copyright © 2016 ChristopherFonseka. All rights reserved.
//

import Foundation

extension Jug
{
    func isEmpty() -> Bool { return self.contents == 0 }
    func isFull()  -> Bool { return self.contents == self.capacity }
}


struct JugSolver
{
    func solve (jugs: JugPair, amountNeeded: Int) -> String
    {
        var output = String()

        if (recursiveSolve(jugs: jugs, amountNeeded: amountNeeded, output: &output))
        {
            return output
        }
        return "Could not be solved"
    }

    private func recursiveSolve (jugs: JugPair, amountNeeded: Int, output: inout String) -> Bool
    {
        for jugAction in Action.getAllActions()
        {
            print("\(jugs.a),\(jugs.b) -> \(jugAction.description)")
            if let result = jugAction.action(jugs)
            {

                let beforeJugs = jugs.a.description   + "," + jugs.b.description
                let afterJugs  = result.a.description + "," + result.b.description

                output +=  beforeJugs + " -> " + jugAction.description + " -> " + afterJugs + "\n"

                print(" -> \(afterJugs)")

                if resultAchieved(jugs: result, amountNeeded: amountNeeded)
                {
                    print("FINISHED")
                    return true
                }
                else if abandonHope(jugs: result)
                {
                    print("DEAD END")
                }
                else
                {
                    print("again")
                    return recursiveSolve(jugs: result, amountNeeded: amountNeeded, output: &output)
                }
            }
            else
            {
                print(" -> INVALID ACTION")
            }
        }

        print("done")
        return false
    }

    private func resultAchieved(jugs: JugPair, amountNeeded: Int) -> Bool
    {
        return jugs.a.contents == amountNeeded || jugs.b.contents == amountNeeded
    }

    private func abandonHope(jugs: JugPair) -> Bool
    {
        return (jugs.a.isEmpty() && jugs.b.isEmpty()) ||
               (jugs.a.isFull()  && jugs.b.isFull())
    }

    var seenBefore = Set<JugPair>()
}
