//
//  ImageView.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//

import Foundation
import SwiftUI

struct ImageView: View {
    
    let components = [
        UIComponent(
            title: "System Image",
            description: "Displays an SF Symbol system image.",
            code:
                """
                struct SystemImage: View {
                    var body: some View {
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.green)
                    }
                }
                """,
            contentView: AnyView(SystemImage())),
        
        UIComponent(
            title: "Local Image",
            description: "Displays an image from assets.",
            code:
                """
                struct LocalImage: View {
                    var body: some View {
                        Image("exampleImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                }
                """,
            contentView: AnyView(LocalImage())),
        
        UIComponent(
            title: "Circular Image",
            description: "An image clipped into a circle.",
            code:
                """
                struct CircularImage: View {
                    var body: some View {
                        Image("exampleImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    }
                }
                """,
            contentView: AnyView(CircularImage())),
        
        UIComponent(
            title: "Image with Border",
            description: "An image with a rounded border.",
            code:
                """
                struct BorderedImage: View {
                    var body: some View {
                        Image("exampleImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .border(Color.blue, width: 5)
                    }
                }
                """,
            contentView: AnyView(BorderedImage())),
        
        UIComponent(
            title: "Image with Shadow",
            description: "An image with a shadow effect.",
            code:
                """
                struct ShadowedImage: View {
                    var body: some View {
                        Image("exampleImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .shadow(radius: 10)
                    }
                }
                """,
            contentView: AnyView(ShadowedImage())),
        
        UIComponent(
            title: "Opacity Image",
            description: "An image with opacity effect.",
            code:
                """
                struct OpacityImage: View {
                    var body: some View {
                        Image("exampleImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .opacity(0.5)
                    }
                }
                """,
            contentView: AnyView(OpacityImage())),
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

struct SystemImage: View {
    var body: some View {
        Image(systemName: "globe")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(.green)
    }
}

struct LocalImage: View {
    var body: some View {
        Image("exampleImage")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
}

struct CircularImage: View {
    var body: some View {
        Image("exampleImage")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct BorderedImage: View {
    var body: some View {
        Image("exampleImage")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .border(Color.blue, width: 5)
    }
}

struct ShadowedImage: View {
    var body: some View {
        Image("exampleImage")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .shadow(radius: 10)
    }
}

struct OpacityImage: View {
    var body: some View {
        Image("exampleImage")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .opacity(0.5)
    }
}
