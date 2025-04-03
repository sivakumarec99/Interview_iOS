//
//  ProgressRingViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct ProgressRingViewScreen: View {
    
    let components = [
        UIComponent(
            title: "Basic Progress Ring",
            description: "A simple circular progress bar.",
            code: """
            struct BasicProgressRing: View {
                var progress: CGFloat = 0.7

                var body: some View {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                        
                        Circle()
                            .trim(from: 0.0, to: progress)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                    }
                    .frame(width: 100, height: 100)
                }
            }
            """,
            contentView: AnyView(BasicProgressRing())
        ),
        
        UIComponent(
            title: "Progress Ring with Percentage",
            description: "Displays percentage inside the ring.",
            code: """
            struct PercentageProgressRing: View {
                @State private var progress: CGFloat = 0.75

                var body: some View {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                        
                        Circle()
                            .trim(from: 0.0, to: progress)
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                        
                        Text("\\(Int(progress * 100))%")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                    .frame(width: 120, height: 120)
                }
            }
            """,
            contentView: AnyView(PercentageProgressRing())
        ),
        
        UIComponent(
            title: "Gradient Progress Ring",
            description: "A ring with gradient color progress.",
            code: """
            struct GradientProgressRing: View {
                var progress: CGFloat = 0.6

                var body: some View {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 12)
                        
                        Circle()
                            .trim(from: 0.0, to: progress)
                            .stroke(
                                AngularGradient(gradient: Gradient(colors: [.blue, .purple]), center: .center),
                                style: StrokeStyle(lineWidth: 12, lineCap: .round)
                            )
                            .rotationEffect(.degrees(-90))
                    }
                    .frame(width: 120, height: 120)
                }
            }
            """,
            contentView: AnyView(GradientProgressRing())
        ),
        
        UIComponent(
            title: "Animated Progress Ring",
            description: "A ring with smooth animation.",
            code: """
            struct AnimatedProgressRing: View {
                @State private var progress: CGFloat = 0.0

                var body: some View {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 12)
                        
                        Circle()
                            .trim(from: 0.0, to: progress)
                            .stroke(Color.orange, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut(duration: 1.5), value: progress)
                        
                        Text("\\(Int(progress * 100))%")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                    .frame(width: 120, height: 120)
                    .onAppear {
                        progress = 0.85
                    }
                }
            }
            """,
            contentView: AnyView(AnimatedProgressRing())
        ),
        
        UIComponent(
            title: "Multi-Layer Progress Rings",
            description: "Shows multiple progress rings for different metrics.",
            code: """
            struct MultiProgressRing: View {
                var progress1: CGFloat = 0.7
                var progress2: CGFloat = 0.5

                var body: some View {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                        
                        Circle()
                            .trim(from: 0.0, to: progress1)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                        
                        Circle()
                            .trim(from: 0.0, to: progress2)
                            .stroke(Color.red, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                        
                        Text("Data")
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    .frame(width: 140, height: 140)
                }
            }
            """,
            contentView: AnyView(MultiProgressRing())
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
        .navigationTitle("SwiftUI Progress Ring Components")
    }
}


struct BasicProgressRing: View {
    var progress: CGFloat = 0.7

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 10)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
        .frame(width: 100, height: 100)
    }
}
struct PercentageProgressRing: View {
    @State private var progress: CGFloat = 0.75

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 10)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Text("\(Int(progress * 100))%")
                .font(.headline)
                .foregroundColor(.green)
        }
        .frame(width: 120, height: 120)
    }
}
struct GradientProgressRing: View {
    var progress: CGFloat = 0.9
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 12)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.blue, .purple]), center: .center),
                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
        }
        .frame(width: 120, height: 120)
    }
}

struct AnimatedProgressRing: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 12)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 3), value: progress)
            
            Text("\(Int(progress * 100))%")
                .font(.headline)
                .foregroundColor(.orange)
        }
        .frame(width: 120, height: 120)
        .onAppear {
            progress = 0.90
        }
    }
}

struct MultiProgressRing: View {
    var progress1: CGFloat = 0.9
    var progress2: CGFloat = 0.7

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 10)
            
            Circle()
                .trim(from: 0.0, to: progress1)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Circle()
                .trim(from: 0.0, to: progress2)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Text("Data")
                .font(.headline)
                .foregroundColor(.primary)
        }
        .frame(width: 140, height: 140)
    }
}
