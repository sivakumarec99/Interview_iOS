//
//  ToggleView.swift
//  Interview
//
//  Created by JIDTP1408 on 02/04/25.
//

import Foundation
import SwiftUI

struct ToggleView: View {
    
    let components = [
        UIComponent(
            title: "Basic Toggle",
            description: "A simple on/off switch.",
            code: """
            struct BasicToggle: View {
                @State private var isOn: Bool = false
                
                var body: some View {
                    Toggle("Enable Feature", isOn: $isOn)
                        .padding()
                }
            }
            """,
            contentView: AnyView(BasicToggle())
        ),
        
        UIComponent(
            title: "Toggle with Label",
            description: "A toggle with a custom label.",
            code: """
            struct LabeledToggle: View {
                @State private var isEnabled: Bool = true
                
                var body: some View {
                    Toggle(isOn: $isEnabled) {
                        Text(isEnabled ? "Enabled" : "Disabled")
                            .bold()
                            .foregroundColor(isEnabled ? .green : .red)
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(LabeledToggle())
        ),
        
        UIComponent(
            title: "Toggle with Image",
            description: "A toggle with an image.",
            code: """
            struct ImageToggle: View {
                @State private var isActive: Bool = false
                
                var body: some View {
                    Toggle(isOn: $isActive) {
                        HStack {
                            Image(systemName: isActive ? "sun.max.fill" : "moon.fill")
                                .foregroundColor(isActive ? .yellow : .gray)
                            Text("Theme Mode")
                        }
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(ImageToggle())
        ),
        
        UIComponent(
            title: "Custom Styled Toggle",
            description: "A toggle with customized colors.",
            code: """
            struct CustomToggle: View {
                @State private var isActive: Bool = false
                
                var body: some View {
                    Toggle("Custom Style", isOn: $isActive)
                        .toggleStyle(SwitchToggleStyle(tint: .purple))
                        .padding()
                }
            }
            """,
            contentView: AnyView(CustomToggle())
        ),
        
        UIComponent(
            title: "Toggle in List",
            description: "A toggle inside a List view.",
            code: """
            struct ListToggle: View {
                @State private var notificationsEnabled: Bool = true
                
                var body: some View {
                    List {
                        Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    }
                }
            }
            """,
            contentView: AnyView(ListToggle())
        ),
        
        UIComponent(
            title: "Toggle with State Management",
            description: "A toggle that controls a setting.",
            code: """
            struct StateToggle: View {
                @State private var darkMode: Bool = false
                
                var body: some View {
                    VStack {
                        Toggle("Dark Mode", isOn: $darkMode)
                            .padding()
                        
                        Text(darkMode ? "Dark Mode Enabled" : "Light Mode Enabled")
                            .foregroundColor(darkMode ? .white : .black)
                            .padding()
                            .background(darkMode ? Color.black : Color.white)
                            .cornerRadius(10)
                    }
                }
            }
            """,
            contentView: AnyView(StateToggle())
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
        .navigationTitle("SwiftUI Toggle Components")
    }
}

struct BasicToggle: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        Toggle("Enable Feature", isOn: $isOn)
            .padding()
    }
}

struct LabeledToggle: View {
    @State private var isEnabled: Bool = true
    
    var body: some View {
        Toggle(isOn: $isEnabled) {
            Text(isEnabled ? "Enabled" : "Disabled")
                .bold()
                .foregroundColor(isEnabled ? .green : .red)
        }
        .padding()
    }
}

struct ImageToggle: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        Toggle(isOn: $isActive) {
            HStack {
                Image(systemName: isActive ? "sun.max.fill" : "moon.fill")
                    .foregroundColor(isActive ? .yellow : .gray)
                Text("Theme Mode")
            }
        }
        .padding()
    }
}
struct CustomToggle: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        Toggle("Custom Style", isOn: $isActive)
            .toggleStyle(SwitchToggleStyle(tint: .purple))
            .padding()
    }
}

struct ListToggle: View {
    @State private var notificationsEnabled: Bool = true
    
    var body: some View {
        List {
            Toggle("Enable Notifications", isOn: $notificationsEnabled)
        }
    }
}

struct StateToggle: View {
    @State private var darkMode: Bool = false
    
    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $darkMode)
                .padding()
            
            Text(darkMode ? "Dark Mode Enabled" : "Light Mode Enabled")
                .foregroundColor(darkMode ? .white : .black)
                .padding()
                .background(darkMode ? Color.black : Color.white)
                .cornerRadius(10)
        }
    }
}
