//
//  RaceCar.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Quick
import Nimble
@testable import CatchEmAll

class RaceCarSpec: QuickSpec {
    override func spec() {
        describe("RaceCar") {
            var car = RaceCar(name: "Race Car", weight: 1525.0, maxSpeed: 240.0, transmission: "Manual", cylinders: 6, milesPerGallon: 1.92, driver: "Driver McDriverson", sponsors: ["Flatiron School"])

            beforeEach {
                car = RaceCar(name: "Race Car", weight: 1525.0, maxSpeed: 240.0, transmission: "Manual", cylinders: 6, milesPerGallon: 1.92, driver: "Driver McDriverson", sponsors: ["Flatiron School"])
            }

            describe("initializer") {
                it("should set the properties") {
                    expect(car.name).to(equal("Race Car"))
                    expect(car.weight).to(beCloseTo(1525.0))
                    expect(car.maxSpeed).to(beCloseTo(240.0))
                    expect(car.speed).to(beCloseTo(0.0))
                    expect(car.heading).to(beCloseTo(0.0))
                    expect(car.transmission).to(equal("Manual"))
                    expect(car.cylinders).to(equal(6))
                    expect(car.milesPerGallon).to(beCloseTo(1.92))
                    expect(car.driver).to(equal("Driver McDriverson"))
                    expect(car.sponsors.count).to(equal(1))
                    expect(car.sponsors).to(contain("Flatiron School"))
                }
            }

            describe("accelerate") {
                it("increases the speed by 1/5th of the maximum speed") {
                    car.accelerate()
                    expect(car.speed).to(beCloseTo(car.maxSpeed / 5.0))
                }

                it("does not increase the speed beyond the maximum") {
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    car.accelerate()
                    expect(car.speed).to(beCloseTo(car.maxSpeed))
                }
            }

            describe("decelerate") {
                it("decreases the speed by 1/5th of the maximum speed") {
                    car.speed = 192.0
                    car.decelerate()
                    expect(car.speed).to(beCloseTo(192.0 - car.maxSpeed / 5.0))
                }

                it("does not decelerate the vehicle below 0") {
                    car.speed = 10.0
                    car.decelerate()
                    car.decelerate()
                    car.decelerate()
                    expect(car.speed).to(beCloseTo(0.0))
                }
            }

            describe("driftRight") {
                it("drifts the vehicle right by 90 degrees and cuts the speed by 1/4") {
                    car.speed = 120.0
                    car.driftRight()
                    expect(car.heading).to(beCloseTo(90.0))
                    expect(car.speed).to(beCloseTo(90.0))
                }

                it("does nothing to a stationary vehicle") {
                    car.heading = 180.0
                    car.driftRight()
                    expect(car.heading).to(beCloseTo(180.0))
                }

                it("cannot turn past 360 degrees") {
                    car.speed = car.maxSpeed
                    car.driftRight()
                    car.driftRight()
                    car.driftRight()
                    car.driftRight()
                    car.driftRight()
                    expect(car.heading).to(beCloseTo(90.0))
                }
            }

            describe("turnLeft") {
                it("drifts the vehicle left by 90 degrees and cuts the speed by 1/4") {
                    car.speed = 160.0
                    car.driftLeft()
                    expect(car.heading).to(beCloseTo(270.0))
                    expect(car.speed).to(beCloseTo(120.0))
                }

                it("does nothing to a stationary vehicle") {
                    car.heading = 180.0
                    car.driftLeft()
                    expect(car.heading).to(beCloseTo(180.0))
                }

                it("cannot drift past 0 degrees") {
                    car.speed = car.maxSpeed
                    car.driftLeft()
                    car.driftLeft()
                    car.driftLeft()
                    car.driftLeft()
                    car.driftLeft()
                    expect(car.heading).to(beCloseTo(270.0))
                }
            }
        }
    }
}
