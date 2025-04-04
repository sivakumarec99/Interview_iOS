//
//  GroupBoxScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 04/04/25.
//

import Foundation
import SwiftUI

struct GroupBoxViewScreen : View {
    
    let components = [
        UIComponent(
            title: "GroupBox View",
            description: "A stylized container with an optional label to group related content.",
            code: """
            struct GroupBoxExampleView: View {
                var body: some View {
                    VStack(spacing: 20) {
                        GroupBox(label: Label("User Profile", systemImage: "person.circle")) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Name: John Doe")
                                Text("Email: john@example.com")
                                Text("Membership: Premium")
                            }
                            .padding(.top, 5)
                        }
                        .padding()
                        
                        GroupBox {
                            VStack {
                                Text("This is a simple grouped message box.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(GroupBoxExampleView())
        ),
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

struct GroupBoxExampleView: View {
    var body: some View {
        VStack(spacing: 20) {
            GroupBox {
                GroupBox(label: Label("User Profile", systemImage: "person.circle")) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name: John Doe")
                        Text("Email: john@example.com")
                        Text("Membership: Premium")
                    }
                    .padding(.top, 5)
                }
                .padding()
                
                GroupBox {
                    VStack {
                        Text("This is a simple grouped message box.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }

           
        }
        .padding()
    }
}
