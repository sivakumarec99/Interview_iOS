//
//  AdvancedViewsScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct AdvancedViewsScreen: View {
    
    let components = [
        UIComponent(
            title: "Canvas View",
            description: "A custom drawing area using `Canvas`.",
            code: """
            struct CanvasExampleView: View {
                var body: some View {
                    Canvas { context, size in
                        let rect = CGRect(origin: .zero, size: size)
                        context.fill(Path(rect), with: .color(.blue))
                        context.stroke(Path(rect.insetBy(dx: 10, dy: 10)), with: .color(.white), lineWidth: 3)
                    }
                    .frame(width: 200, height: 200)
                }
            }
            """,
            contentView: AnyView(CanvasExampleView())
        ),
        
        UIComponent(
            title: "TimelineView",
            description: "A view that updates automatically at a set interval.",
            code: """
            struct TimelineExampleView: View {
                var body: some View {
                    TimelineView(.animation(minimumInterval: 1.0)) { context in
                        Text("Time: \\(Date(), style: .time)")
                            .font(.headline)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                    }
                }
            }
            """,
            contentView: AnyView(TimelineExampleView())
        ),
        
        UIComponent(
            title: "Custom Shape",
            description: "Creating a custom geometric shape.",
            code: """
            struct WaveShape: Shape {
                func path(in rect: CGRect) -> Path {
                    var path = Path()
                    path.move(to: CGPoint(x: rect.minX, y: rect.midY))
                    path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                                      control: CGPoint(x: rect.midX, y: rect.minY))
                    return path
                }
            }
            
            struct CustomShapeView: View {
                var body: some View {
                    WaveShape()
                        .stroke(Color.blue, lineWidth: 4)
                        .frame(height: 100)
                        .padding()
                }
            }
            """,
            contentView: AnyView(CustomShapeView())
        ),
        
        UIComponent(
            title: "Path & Stroke Modifications",
            description: "Custom stroke effects using `Path`.",
            code: """
            struct StrokeEffectView: View {
                var body: some View {
                    Path { path in
                        path.move(to: CGPoint(x: 50, y: 100))
                        path.addLine(to: CGPoint(x: 250, y: 100))
                    }
                    .stroke(
                        Color.blue,
                        style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10, 5])
                    )
                    .frame(height: 150)
                }
            }
            """,
            contentView: AnyView(StrokeEffectView())
        ),
        
        UIComponent(
            title: "Custom Progress Indicator",
            description: "A circular progress view with animation.",
            code: """
            struct CircularProgressView: View {
                @State private var progress: CGFloat = 0.5
                
                var body: some View {
                    VStack {
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                            .frame(width: 100, height: 100)
                        
                        Slider(value: $progress, in: 0...1)
                            .padding()
                    }
                }
            }
            """,
            contentView: AnyView(CircularProgressView())
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
struct CanvasExampleView: View {
    var body: some View {
        Canvas { context, size in
            let rect = CGRect(origin: .zero, size: size)
            context.fill(Path(rect), with: .color(.blue))
            context.stroke(Path(rect.insetBy(dx: 10, dy: 10)), with: .color(.white), lineWidth: 3)
        }
        .frame(width: 200, height: 200)
    }
}
struct TimelineExampleView: View {
    var body: some View {
        TimelineView(.animation(minimumInterval: 1.0)) { context in
            Text("Time: \(Date(), style: .time)")
                .font(.headline)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
        }
    }
}
struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                          control: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct CustomShapeView: View {
    var body: some View {
        WaveShape()
            .stroke(Color.blue, lineWidth: 4)
            .frame(height: 100)
            .padding()
    }
}
struct StrokeEffectView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 100))
            path.addLine(to: CGPoint(x: 250, y: 100))
        }
        .stroke(
            Color.blue,
            style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10, 5])
        )
        .frame(height: 150)
    }
}

struct CircularProgressViewAdv: View {
    @State private var progress: CGFloat = 0.5
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .frame(width: 100, height: 100)
            
            Slider(value: $progress, in: 0...1)
                .padding()
        }
    }
}
