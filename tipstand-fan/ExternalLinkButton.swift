//
//  ExternalLinkButton.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 1/29/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

enum ExternalLink: String, Codable, CaseIterable {
    case appleMusic
    case spotify
    case instagram
    case twitter
    case tiktok
    case website
}

struct ExternalLinkButton: View {
    var externalLink: ExternalLink
    var externalID = ""
    // the associated ID for each external link, that can be insterted into a URL or app link to take redirect to the appropriate artist page, instagram page, or website url.
    
    var linkSize: CGFloat
    var linkIconSize: CGFloat {
        switch externalLink {
        case .appleMusic:
            return linkSize
        default:
            return linkSize / 2
        }
    }
    var iconName: String {
        switch externalLink {
        case .appleMusic:
            return "apple-music-logo"
        case .spotify:
            return "spotify-logo"
        case .instagram:
            return "instagram-logo"
        case .twitter:
            return "twitter-logo"
        case .tiktok:
            return "tiktok-logo"
        case .website:
            return "website-logo"
        }
    }
    
    
    var body: some View {
        Button(action: {
            // on tap, redirect to appropriate app or website URL
        }, label: {
            ZStack {
                Color("externalLinkColor")
                .frame(width: linkSize, height: linkSize)
                .cornerRadius(15)
                
                Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: linkIconSize, height: linkIconSize)
            }
        })
        .buttonStyle(ExternalLinkButtonStyle())
    }
}

struct ExternalLinkButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("mainBG")
                .edgesIgnoringSafeArea(.all)
            ExternalLinkButton(externalLink: .twitter, linkSize: 64)
        }
    }
}
