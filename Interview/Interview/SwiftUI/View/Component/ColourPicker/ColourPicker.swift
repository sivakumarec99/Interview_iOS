//
//  ColourPicker.swift
//  Interview
//
//  Created by JIDTP1408 on 07/04/25.
//

import Foundation
import SwiftUI

struct ColurPickerView : View {
    
    let  components  = [
        UIComponent(
            title: "Color Picker",
            description: "Lets the user select a color from the system color picker.",
            code: """
            struct ColorPickerExampleView: View {
                @State private var selectedColor: Color = .blue

                var body: some View {
                    VStack(spacing: 20) {
                        ColorPicker("Pick a Color", selection: $selectedColor)
                            .padding()

                        RoundedRectangle(cornerRadius: 10)
                            .fill(selectedColor)
                            .frame(height: 150)
                            .overlay(Text("Selected Color")
                                        .foregroundColor(.white)
                                        .bold())
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(ColorPickerExampleView())
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

struct ColorPickerExampleView: View {
    @State private var selectedColor: Color = .blue

    var body: some View {
        VStack(spacing: 20) {
            ColorPicker("Pick a Color", selection: $selectedColor)
                .padding()

            RoundedRectangle(cornerRadius: 10)
                .fill(selectedColor)
                .frame(height: 150)
                .overlay(Text("Selected Color")
                            .foregroundColor(.white)
                            .bold())
        }
        .padding()
    }
}
