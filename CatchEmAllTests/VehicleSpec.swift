//
//  VehicleSpec.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Quick
import Nimble
@testable import CatchEmAll

class VehicleSpec: QuickSpec {
    override func spec() {
        describe("Vehicle") {
            var vehicle = Vehicle(name: "Vehicle", weight: 1000.0, maxSpeed: 50.0)

            beforeEach {
                vehicle = Vehicle(name: "Vehicle", weight: 1000.0, maxSpeed: 50.0)
            }

            describe("initializer") {
                it("sets properties") {
                    expect(vehicle.name).to(equal("Vehicle"))
                    expect(vehicle.weight).to(beCloseTo(1000.0))
                    expect(vehicle.maxSpeed).to(beCloseTo(50.0))
                    expect(vehicle.speed).to(beCloseTo(0.0))
                    expect(vehicle.heading).to(beCloseTo(0.0))
                }
            }

            describe("goFast") {
                it("sets the current speed to the maximum speed") {
                    vehicle.goFast()
                    expect(vehicle.speed).to(beCloseTo(vehicle.maxSpeed))
                }
            }

            describe("halt") {
                it("sets the current speed to 0") {
                    vehicle.halt()
                    expect(vehicle.speed).to(beCloseTo(0.0))
                }
            }

            describe("accelerate") {
                it("increases the speed by 1/10th of the maximum speed") {
                    vehicle.accelerate()
                    expect(vehicle.speed).to(beCloseTo(vehicle.maxSpeed / 10.0))
                }

                it("does not increase the speed beyond the maximum") {
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    vehicle.accelerate()
                    expect(vehicle.speed).to(beCloseTo(vehicle.maxSpeed))
                }
            }

            describe("decelerate") {
                it("decreases the speed by 1/10th of the maximum speed") {
                    vehicle.speed = 42.0
                    vehicle.decelerate()
                    expect(vehicle.speed).to(beCloseTo(42.0 - vehicle.maxSpeed / 10.0))
                }

                it("does not decelerate the vehicle below 0") {
                    vehicle.speed = 10.0
                    vehicle.decelerate()
                    vehicle.decelerate()
                    vehicle.decelerate()
                    expect(vehicle.speed).to(beCloseTo(0.0))
                }
            }

            describe("turnRight") {
                it("turns the vehicle right by 90 degrees and cuts the speed in half") {
                    vehicle.speed = 30.0
                    vehicle.turnRight()
                    expect(vehicle.heading).to(beCloseTo(90.0))
                    expect(vehicle.speed).to(beCloseTo(15.0))
                }

                it("does nothing to a stationary vehicle") {
                    vehicle.heading = 180.0
                    vehicle.turnRight()
                    expect(vehicle.heading).to(beCloseTo(180.0))
                }

                it("cannot turn past 360 degrees") {
                    vehicle.speed = vehicle.maxSpeed
                    vehicle.turnRight()
                    vehicle.turnRight()
                    vehicle.turnRight()
                    vehicle.turnRight()
                    vehicle.turnRight()
                    expect(vehicle.heading).to(beCloseTo(90.0))
                }
            }

            describe("turnLeft") {
                it("turns the vehicle left by 90 degrees and cuts the speed in half") {
                    vehicle.speed = 30.0
                    vehicle.turnLeft()
                    expect(vehicle.heading).to(beCloseTo(270.0))
                    expect(vehicle.speed).to(beCloseTo(15.0))
                }

                it("does nothing to a stationary vehicle") {
                    vehicle.heading = 180.0
                    vehicle.turnLeft()
                    expect(vehicle.heading).to(beCloseTo(180.0))
                }

                it("cannot turn past 0 degrees") {
                    vehicle.speed = vehicle.maxSpeed
                    vehicle.turnLeft()
                    vehicle.turnLeft()
                    vehicle.turnLeft()
                    vehicle.turnLeft()
                    vehicle.turnLeft()
                    expect(vehicle.heading).to(beCloseTo(270.0))
                }
            }
        }
    }
}
