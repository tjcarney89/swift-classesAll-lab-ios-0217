//
//  Vehicle.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Vehicle {
    let name: String
    let weight: Double
    let maxSpeed: Double
    var speed: Double {
        didSet {
            if speed > maxSpeed {
                speed = maxSpeed
            }

            if speed < 0.0 {
                speed = 0.0
            }
        }
    }
    var heading: Double {
        didSet {
            while heading < 0.0 {
                heading += 360.0
            }

            while heading > 360.0 {
                heading -= 360.0
            }
        }
    }

    var speedInterval: Double {
        return maxSpeed * 0.1
    }

    init(name: String, weight: Double, maxSpeed: Double) {
        self.name = name
        self.weight = weight
        self.maxSpeed = maxSpeed
        self.speed = 0.0
        self.heading = 0.0
    }

    func goFast() {
        speed = maxSpeed
    }

    func halt() {
        speed = 0.0
    }

    func accelerate() {
        speed += speedInterval
    }

    func decelerate() {
        speed -= speedInterval
    }

    func turnRight() {
        guard speed > 0.0 else { return }
        heading += 90.0
        speed /= 2.0
    }

    func turnLeft() {
        guard speed > 0.0 else { return }
        heading -= 90.0
        speed /= 2.0
    }
}
