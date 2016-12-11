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
            if let result = jugAction.action(jugs)
            {
                let actionString = jugAction.description
                let jugString    = result.0.description + "," + result.1.description

                output += actionString + jugString + "\n"

                if resultAchieved(jugs: result, amountNeeded: amountNeeded)
                {
                    return true
                }
                else if abandonHope(jugs: result)
                {
                    return false
                }
                else
                {
                    return recursiveSolve(jugs: result, amountNeeded: amountNeeded, output: &output)
                }
            }
        }
        return false
    }

    private func resultAchieved(jugs: JugPair, amountNeeded: Int) -> Bool
    {
        return jugs.0.contents == amountNeeded || jugs.1.contents == amountNeeded
    }

    private func abandonHope(jugs: JugPair) -> Bool
    {
        return (jugs.0.isEmpty() && jugs.1.isEmpty()) ||
               (jugs.0.isFull()  && jugs.1.isFull())
    }
}
