//
//  Plane.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Plane: Vehicle{
    let maxAltitude: Double
    var altitude: Double = 0.0
    var inFlight: Bool {
        var response: Bool = false
        if speed > 0 && altitude > 0 {
            response = true
        }
        return response
    }

    init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }

    func takeOff() {
        if inFlight == false {
            speed = maxSpeed/10
            altitude = maxAltitude/10
        }
    }
    
    func land() {
        speed = 0
        altitude = 0
    }
    
    func climb() {
        if inFlight == true && (altitude + maxAltitude/10) <= maxAltitude {
            altitude += maxAltitude/10
            decelerate()
        } else if inFlight == true {
            altitude = maxAltitude
            decelerate()
        }
    }
    
    func dive() {
        if altitude != 0 && altitude - maxAltitude/10 >= 0 {
            altitude -= maxAltitude/10
            accelerate()
        } else if altitude != 0 {
            altitude = 0
            accelerate()
        }
    }
    
    func bankRight() {
        if inFlight == true {
            heading += 45
            heading = heading.truncatingRemainder(dividingBy: 360)
            speed -= speed/10
        }
    }
    
    func bankLeft() {
        if inFlight == true {
            heading -= 45
            speed -= speed/10
            if heading < 0 {
                heading *= -1
                heading = 360 - heading.truncatingRemainder(dividingBy: 360)
            }
            
        }
    }

}
