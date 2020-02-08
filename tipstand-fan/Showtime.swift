//
//  Showtime.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 2/1/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct Showtime: Codable, Hashable {
    var venue: Venue
    var dateStart: String
    var dateEnd: String
    // dateStart & dateEnd /should/ be Date but for debugging purposes is String to match json representation. probably just need to initialize dateStart/End better from the json string.

}


