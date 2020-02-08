//
//  ContentView.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 10/24/19.
//  Copyright © 2019 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        TabView {
            ArtistList()
                .tabItem {
                    VStack {
                        Image(systemName: "guitars")
                        Text("My Artists")
                    }
                }
                .tag(0)
            Text("Me")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Me")
                    }
                }
                .tag(1)
            Text("VIP Cam (Coming Soon)")
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "camera.viewfinder")
                        Text("VIP Cam")
                    }
                }
            Text("Search")
                .font(.title)
                .tabItem {
                VStack{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
