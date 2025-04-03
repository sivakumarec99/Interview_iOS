//
//  ProgressViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct ProgressViewScreen: View {
    
    let components = [
        UIComponent(
            title: "Basic Progress View",
            description: "A simple loading indicator.",
            code: """
            struct BasicProgressView: View {
                var body: some View {
                    ProgressView()
                        .padding()
                }
            }
            """,
            contentView: AnyView(BasicProgressView())
        ),
        
        UIComponent(
            title: "Determinate Progress View",
            description: "Shows progress with a percentage.",
            code: """
            struct DeterminateProgressView: View {
                @State private var progress: Double = 0.3

                var body: some View {
                    VStack {
                        ProgressView(value: progress)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        Button("Increase Progress") {
                            if progress < 1.0 {
                                progress += 0.1
                            }
                        }
                    }
                }
            }
            """,
            contentView: AnyView(DeterminateProgressView())
        ),
        
        UIComponent(
            title: "Custom Styled Progress View",
            description: "Add colors and styles.",
            code: """
            struct StyledProgressView: View {
                @State private var progress: Double = 0.5

                var body: some View {
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle())
                        .tint(.blue)
                        .padding()
                }
            }
            """,
            contentView: AnyView(StyledProgressView())
        ),
        
        UIComponent(
            title: "Circular Progress View",
            description: "A smooth animated circular loader.",
            code: """
            struct CircularProgressView: View {
                var body: some View {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        .padding()
                }
            }
            """,
            contentView: AnyView(CircularProgressView())
        ),
        
        UIComponent(
            title: "Progress View with Timer",
            description: "Simulates loading with a timer.",
            code: """
            struct TimedProgressView: View {
                @State private var progress = 0.0
                let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

                var body: some View {
                    VStack {
                        ProgressView(value: progress)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        Text("Loading... \\(Int(progress * 100))%")
                    }
                    .onReceive(timer) { _ in
                        if progress < 1.0 {
                            progress += 0.05
                        }
                    }
                }
            }
            """,
            contentView: AnyView(TimedProgressView())
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
        .navigationTitle("SwiftUI ProgressView Components")
    }
}

struct BasicProgressView: View {
    var body: some View {
        ProgressView()
            .padding()
    }
}
struct DeterminateProgressView: View {
    @State private var progress: Double = 0.3

    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
            
            Button("Increase Progress") {
                if progress < 1.0 {
                    progress += 0.1
                }
            }
        }
    }
}
struct CircularProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5)
            .padding()
    }
}
struct StyledProgressView: View {
    @State private var progress: Double = 0.5

    var body: some View {
        ProgressView(value: progress)
            .progressViewStyle(LinearProgressViewStyle())
            .tint(.blue)
            .padding()
    }
}
struct TimedProgressView: View {
    @State private var progress = 0.0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
            
            Text("Loading... \(Int(progress * 100))%")
        }
        .onReceive(timer) { _ in
            if progress < 1.0 {
                progress += 0.05
            }
        }
    }
}
