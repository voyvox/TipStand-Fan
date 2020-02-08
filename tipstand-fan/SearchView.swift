//
//  SearchView.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 2/5/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

// lets text editing end when you drag on the list to scroll.
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter {$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search", text: $text)
                        .foregroundColor(.primary)
                    
                    if text.isEmpty {
                        Button(action: {
                            self.text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                        })
                    } else {
                        EmptyView()
                    }
                }
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct SearchView: View {
    let array = "SwiftUI is great but some views might need some extra work".components(separatedBy: " ")
    
    @State private var searchText = ""
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            
            List {
                ForEach(array.filter{ $0.hasPrefix(searchText) || searchText == ""}, id: \.self) {
                    searchText in Text(searchText)
                }
            }
            .gesture(DragGesture().onChanged { _ in
                UIApplication.shared.endEditing(true)
            })
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
