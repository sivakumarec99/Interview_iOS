//
//  LazyGrid.swift
//  Interview
//
//  Created by JIDTP1408 on 07/04/25.
//

import Foundation
import SwiftUI

struct LazyGrid :View {
    let components =  [
        UIComponent(
            title: "Lazy Grids",
            description: "A vertical and horizontal scrollable grid layout with lazy loading.",
            code: """
            struct LazyGridExampleView: View {
                let items = Array(1...20)
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
                let rows = [
                    GridItem(.fixed(80)),
                    GridItem(.fixed(80))
                ]

                var body: some View {
                    ScrollView {
                        Text("LazyVGrid")
                            .font(.headline)
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(items, id: \\.self) { item in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.blue)
                                    .frame(height: 100)
                                    .overlay(Text("Item \\(item)").foregroundColor(.white))
                            }
                        }
                        .padding()

                        Divider().padding()

                        Text("LazyHGrid")
                            .font(.headline)
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: rows, spacing: 16) {
                                ForEach(items, id: \\.self) { item in
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.green)
                                        .frame(width: 100)
                                        .overlay(Text("Item \\(item)").foregroundColor(.white))
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            """,
            contentView: AnyView(LazyGridExampleView())
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


struct LazyGridExampleView: View {
    let items = Array(1...20)
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let rows = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]

    var body: some View {
        ScrollView {
            Text("LazyVGrid")
                .font(.headline)
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue)
                        .frame(height: 100)
                        .overlay(Text("Item \(item)").foregroundColor(.white))
                }
            }
            .padding()

            Divider().padding()

            Text("LazyHGrid")
                .font(.headline)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 16) {
                    ForEach(items, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.green)
                            .frame(width: 100)
                            .overlay(Text("Item \(item)").foregroundColor(.white))
                    }
                }
                .padding()
            }
        }
    }
}
