//
//  FormViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 04/04/25.
//

import Foundation
import SwiftUI

struct FromViewCustom : View {
    
    let components = [
    
        UIComponent(
            title: "Form View",
            description: "A container used to group user input controls in a structured layout, typically used for forms or settings.",
            code: """
            struct FormExampleView: View {
                @State private var name = ""
                @State private var email = ""
                @State private var notificationsEnabled = false
                @State private var selectedColor = "Blue"
                
                var colors = ["Red", "Green", "Blue"]
                
                var body: some View {
                    NavigationView {
                        Form {
                            Section(header: Text("User Info")) {
                                TextField("Name", text: $name)
                                TextField("Email", text: $email)
                                    .keyboardType(.emailAddress)
                            }
                            
                            Section(header: Text("Preferences")) {
                                Toggle("Enable Notifications", isOn: $notificationsEnabled)
                                
                                Picker("Favorite Color", selection: $selectedColor) {
                                    ForEach(colors, id: \\.self) { color in
                                        Text(color)
                                    }
                                }
                            }
                            
                            Section {
                                Button("Submit") {
                                    print("Name: \\(name), Email: \\(email)")
                                }
                            }
                        }
                    }
                    .navigationTitle("User Setting")

                }
            }
            """,
            contentView: AnyView(FormExampleView())
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

struct FormExampleView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var notificationsEnabled = false
    @State private var selectedColor = "Blue"
    
    var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Info")) {
                    TextField("Name", text: $name)
                    #if os(iOS)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                    #else
                        TextField("Email", text: $email)
                    #endif
                    
                }
                
                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    
                    Picker("Favorite Color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                }
                
                Section {
                    Button("Submit") {
                        print("Name: \(name), Email: \(email)")
                    }
                }
            }
        }
        .navigationTitle("User Setting")

    }
}
