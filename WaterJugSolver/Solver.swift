//
//  Solver.swift
//  WaterJugSolver
//
//  Created by Christopher Fonseka on 18/04/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation
import SearchTreeKit

struct Sovler
{
    static func run()
    {
        print("Start")
        
        let start   = JugsNode(Jugs(3, 5))
        let actions = JugActions.all()
        
        guard let result = SearchTreeKit.breadthFirstSearch(start: start, actions: actions, end: end(4))
            else { print("Could not find solution"); return }
        
        print("SUCCESS!")
        print(result.log)
    }
    
    private static func end (_ litres: Int) -> (JugsNode) -> SearchTreeKit.Result
    {
        return { (jugs: JugsNode) -> SearchTreeKit.Result in
            
//            print("NEW EVALUATION")
//            print(jugs.log)
//            print("\n")
            
            if jugs.value.one.contents == litres { return .Pass }
            if jugs.value.two.contents == litres { return .Pass }
            
            return .Continue
        }
    }
}
