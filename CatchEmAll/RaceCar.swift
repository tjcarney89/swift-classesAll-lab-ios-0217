//
//  RaceCar.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class RaceCar: Car {
    let driver: String
    var sponsors: [String]

    override var speedInterval: Double {
        return maxSpeed * 0.2
    }

    var driftReduction: Double {
        return speed * 0.75
    }

    init(name: String, weight: Double, maxSpeed: Double, transmission: Transmission, cylinders: Int, milesPerGallon: Double, driver: String, sponsors: [String]) {
        self.driver = driver
        self.sponsors = sponsors
        super.init(name: name, weight: weight, maxSpeed: maxSpeed, transmission: transmission, cylinders: cylinders, milesPerGallon: milesPerGallon)
    }

    func driftRight() {
        driftBy(90.0)
    }

    func driftLeft() {
        driftBy(-90.0)
    }

    func driftBy(degrees: Double) {
        guard speed > 0.0 else { return }
        heading += degrees
        speed = driftReduction
    }
}
