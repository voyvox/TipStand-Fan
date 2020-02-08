//
//  ArtistBioView.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 2/6/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct ArtistBioView: View {
    var artist: Artist
    
    var body: some View {
        Text(self.artist.bio)
        .lineSpacing(5)
        .lineLimit(20)
        .font(.custom("Rubik-Regular", size: 18))
    }
}

struct ArtistBioView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistBioView(artist: Artist(id: UUID(), name: "test", profileAvatar: "test", externalLinksRowOne: [], externalLinksRowTwo: [], bio: "test bio", showRoster: []))
    }
}
