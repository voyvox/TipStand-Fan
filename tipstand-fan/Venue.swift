//
//  Venue.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 2/1/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct Venue: Codable, Hashable {
    var name: String
    var address: String
    var coordinatesLat: Double
    var coordinatesLong: Double
}
