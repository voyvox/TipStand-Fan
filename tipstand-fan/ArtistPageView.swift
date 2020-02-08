//
//  BandPageView.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 1/29/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct ArtistPageView: View {
    var artist: Artist
    var name: String = ""
    var profilePhoto: String = ""
    var linkSize: CGFloat = 64.0
    
    var externalLinksRowOne: [ExternalLink] = [.appleMusic, .spotify, .instagram]
    var externalLinksRowTwo: [ExternalLink] = [.twitter, .tiktok, .website]
    var externalLinks: [[ExternalLink]] {
        return [
            artist.externalLinksRowOne,
            artist.externalLinksRowTwo
        ]
    }
    
    @State var pickerIndex = 0
    @State var pickerTitles = ["Bio", "Shows"]
    
    var body: some View {
        GeometryReader { g in
            ScrollView {
                VStack(spacing: 0) {
                    
                    ZStack(alignment: .bottom) {
                        Image(self.artist.profileAvatar)
                        .resizable()
                        .scaledToFit()
                        
                        // creates the blur under artist name.
                        Group {
                            Image(self.artist.profileAvatar)
                            .resizable()
                            .scaledToFill()
                            .frame(width: g.size.width, height: (1/6)*(g.size.width), alignment: .bottom)
                            .clipped()
                            .blur(radius: 15.0)
                                .scaleEffect(1.0) // remove if not needed
                                .offset(y: 30)
                            
                            Image(self.artist.profileAvatar)
                                .resizable()
                                .scaledToFill()
                                .frame(width: g.size.width, height: (1/3)*(g.size.width), alignment: .bottom)
                                .clipped()
                                .blur(radius: 25.0)
                                .scaleEffect(1.1) // remove if not needed
                        }
                        
                        VStack {
                            Text(self.artist.name)
                                .kerning(-0.5)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .font(.custom("Rubik-Medium", size: 32))
                                .foregroundColor(.white)
                            
                            Spacer()
                                .frame(height: self.linkSize)
                        }
                        
                    }
                    .frame(width: g.size.width, height: g.size.width)
                    
                    ZStack (alignment: .top) {
                        Color("mainBG")
                        .edgesIgnoringSafeArea(.all)
                        
                        VStack(spacing: 32) {
                            
                            ForEach(self.externalLinks, id: \.self) { linkRow in
                                HStack(spacing: 32) {
                                    ForEach(linkRow, id: \.self) { link in
                                        ExternalLinkButton(externalLink: link, linkSize: self.linkSize)
                                    }
                                }
                            }
                            
                            Button(action: {
                                // send tip
                            }, label: {
                                ZStack {
                                    Color("TSBassBlue")
                                    HStack {
                                        
                                        Image(systemName: "dollarsign.circle.fill")
                                            .font(.system(size: 24, weight: .medium))
                                        
                                        Text("SUPPORT")
                                        .font(.custom("Rubik-Medium", size: 24))
                                        
                                    }
                                    .foregroundColor(.white)
                                }
                                .frame(width: 4 * self.linkSize, height: self.linkSize)
                                .cornerRadius(15)
                                }).buttonStyle(ExternalLinkButtonStyle())
                            
                            VStack(spacing: 35) {
                                Picker("Tabs", selection: self.$pickerIndex) {
                                    ForEach(0..<self.pickerTitles.count) { index in
                                        Text(self.pickerTitles[index]).tag(index)
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                
                                // view that segmenter affects, ArtistBioView or ArtistShowtimeListView
                                self.buildTabView()
                                
                                
                            }
                            .padding(.horizontal, 30)
                            
                        }
                        .offset(y: -1*0.5*self.linkSize)
                    }
                }
            }
        }
    }
    
    func buildTabView() -> AnyView {
        switch pickerIndex {
        case 0:
            // Bio
            return AnyView(ArtistBioView(artist: artist))
        case 1:
            // Shows
            return AnyView(ArtistShowtimeListView(artist: artist))
        default:
            return AnyView(EmptyView())
        }
    }
}

struct BandPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArtistPageView(artist: Artist(id: UUID(),
            name: "Aiden Harris",
            profileAvatar: "aiden-harris-profile-avatar",
            externalLinksRowOne: [.appleMusic, .spotify, .instagram],
            externalLinksRowTwo: [.twitter, .tiktok, .website],
            bio: "Hey, my name is Aiden Harris, and this is my artist page. I'm incredibly lucky to have some really talented artists making great music almost every night with me. Come catch us out at Wild Boar's Pub Mondays and Tuesdays!",
           showRoster: [
                Showtime(

                    venue: Venue(
                        name: "Wild Boar's Pub",
                        address: "3001 Cedar St, Austin TX 78705",
                        coordinatesLat: 30.2950,
                        coordinatesLong: -97.7380
                    ),
                    dateStart: "2020-01-06'T'18:00:00",
                    dateEnd: "2020-01-06'T'18:00:00"
                )
            ])
        )
    }
}
