//
//  PickerView.swift
//  Interview
//
//  Created by JIDTP1408 on 02/04/25.
//

import Foundation
import SwiftUI

struct PickerView: View {
    
    let components = [
        UIComponent(
            title: "Basic Picker",
            description: "A simple picker with static options.",
            code: """
            struct BasicPicker: View {
                @State private var selectedOption = "Apple"
                let options = ["Apple", "Banana", "Cherry", "Grapes"]
                
                var body: some View {
                    Picker("Select a Fruit", selection: $selectedOption) {
                        ForEach(options, id: \\ .self) { option in
                            Text(option).tag(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle()) // Dropdown style
                    .padding()
                }
            }
            """,
            contentView: AnyView(BasicPicker())
        ),
        
        UIComponent(
            title: "Picker with Labels",
            description: "Picker with labels instead of plain text.",
            code: """
            struct LabeledPicker: View {
                @State private var selectedOption = "Low"
                let options = ["Low", "Medium", "High"]
                
                var body: some View {
                    Picker("Select Priority", selection: $selectedOption) {
                        Text("🔥 High").tag("High")
                        Text("⚡ Medium").tag("Medium")
                        Text("✅ Low").tag("Low")
                    }
                    .pickerStyle(DefaultPickerStyle())
                    .padding()
                }
            }
            """,
            contentView: AnyView(LabeledPicker())
        ),
        
        UIComponent(
            title: "Segmented Picker",
            description: "A picker with segmented control style.",
            code: """
            struct SegmentedPicker: View {
                @State private var selectedIndex = 0
                let options = ["Day", "Week", "Month"]
                
                var body: some View {
                    Picker("View Mode", selection: $selectedIndex) {
                        ForEach(0..<options.count, id: \\ .self) { index in
                            Text(options[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
            }
            """,
            contentView: AnyView(SegmentedPicker())
        ),
        
        UIComponent(
            title: "Picker in Form",
            description: "A picker inside a form for better UI.",
            code: """
            struct FormPicker: View {
                @State private var selectedOption = "One"
                let options = ["One", "Two", "Three"]
                
                var body: some View {
                    Form {
                        Section(header: Text("Select a Number")) {
                            Picker("Numbers", selection: $selectedOption) {
                                ForEach(options, id: \\ .self) { option in
                                    Text(option).tag(option)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                        }
                    }
                }
            }
            """,
            contentView: AnyView(FormPicker())
        ),
        
        UIComponent(
            title: "Custom Styled Picker",
            description: "A picker with custom styling.",
            code: """
            struct StyledPicker: View {
                @State private var selectedOption = "Option 1"
                let options = ["Option 1", "Option 2", "Option 3"]
                
                var body: some View {
                    Picker("Choose Option", selection: $selectedOption) {
                        ForEach(options, id: \\ .self) { option in
                            Text(option).tag(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                }
            }
            """,
            contentView: AnyView(StyledPicker())
        ),
        
        UIComponent(
            title: "Dynamic Data Picker",
            description: "A picker that loads dynamic data.",
            code: """
            struct DynamicPicker: View {
                @State private var selectedIndex = 0
                let options = (1...10).map { "Item \\($0)" }
                
                var body: some View {
                    Picker("Select Item", selection: $selectedIndex) {
                        ForEach(0..<options.count, id: \\ .self) { index in
                            Text(options[index]).tag(index)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                }
            }
            """,
            contentView: AnyView(DynamicPicker())
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
        .navigationTitle("SwiftUI Picker Components")
    }
}

struct BasicPicker: View {
    @State private var selectedOption = "Apple"
    let options = ["Apple", "Banana", "Cherry", "Grapes"]
    
    var body: some View {
        Picker("Select a Fruit", selection: $selectedOption) {
            ForEach(options, id: \ .self) { option in
                Text(option).tag(option)
            }
        }
        .pickerStyle(MenuPickerStyle()) // Dropdown style
        .padding()
    }
}
struct LabeledPicker: View {
    @State private var selectedOption = "Low"
    let options = ["Low", "Medium", "High"]
    
    var body: some View {
        Picker("Select Priority", selection: $selectedOption) {
            Text("🔥 High").tag("High")
            Text("⚡ Medium").tag("Medium")
            Text("✅ Low").tag("Low")
        }
        .pickerStyle(DefaultPickerStyle())
        .padding()
    }
}

struct SegmentedPicker: View {
    @State private var selectedIndex = 0
    let options = ["Day", "Week", "Month"]
    
    var body: some View {
        Picker("View Mode", selection: $selectedIndex) {
            ForEach(0..<options.count, id: \ .self) { index in
                Text(options[index]).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
struct FormPicker: View {
    @State private var selectedOption = "One"
    let options = ["One", "Two", "Three"]
    
    var body: some View {
        Form {
            Section(header: Text("Select a Number")) {
                Picker("Numbers", selection: $selectedOption) {
                    ForEach(options, id: \ .self) { option in
                        Text(option).tag(option)
                    }
                }
                #if os(iOS)
                .pickerStyle(WheelPickerStyle())
                #elseif os(macOS)
                .pickerStyle(.automatic)
                #endif
                .padding()
            }
        }
    }
}
struct StyledPicker: View {
    @State private var selectedOption = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        Picker("Choose Option", selection: $selectedOption) {
            ForEach(options, id: \ .self) { option in
                Text(option).tag(option)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
    }
}
struct DynamicPicker: View {
    @State private var selectedIndex = 0
    let options = (1...10).map { "Item \($0)" }
    
    var body: some View {
        Picker("Select Item", selection: $selectedIndex) {
            ForEach(0..<options.count, id: \ .self) { index in
                Text(options[index]).tag(index)
            }
        }
        #if os(iOS)
        .pickerStyle(WheelPickerStyle())
        #elseif os(macOS)
        .pickerStyle(.automatic)
        #endif
        .padding()
    }
}
