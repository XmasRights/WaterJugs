//
//  ViewController.swift
//  WaterJugSolver
//
//  Created by Christopher Fonseka on 18/04/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Sovler.run()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

