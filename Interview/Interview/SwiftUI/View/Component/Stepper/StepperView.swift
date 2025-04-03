//
//  StepperView.swift
//  Interview
//
//  Created by JIDTP1408 on 02/04/25.
//

import Foundation
import SwiftUI

struct StepperView: View {
    
    let components = [
        UIComponent(
            title: "Basic Stepper",
            description: "A simple stepper to increase/decrease values.",
            code: """
            struct BasicStepper: View {
                @State private var value: Int = 0
                
                var body: some View {
                    VStack {
                        Stepper("Value: \\(value)", value: $value)
                        Text("Current Value: \\(value)")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(BasicStepper())
        ),
        
        UIComponent(
            title: "Stepper with Range",
            description: "Restricts values between 1 and 10.",
            code: """
            struct RangedStepper: View {
                @State private var value: Int = 1
                
                var body: some View {
                    VStack {
                        Stepper("Value: \\(value)", value: $value, in: 1...10)
                        Text("Current Value: \\(value)")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(RangedStepper())
        ),
        
        UIComponent(
            title: "Stepper with Custom Step",
            description: "A stepper that increments by 5.",
            code: """
            struct CustomStepStepper: View {
                @State private var value: Int = 10
                
                var body: some View {
                    VStack {
                        Stepper("Value: \\(value)", value: $value, in: 0...100, step: 5)
                        Text("Current Value: \\(value)")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(CustomStepStepper())
        ),
        
        UIComponent(
            title: "Stepper with Labels",
            description: "Adds a custom label and format.",
            code: """
            struct LabeledStepper: View {
                @State private var quantity: Int = 1
                
                var body: some View {
                    VStack {
                        Stepper("Quantity: \\(quantity)", value: $quantity, in: 1...20)
                        Text("Total Items: \\(quantity)")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(LabeledStepper())
        ),
        
        UIComponent(
            title: "Stepper with Icons",
            description: "Uses an icon for visual enhancement.",
            code: """
            struct IconStepper: View {
                @State private var rating: Int = 3
                
                var body: some View {
                    VStack {
                        Stepper {
                            HStack {
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                Text("Rating: \\(rating)")
                            }
                        } onIncrement: {
                            rating += 1
                        } onDecrement: {
                            rating -= 1
                        }
                        Text("Current Rating: \\(rating)")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(IconStepper())
        ),
        
        UIComponent(
            title: "Programmatic Stepper",
            description: "Custom behavior using programmatic control.",
            code: """
            struct ProgrammaticStepper: View {
                @State private var value: Int = 0
                
                var body: some View {
                    VStack {
                        Stepper("Adjust Value") {
                            value += 2
                        } onDecrement: {
                            value -= 2
                        }
                        Text("Value: \\(value)")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(ProgrammaticStepper())
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
        .navigationTitle("SwiftUI Stepper Components")
    }
}

struct BasicStepper: View {
    @State private var value: Int = 0
    
    var body: some View {
        VStack {
            Stepper("Value: \(value)", value: $value)
            Text("Current Value: \(value)")
        }
        .padding()
    }
}

struct RangedStepper: View {
    @State private var value: Int = 1
    
    var body: some View {
        VStack {
            Stepper("Value: \(value)", value: $value, in: 1...10)
            Text("Current Value: \(value)")
        }
        .padding()
    }
}
struct CustomStepStepper: View {
    @State private var value: Int = 10
    
    var body: some View {
        VStack {
            Stepper("Value: \(value)", value: $value, in: 0...100, step: 5)
            Text("Current Value: \(value)")
        }
        .padding()
    }
}
struct LabeledStepper: View {
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack {
            Stepper("Quantity: \(quantity)", value: $quantity, in: 1...20)
            Text("Total Items: \(quantity)")
        }
        .padding()
    }
}
struct IconStepper: View {
    @State private var rating: Int = 3
    
    var body: some View {
        VStack {
            Stepper{
                HStack {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Text("Rating: \(rating)")
                }
            } onIncrement: {
                rating += 1
            } onDecrement: {
                rating -= 1
            }
            Text("Current Rating: \(rating)")
            Stepper("Custom",value: $rating,in: 1...15)
        }
        .padding()
    }
}
struct ProgrammaticStepper: View {
    @State private var value: Int = 0
    
    var body: some View {
        VStack {
            Stepper("Adjust Value") {
                value += 2
            } onDecrement: {
                value -= 2
            }
            Text("Value: \(value)")
        }
        .padding()
    }
}

