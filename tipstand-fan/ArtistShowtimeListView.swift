//
//  ArtistShowtimeListView.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 2/6/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct ArtistShowtimeListView: View {
    var artist: Artist
    
    var body: some View {
        VStack(spacing: 20) {
//            buildList()
            ForEach(artist.showRoster!, id: \.self) { show in
                ShowtimeItem(itemHeight: 150, showtime: show)
            }
        }
    }
    
    func buildList() -> AnyView {
        guard let roster = artist.showRoster else { return AnyView(Text("\(artist.name) has no upcoming shows. Check back later!")) }
        
        ForEach(roster, id: \.self) { show in
            return AnyView(ShowtimeItem(itemHeight: 150, showtime: show))
        }
        return AnyView(Text("\(artist.name) has no upcoming shows. Check back later!"))
    }
}

// put in own file when done
struct ShowtimeItem: View {
    var itemHeight: CGFloat
    var showtime: Showtime
    
    var body: some View {
        ZStack {
            Color("externalLinkColor")
            VStack(alignment: .leading) {
                
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(showtime.dateStart)
                        .font(.custom("Rubik-Medium", size: 26))
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text(showtime.venue.name)
                            .lineLimit(1)
                            Text(showtime.venue.address)
                            .lineLimit(1)
                        }
                        .font(.custom("Rubik-Regular", size: 20))
                        .foregroundColor(Color(.systemGray))
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Button(action: {
                            // add to calendar
                        }, label: {
                            ZStack {
                                Color("TSBassBlue")
                                Image(systemName: "calendar")
                                .foregroundColor(Color("externalLinkColor"))
                            }
                            .frame(height: 35)
                            .clipShape(Circle())
                        })
                        
                        Button(action: {
                            // get directions or rideshare
                        }, label: {
                            ZStack {
                                Color("TSBassBlue")
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(Color("externalLinkColor"))
                            }
                            .frame(height: 35)
                            .clipShape(Circle())
                            
                        })
                    }
                    .frame(width: 35)
                }
            }
            .padding()
        }
        .frame(height: itemHeight)
        .cornerRadius(10)
    }
}

struct ArtistShowtimeListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("mainBG")
            ShowtimeItem(itemHeight: 150, showtime: Showtime(venue: Venue(name: "Boar's Pig Pub", address: "1234 5TH St. Austin, TX 78705", coordinatesLat: 20.0, coordinatesLong: 24.00), dateStart: "10/10/2020 \n6:00PM", dateEnd: "2020-01-14'T'18:00:00"))
        }.colorScheme(.light)
    }
}
