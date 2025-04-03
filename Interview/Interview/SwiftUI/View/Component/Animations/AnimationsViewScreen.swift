//
//  AnimationsViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct AnimationsViewScreen: View {
    
    let components = [
        UIComponent(
            title: "Basic Animation",
            description: "Implicit animation using `.animation()` modifier.",
            code: """
            struct BasicAnimationView: View {
                @State private var isExpanded = false
                
                var body: some View {
                    VStack {
                        Button("Animate") {
                            isExpanded.toggle()
                        }
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: isExpanded ? 200 : 100, height: 100)
                            .animation(.easeInOut(duration: 0.5), value: isExpanded)
                    }
                }
            }
            """,
            contentView: AnyView(BasicAnimationView())
        ),
        
        UIComponent(
            title: "Spring Animation",
            description: "Adding a bouncing effect using `.spring()`.",
            code: """
            struct SpringAnimationView: View {
                @State private var isBouncing = false
                
                var body: some View {
                    VStack {
                        Button("Spring Bounce") {
                            isBouncing.toggle()
                        }
                        Circle()
                            .frame(width: 100, height: 100)
                            .offset(y: isBouncing ? -50 : 50)
                            .animation(.spring(response: 0.5, dampingFraction: 0.4), value: isBouncing)
                    }
                }
            }
            """,
            contentView: AnyView(SpringAnimationView())
        ),
        
        UIComponent(
            title: "Scale & Opacity Animation",
            description: "Smooth resizing and fading effects.",
            code: """
            struct ScaleOpacityAnimationView: View {
                @State private var isVisible = false
                
                var body: some View {
                    VStack {
                        Button("Fade & Scale") {
                            isVisible.toggle()
                        }
                        Circle()
                            .frame(width: 100, height: 100)
                            .opacity(isVisible ? 1.0 : 0.2)
                            .scaleEffect(isVisible ? 1.5 : 0.8)
                            .animation(.easeInOut(duration: 0.5), value: isVisible)
                    }
                }
            }
            """,
            contentView: AnyView(ScaleOpacityAnimationView())
        ),
        
        UIComponent(
            title: "Rotation Effect",
            description: "Rotating a shape with animation.",
            code: """
            struct RotationAnimationView: View {
                @State private var rotationAngle: Double = 0
                
                var body: some View {
                    VStack {
                        Button("Rotate") {
                            rotationAngle += 90
                        }
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .rotationEffect(.degrees(rotationAngle))
                            .animation(.easeInOut(duration: 0.5), value: rotationAngle)
                    }
                }
            }
            """,
            contentView: AnyView(RotationAnimationView())
        ),
        
        UIComponent(
            title: "Matched Geometry Effect",
            description: "Advanced animation between views.",
            code: """
            struct MatchedGeometryEffectView: View {
                @Namespace private var animationNamespace
                @State private var isExpanded = false
                
                var body: some View {
                    VStack {
                        if isExpanded {
                            Circle()
                                .matchedGeometryEffect(id: "shape", in: animationNamespace)
                                .frame(width: 200, height: 200)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .matchedGeometryEffect(id: "shape", in: animationNamespace)
                                .frame(width: 100, height: 100)
                        }
                        Button("Toggle") {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }
                    }
                }
            }
            """,
            contentView: AnyView(MatchedGeometryEffectView())
        ),
        
        UIComponent(
            title: "Custom Timing Curve Animation",
            description: "Using a custom bezier curve for smooth animation.",
            code: """
            struct CustomCurveAnimationView: View {
                @State private var isAnimating = false
                
                var body: some View {
                    VStack {
                        Button("Animate") {
                            isAnimating.toggle()
                        }
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .offset(y: isAnimating ? 100 : -100)
                            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 1), value: isAnimating)
                    }
                }
            }
            """,
            contentView: AnyView(CustomCurveAnimationView())
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
        .navigationTitle("SwiftUI Animations & Effects")
    }
}

struct BasicAnimationView: View {
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            Button("Animate") {
                isExpanded.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isExpanded ? 200 : 100, height: 100)
                .animation(.easeInOut(duration: 0.5), value: isExpanded)
        }
    }
}
struct SpringAnimationView: View {
    @State private var isBouncing = false
    
    var body: some View {
        VStack {
            Button("Spring Bounce") {
                isBouncing.toggle()
            }
            Circle()
                .frame(width: 100, height: 100)
                .offset(y: isBouncing ? -50 : 50)
                .animation(.spring(response: 0.5, dampingFraction: 0.4), value: isBouncing)

        }
       
    }
}
struct ScaleOpacityAnimationView: View {
    @State private var isVisible = false
    
    var body: some View {
        VStack {
            Button("Fade & Scale") {
                isVisible.toggle()
            }
            Circle()
                .frame(width: 100, height: 100)
                .opacity(isVisible ? 1.0 : 0.2)
                .scaleEffect(isVisible ? 1.5 : 0.8)
                .animation(.easeInOut(duration: 0.5), value: isVisible)
        }
    }
}
struct RotationAnimationView: View {
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        VStack {
            Button("Rotate") {
                rotationAngle += 90
            }
            Rectangle()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotationAngle))
                .animation(.easeInOut(duration: 0.5), value: rotationAngle)
        }
    }
}
struct MatchedGeometryEffectView: View {
    @Namespace private var animationNamespace
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            if isExpanded {
                Circle()
                    .matchedGeometryEffect(id: "shape", in: animationNamespace)
                    .frame(width: 200, height: 200)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: "shape", in: animationNamespace)
                    .frame(width: 100, height: 100)
            }
            Button("Toggle") {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
    }
}
struct CustomCurveAnimationView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: 100, height: 100)
                .offset(y: isAnimating ? 100 : -100)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 1), value: isAnimating)
            Spacer()
            Button("Animate") {
                isAnimating.toggle()
            }
        }
    }
}
