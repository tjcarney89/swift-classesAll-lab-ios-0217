//
//  Jet.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Jet: Plane {
    override var altitudeInterval: Double {
        return maxAltitude / 5.0
    }

    override var megaSpeed: Double {
        return maxSpeed * 2.0
    }

    func afterburner() {
        guard inFlight else { return }
        guard speed == maxSpeed else { return }
        speed = maxSpeed * 2.0
    }
}
