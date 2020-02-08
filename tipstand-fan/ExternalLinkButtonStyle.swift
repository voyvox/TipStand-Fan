//
//  ExternalLinkButtonStyle.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 1/29/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import SwiftUI

struct ExternalLinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .scaleEffect(configuration.isPressed ? 0.85 : 1)
    }
}
