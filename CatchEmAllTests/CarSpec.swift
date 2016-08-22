//
//  CarSpec.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Quick
import Nimble
@testable import CatchEmAll

class CarSpec: QuickSpec {
    override func spec() {
        describe("Car") {
            var car = Car(name: "Car", weight: 4079.0, maxSpeed: 130.0, transmission: .Automatic, cylinders: 6, milesPerGallon: 24.0)

            beforeEach {
                car = Car(name: "Car", weight: 4079.0, maxSpeed: 130.0, transmission: .Automatic, cylinders: 6, milesPerGallon: 24.0)
            }

            describe("initializer") {
                it("sets the properties") {
                    expect(car.name).to(equal("Car"))
                    expect(car.weight).to(beCloseTo(4079.0))
                    expect(car.maxSpeed).to(beCloseTo(130.0))
                    expect(car.speed).to(beCloseTo(0.0))
                    expect(car.heading).to(beCloseTo(0.0))
                    expect(car.transmission).to(equal(Transmission.Automatic))
                    expect(car.cylinders).to(equal(6))
                    expect(car.milesPerGallon).to(equal(24.0))
                }
            }

            describe("drive") {
                it("accelerates the car") {
                    car.accelerate()
                    expect(car.speed).to(beCloseTo(car.maxSpeed / 10.0))
                }
            }

            describe("brake") {
                it("brakes the car") {
                    car.speed = 66.0
                    car.brake()
                    expect(car.speed).to(beCloseTo(66.0 - car.maxSpeed / 10.0))
                }
            }
        }
    }
}
