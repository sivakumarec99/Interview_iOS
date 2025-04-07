//
//  ActionSheetView.swift
//  Interview
//
//  Created by JIDTP1408 on 07/04/25.
//

import Foundation
import SwiftUI
struct ActionSheetView : View {
    
    let components = [
        UIComponent(
            title: "Action Sheet / Confirmation Dialog",
            description: "Presents a sheet with multiple actions when a button is tapped.",
            code: """
            struct ActionSheetExampleView: View {
                @State private var showDialog = false
                @State private var selectedOption: String?

                var body: some View {
                    VStack(spacing: 20) {
                        Button("Show Options") {
                            showDialog = true
                        }

                        if let selected = selectedOption {
                            Text("Selected: \\(selected)")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                    }
                    .confirmationDialog("Choose an option", isPresented: $showDialog, titleVisibility: .visible) {
                        Button("Option 1") {
                            selectedOption = "Option 1"
                        }
                        Button("Option 2") {
                            selectedOption = "Option 2"
                        }
                        Button("Cancel", role: .cancel) { }
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(ActionSheetExampleView())
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
struct ActionSheetExampleView: View {
    @State private var showDialog = false
    @State private var selectedOption: String?

    var body: some View {
        VStack(spacing: 20) {
            Button("Show Options") {
                showDialog = true
            }

            if let selected = selectedOption {
                Text("Selected: \(selected)")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
        }
        .confirmationDialog("Choose an option", isPresented: $showDialog, titleVisibility: .visible) {
            Button("Option 1") {
                selectedOption = "Option 1"
            }
            Button("Option 2") {
                selectedOption = "Option 2"
            }
            Button("Cancel", role: .cancel) { }
        }
        .padding()
    }
}
