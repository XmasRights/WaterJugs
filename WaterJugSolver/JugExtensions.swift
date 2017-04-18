//
//  JugExtensions.swift
//  WaterJugSolver
//
//  Created by Christopher Fonseka on 18/04/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

// MARK: Jug Inspectors
extension Jug
{
    func isFull() -> Bool
    {
        return contents == capacity
    }
    
    func isEmpty() -> Bool
    {
        return contents == 0
    }
}

// MARK: Jug Actions
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
