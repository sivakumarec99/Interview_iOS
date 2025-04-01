//
//  Item.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
