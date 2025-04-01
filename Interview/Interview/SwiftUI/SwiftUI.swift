//
//  SwiftUI.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//

import Foundation
import SwiftUI

struct SwiftUIView : View {
    var body: some View {
        ComponentListView()
    }
}
struct ComponentListView: View {
    let components: [UIComponent] = [
        UIComponent(
            title: "Text View",
            description: "A simple text component in SwiftUI.",
            code: """
            struct SwiftUIView: View {
                var body: some View {
                    Text("Show Swift UI")
                }
            }
            """, contentView: AnyView(TextView())
        ),
        UIComponent(
            title: "Button View",
            description: "A SwiftUI button example.",
            code: """
            struct ButtonView: View {
                var body: some View {
                    Button("Tap Me") {
                        print("Button Tapped")
                    }
                }
            }
            """, contentView: AnyView(ButtonView())
        ),
        UIComponent(
            title: "Image View",
            description: "A SwiftUI Image example.",
            code: """
            struct ImageView: View {
                var body: some View {
                    VStack {
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.green)
                    }
                    .padding()
                }
            }
            """, contentView: AnyView(ImageView())
        )
    ]

    var body: some View {
        NavigationView {
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
            .navigationTitle("SwiftUI Components")
        }
    }
}

struct TextView: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
            
            Text("This is a multi-platform text example.")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct ButtonView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Button Clicked!")
            }) {
                Text("Click Me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ImageView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
        }
        .padding()
    }
}


