//
//  BandList.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 2/1/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct ArtistList: View {
    @State var presentingArtistPageView = false
    
    var artists = Bundle.main.decode([Artist].self, from: "artists.json")
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Rubik-Medium", size: 32)!]
    }
    
    var body: some View {
        NavigationView {
            List(artists, id: \.self) { artist in
                Button(action: {
                    self.presentingArtistPageView = true
                }, label: {
                    HStack(spacing: 10) {
                        Image(artist.profileAvatar)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 50)
                        VStack(alignment: .leading) {
                            Text(artist.name)
                                .font(.custom("Rubik-Medium", size: 20))
                            Text("\(artist.showRoster?.count ?? 0) upcoming shows")
                            .font(.custom("Rubik-Regular", size: 14))
                                .foregroundColor(Color(.systemGray))
                        }
                    }
                }).sheet(isPresented: self.$presentingArtistPageView) {
                    ArtistPageView(artist: artist)
                }
            }
            .navigationBarTitle("My Artists", displayMode: .large)
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func alphabetListMaker(artists: [Artist]) -> [Artist] {
        // need to input an array of artists that takes every artist.name, puts it in an array, sorts them, then creates a list of sections where each letter groups the artists by letter.
        
        // attempt to get every artist name from the data source imported from the JSON.
        let array: [String] = artists.map{ $0.name }
        print(array)
        
        // attempt to get the first letter from every resultant artist name, and remove duplicates. Then sort by ascending (alphabetical)
        let presentLetters: [String] = Array(Set(array.map{ String($0.prefix(1)).uppercased() })).sorted()
        print(presentLetters) // should have no duplicate letters
        
        List {
            ForEach(presentLetters) { letter in
                Section(header: letter) {
                    // we are adding artists in here if their prefix matches the letter, for each letter in presentLetters.
                }
            }
        }
        
        let dict: [String: [Artist]]
        
    }
}

struct BandList_Previews: PreviewProvider {
    static var previews: some View {
        ArtistList()
    }
}


