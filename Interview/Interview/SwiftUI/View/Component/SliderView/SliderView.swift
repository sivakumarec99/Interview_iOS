//
//  SliderView.swift
//  Interview
//
//  Created by JIDTP1408 on 02/04/25.
//

import Foundation
import SwiftUI

struct SliderView: View {
    
    let components = [
        UIComponent(
            title: "Basic Slider",
            description: "A simple slider with a value range.",
            code: """
            struct BasicSlider: View {
                @State private var sliderValue: Double = 50
                
                var body: some View {
                    VStack {
                        Slider(value: $sliderValue, in: 0...100)
                        Text("Value: \\(Int(sliderValue))")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(BasicSlider())
        ),
        
        UIComponent(
            title: "Slider with Labels",
            description: "Displays min/max labels for the slider.",
            code: """
            struct LabeledSlider: View {
                @State private var sliderValue: Double = 5
                
                var body: some View {
                    VStack {
                        Slider(value: $sliderValue, in: 1...10, step: 1)
                        HStack {
                            Text("1").foregroundColor(.gray)
                            Spacer()
                            Text("10").foregroundColor(.gray)
                        }
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(LabeledSlider())
        ),
        
        UIComponent(
            title: "Custom Styled Slider",
            description: "A slider with a custom style.",
            code: """
            struct StyledSlider: View {
                @State private var sliderValue: Double = 75
                
                var body: some View {
                    VStack {
                        Slider(value: $sliderValue, in: 0...100)
                            .accentColor(.purple)
                            .padding()
                        Text("Value: \\(Int(sliderValue))")
                            .font(.headline)
                    }
                }
            }
            """,
            contentView: AnyView(StyledSlider())
        ),
        
        UIComponent(
            title: "Slider with Steps",
            description: "A slider that moves in steps.",
            code: """
            struct StepSlider: View {
                @State private var sliderValue: Double = 5
                
                var body: some View {
                    VStack {
                        Slider(value: $sliderValue, in: 1...10, step: 1)
                        Text("Selected Value: \\(Int(sliderValue))")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(StepSlider())
        ),
        
        UIComponent(
            title: "Slider with Image Icons",
            description: "A slider with min/max image indicators.",
            code: """
            struct IconSlider: View {
                @State private var sliderValue: Double = 50
                
                var body: some View {
                    VStack {
                        HStack {
                            Image(systemName: "tortoise.fill")
                            Slider(value: $sliderValue, in: 0...100)
                            Image(systemName: "hare.fill")
                        }
                        Text("Speed: \\(Int(sliderValue))")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(IconSlider())
        ),
        
        UIComponent(
            title: "Range Slider",
            description: "Two-way slider for selecting a range.",
            code: """
            struct RangeSlider: View {
                @State private var lowerValue: Double = 10
                @State private var upperValue: Double = 90
                
                var body: some View {
                    VStack {
                        Slider(value: $lowerValue, in: 0...100)
                        Slider(value: $upperValue, in: 0...100)
                        Text("Range: \\(Int(lowerValue)) - \\(Int(upperValue))")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(RangeSlider())
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
        .navigationTitle("SwiftUI Slider Components")
    }
}

struct BasicSlider: View {
    @State private var sliderValue: Double = 50
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 0...100)
            Text("Value: \(Int(sliderValue))")
        }
        .padding()
    }
}
struct LabeledSlider: View {
    @State private var sliderValue: Double = 5
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 1...10, step: 1)
            HStack {
                Text("1").foregroundColor(.gray)
                Spacer()
                Text("10").foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct StyledSlider: View {
    @State private var sliderValue: Double = 75
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 0...100)
                .accentColor(.purple)
                .padding()
            Text("Value: \(Int(sliderValue))")
                .font(.headline)
        }
    }
}
struct StepSlider: View {
    @State private var sliderValue: Double = 5
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 1...10, step: 1)
            Text("Selected Value: \(Int(sliderValue))")
        }
        .padding()
    }
}
struct IconSlider: View {
    @State private var sliderValue: Double = 50
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "tortoise.fill")
                Slider(value: $sliderValue, in: 0...100)
                Image(systemName: "hare.fill")
            }
            Text("Speed: \(Int(sliderValue))")
        }
        .padding()
    }
}

struct RangeSlider: View {
    @State private var lowerValue: Double = 10
    @State private var upperValue: Double = 90
    
    var body: some View {
        VStack {
            Slider(value: $lowerValue, in: 0...100)
            Slider(value: $upperValue, in: 0...100)
            Text("Range: \(Int(lowerValue)) - \(Int(upperValue))")
        }
        .padding()
    }
}
