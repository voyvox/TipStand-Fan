//
//  Artist.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 2/1/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct Artist: Codable, Hashable {
    var id: UUID
    
    var name: String
    var profileAvatar: String
    
    var externalLinksRowOne: [ExternalLink]
    var externalLinksRowTwo: [ExternalLink]
    
    var bio: String
    
    var showRoster: [Showtime]?
    
}
