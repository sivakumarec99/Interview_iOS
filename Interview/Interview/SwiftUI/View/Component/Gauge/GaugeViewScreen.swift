//
//  GaugeViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct GaugeViewScreen: View {
    
    let components = [
        UIComponent(
            title: "Basic Gauge",
            description: "A simple gauge displaying a value.",
            code: """
            struct BasicGaugeView: View {
                var body: some View {
                    Gauge(value: 0.5) {
                        Text("Battery Level")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(BasicGaugeView())
        ),
        
        UIComponent(
            title: "Gauge with Labels",
            description: "Shows a gauge with minimum and maximum labels.",
            code: """
            struct LabeledGaugeView: View {
                var body: some View {
                    Gauge(value: 60, in: 0...100) {
                        Text("Speed")
                    } currentValueLabel: {
                        Text("60 km/h")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(LabeledGaugeView())
        ),
        
        UIComponent(
            title: "Customized Gauge",
            description: "A gauge with custom colors and style.",
            code: """
            struct StyledGaugeView: View {
                var body: some View {
                    Gauge(value: 75, in: 0...100) {
                        Text("CPU Usage")
                    } currentValueLabel: {
                        Text("75%")
                    }
                    .tint(.red)
                    .padding()
                }
            }
            """,
            contentView: AnyView(StyledGaugeView())
        ),
        
        UIComponent(
            title: "Gauge with Icons",
            description: "Displays a gauge with SF Symbols.",
            code: """
            struct IconGaugeView: View {
                var body: some View {
                    Gauge(value: 0.7) {
                        Label("Battery", systemImage: "battery.100")
                    }
                    .tint(.green)
                    .padding()
                }
            }
            """,
            contentView: AnyView(IconGaugeView())
        ),
        
        UIComponent(
            title: "Animated Gauge",
            description: "Simulates real-time progress using a timer.",
            code: """
            struct AnimatedGaugeView: View {
                @State private var progress = 0.2
                let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

                var body: some View {
                    Gauge(value: progress, in: 0...1) {
                        Text("Loading...")
                    }
                    .tint(.blue)
                    .padding()
                    .onReceive(timer) { _ in
                        if progress < 1.0 {
                            progress += 0.05
                        }
                    }
                }
            }
            """,
            contentView: AnyView(AnimatedGaugeView())
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
        .navigationTitle("SwiftUI Gauge Components")
    }
}
struct BasicGaugeView: View {
    var body: some View {
        Gauge(value: 0.5) {
            Text("Battery Level")
        }
        .padding()
    }
}

struct StyledGaugeView: View {
    var body: some View {
        Gauge(value: 75, in: 0...100) {
            Text("CPU Usage")
        } currentValueLabel: {
            Text("75%")
        }
        .tint(.red)
        .padding()
    }
}
struct IconGaugeView: View {
    var body: some View {
        Gauge(value: 0.7) {
            Label("Battery", systemImage: "battery.100")
        }
        .tint(.green)
        .padding()
    }
}
struct LabeledGaugeView: View {
    var body: some View {
        Gauge(value: 60, in: 0...100) {
            Text("Speed")
        } currentValueLabel: {
            Text("60 km/h")
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("100")
        }
        .padding()
    }
}
struct AnimatedGaugeView: View {
    @State private var progress = 0.2
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

    var body: some View {
        Gauge(value: progress, in: 0...1) {
            Text("Loading...")
        }
        .tint(.blue)
        .padding()
        .onReceive(timer) { _ in
            if progress < 1.0 {
                progress += 0.05
            }
        }
    }
}
