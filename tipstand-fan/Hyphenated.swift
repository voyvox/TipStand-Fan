//
//  Hyphenated.swift
//  tipstand-fan
//
//  Created by Craig Newcomb on 2/1/20.
//  Copyright © 2020 Craig Newcomb. All rights reserved.
//

import Foundation

extension String {
    func hyphenated() -> String {
        return self.replacingOccurrences(of: " ", with: "-")
    }
}
