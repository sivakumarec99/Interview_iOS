//
//  DiscloserGroup.swift
//  Interview
//
//  Created by JIDTP1408 on 04/04/25.
//

import Foundation
import SwiftUI

struct DiscloserGroupViewScreen: View {
    
    let components = [
        
        UIComponent(
            title: "Disclosure Group",
            description: "A collapsible section that reveals or hides its content when toggled.",
            code: """
        struct SimpleDisclosureGroupView: View {
            @State private var showDetails = false
            
            var body: some View {
                VStack(alignment: .leading) {
                    DisclosureGroup("User Profile", isExpanded: $showDetails) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Name: John Doe")
                            Text("Email: john@example.com")
                            Text("Phone: +91 9876543210")
                        }
                        .padding(.top, 5)
                        .padding(.leading, 10)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(UIColor.secondarySystemBackground)))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
                }
                .padding()
            }
        }
        """,
            contentView: AnyView(SimpleDisclosureGroupView())
        )
    ]
    
    var body: some View {
        List(components) { component in
            NavigationLink(destination: ComponentView(component: component, content: {
                component.contentView
            })) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(component.title)
                        .font(.headline)
                    Text(component.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            }
        }
        .navigationTitle("SwiftUI Advanced Views")
    }
    
    
}


struct SimpleDisclosureGroupView: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack(alignment: .leading) {
            DisclosureGroup("User Profile", isExpanded: $showDetails) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name: John Doe")
                    Text("Email: john@example.com")
                    Text("Phone: +91 9876543210")
                }
                .padding(.top, 5)
                .padding(.leading, 10)
            }
            .padding()
            #if os(iOS)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color(UIColor.secondarySystemBackground)))
            #else
            .background(RoundedRectangle(cornerRadius: 8).fill(Color(NSColor.secondaryLabelColor)))
            #endif
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
        }
        .padding()
    }
}
