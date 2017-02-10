//
//  Jet.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Jet: Plane {
    override func climb() {
        if inFlight == true && altitude + maxAltitude/5 <= maxAltitude {
            altitude += maxAltitude/5
            decelerate()
        } else if inFlight == true {
            altitude = maxAltitude
            decelerate()
        }
    }
    
    override func dive() {
        if altitude != 0 && altitude - maxAltitude/5 >= 0 {
            altitude -= maxAltitude/5
            accelerate()
        } else if altitude != 0 {
            altitude = 0
            accelerate()
        }
    }
    
    func afterburner() {
        if inFlight == true && speed == maxSpeed {
            speed = maxSpeed*2
        }
    }

}
