//
//  SwiftUI.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//
import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ComponentListView()
    }
}

// Enum for UI Components
enum UIComponentType: String, CaseIterable, Identifiable {
    case text = "Text"
    case button = "Button"
    case image = "Image"

    var id: String { self.rawValue }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .text:
            TextView()
        case .button:
            ButtonView()
        case .image:
            ImageView()
        }
    }
}

struct ComponentListView: View {
    var body: some View {
        NavigationView {
            List(UIComponentType.allCases) { component in
                NavigationLink(destination: component.destination) {
                    HStack {
                        Image(systemName: component.iconName)
                            .foregroundColor(.blue)
                        Text(component.rawValue)
                            .font(.headline)
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("SwiftUI Components")
        }
    }
}

// Extension to provide icons for components
extension UIComponentType {
    var iconName: String {
        switch self {
        case .text:
            return "textformat"
        case .button:
            return "rectangle.and.hand.point.up"
        case .image:
            return "photo"
        }
    }
}

