//
//  UIComponent.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//

import SwiftUI

struct UIComponent: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let code: String
    let contentView: AnyView  // Holds the SwiftUI view dynamically
}
