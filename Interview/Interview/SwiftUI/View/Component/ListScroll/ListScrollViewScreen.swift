//
//  ListScrollViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct ListScrollViewScreen: View {
    
    let components = [
        UIComponent(
            title: "Basic List",
            description: "A simple static list.",
            code: """
            struct BasicListView: View {
                var body: some View {
                    List {
                        Text("Item 1")
                        Text("Item 2")
                        Text("Item 3")
                    }
                    .navigationTitle("Basic List")
                }
            }
            """,
            contentView: AnyView(BasicListView())
        ),
        
        UIComponent(
            title: "Dynamic List",
            description: "List with `ForEach` and an array.",
            code: """
            struct DynamicListView: View {
                let items = ["Apple", "Banana", "Cherry"]
                
                var body: some View {
                    List(items, id: \\ .self) { item in
                        Text(item)
                    }
                    .navigationTitle("Dynamic List")
                }
            }
            """,
            contentView: AnyView(DynamicListView())
        ),
        
        UIComponent(
            title: "List with Sections",
            description: "Grouped list sections.",
            code: """
            struct SectionedListView: View {
                var body: some View {
                    List {
                        Section(header: Text("Fruits")) {
                            Text("Apple")
                            Text("Banana")
                        }
                        Section(header: Text("Vegetables")) {
                            Text("Carrot")
                            Text("Broccoli")
                        }
                    }
                    .navigationTitle("Sectioned List")
                }
            }
            """,
            contentView: AnyView(SectionedListView())
        ),
        
        UIComponent(
            title: "Custom List Row",
            description: "Styling list items with images.",
            code: """
            struct CustomRowListView: View {
                let items = ["Apple", "Banana", "Cherry"]
                
                var body: some View {
                    List(items, id: \\ .self) { item in
                        HStack {
                            Image(systemName: "star")
                                .foregroundColor(.yellow)
                            Text(item)
                        }
                    }
                    .navigationTitle("Custom List")
                }
            }
            """,
            contentView: AnyView(CustomRowListView())
        ),
        
        UIComponent(
            title: "Basic ScrollView",
            description: "Simple scrollable content.",
            code: """
            struct BasicScrollView: View {
                var body: some View {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(1..<10) { i in
                                Text("Item \\(i)")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue.opacity(0.3))
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("ScrollView")
                }
            }
            """,
            contentView: AnyView(BasicScrollView())
        ),
        
        UIComponent(
            title: "LazyVStack ScrollView",
            description: "Efficient scrolling with LazyVStack.",
            code: """
            struct LazyVStackScrollView: View {
                var body: some View {
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(1..<50) { i in
                                Text("Item \\(i)")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green.opacity(0.3))
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("LazyVStack")
                }
            }
            """,
            contentView: AnyView(LazyVStackScrollView())
        ),
        
        UIComponent(
            title: "Horizontal ScrollView",
            description: "Scrolling in horizontal direction.",
            code: """
            struct HorizontalScrollView: View {
                var body: some View {
                    ScrollView(.horizontal) {
                        HStack(spacing: 15) {
                            ForEach(1..<10) { i in
                                Text("Item \\(i)")
                                    .padding()
                                    .frame(width: 100)
                                    .background(Color.orange.opacity(0.3))
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Horizontal Scroll")
                }
            }
            """,
            contentView: AnyView(HorizontalScrollView())
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
        .navigationTitle("SwiftUI List & ScrollView")
    }
}

struct BasicScrollView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(1..<10) { i in
                    Text("Item \(i)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("ScrollView")
    }
}

struct BasicListView: View {
    var body: some View {
        LazyVStack(spacing: 10) {
            ForEach(1..<50) { i in
                Text("Item \(i)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Basic List")
    }
}

struct DynamicListView: View {
    let items = ["Apple", "Banana", "Cherry"]
    
    var body: some View {
        List(items, id: \ .self) { item in
            Text(item)
        }
        .navigationTitle("Dynamic List")
    }
}
struct SectionedListView: View {
    var body: some View {
        List {
            Section(header: Text("Fruits")) {
                Text("Apple")
                Text("Banana")
            }
            Section(header: Text("Vegetables")) {
                Text("Carrot")
                Text("Broccoli")
            }
        }
        .navigationTitle("Sectioned List")
    }
}
struct LazyVStackScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(1..<50) { i in
                    Text("Item \(i)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("LazyVStack")
    }
}

struct CustomRowListView: View {
    let items = ["Apple", "Banana", "Cherry"]
    
    var body: some View {
        List(items, id: \ .self) { item in
            HStack {
                Image(systemName: "star")
                    .foregroundColor(.yellow)
                Text(item)
            }
        }
        .navigationTitle("Custom List")
    }
}

struct HorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(1..<10) { i in
                    Text("Item \(i)")
                        .padding()
                        .frame(width: 100)
                        .background(Color.orange.opacity(0.3))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Horizontal Scroll")
    }
}
