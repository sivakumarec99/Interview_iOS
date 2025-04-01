//
//  ButtonView.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    
    let components = [
        UIComponent(
            title: "Default Button",
            description: "A simple button with an action.",
            code:
                """
                struct DefaultButton: View {
                    var body: some View {
                        Button("Tap Me") {
                            print("Button tapped!")
                        }
                        .padding()
                    }
                }
                """,
            contentView: AnyView(DefaultButton())),
        
        UIComponent(
            title: "Bordered Button",
            description: "A button with a bordered style.",
            code:
                """
                struct BorderedButton: View {
                    var body: some View {
                        Button("Bordered") {
                            print("Bordered Button tapped!")
                        }
                        .buttonStyle(.bordered)
                        .padding()
                    }
                }
                """,
            contentView: AnyView(BorderedButton())),
        
        UIComponent(
            title: "Gradient Button",
            description: "A button with a gradient background.",
            code:
                """
                struct GradientButton: View {
                    var body: some View {
                        Button(action: {
                            print("Gradient Button tapped!")
                        }) {
                            Text("Gradient Button")
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing)
                                )
                                .cornerRadius(10)
                        }
                    }
                }
                """,
            contentView: AnyView(GradientButton())),
        
        UIComponent(
            title: "Icon Button",
            description: "A button with an SF Symbol icon.",
            code:
                """
                struct IconButton: View {
                    var body: some View {
                        Button(action: {
                            print("Icon Button tapped!")
                        }) {
                            HStack {
                                Image(systemName: "heart.fill")
                                Text("Like")
                            }
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
                """,
            contentView: AnyView(IconButton())),
        
        UIComponent(
            title: "Disabled Button",
            description: "A button that is disabled.",
            code:
                """
                struct DisabledButton: View {
                    var body: some View {
                        Button("Disabled") {
                            print("This should not be tappable.")
                        }
                        .disabled(true)
                        .padding()
                    }
                }
                """,
            contentView: AnyView(DisabledButton())),
        
        UIComponent(
            title: "Custom Styled Button",
            description: "A button with a custom modifier.",
            code:
                """
                struct CustomStyledButton: View {
                    var body: some View {
                        Button("Styled Button") {
                            print("Custom button tapped!")
                        }
                        .customButtonStyle()
                    }
                }
                """,
            contentView: AnyView(CustomStyledButton())),
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
    }
}

struct DefaultButton: View {
    var body: some View {
        Button("Tap Me") {
            print("Button tapped!")
        }
        .padding()
    }
}

struct BorderedButton: View {
    var body: some View {
        Button("Bordered") {
            print("Bordered Button tapped!")
        }
        .buttonStyle(.bordered)
        .padding()
    }
}

struct GradientButton: View {
    var body: some View {
        Button(action: {
            print("Gradient Button tapped!")
        }) {
            Text("Gradient Button")
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                )
                .cornerRadius(10)
        }
    }
}

struct IconButton: View {
    var body: some View {
        Button(action: {
            print("Icon Button tapped!")
        }) {
            HStack {
                Image(systemName: "heart.fill")
                Text("Like")
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct DisabledButton: View {
    var body: some View {
        Button("Disabled") {
            print("This should not be tappable.")
        }
        .disabled(true)
        .padding()
    }
}

struct CustomStyledButton: View {
    var body: some View {
        Button("Styled Button") {
            print("Custom button tapped!")
        }
        .customButtonStyle()
    }
}

extension Button {
    func customButtonStyle() -> some View {
        self
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}
