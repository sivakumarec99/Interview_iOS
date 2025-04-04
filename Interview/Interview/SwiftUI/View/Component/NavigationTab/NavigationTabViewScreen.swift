//
//  NavigationTabViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct NavigationTabViewScreen: View {
    
    let components = [
        UIComponent(
            title: "Basic NavigationView",
            description: "A simple navigation between screens.",
            code: """
            struct BasicNavigationView: View {
                var body: some View {
                    NavigationView {
                        VStack {
                            NavigationLink("Go to Detail", destination: DetailView())
                                .padding()
                        }
                        .navigationTitle("Home")
                    }
                }
            }
            
            struct DetailView: View {
                var body: some View {
                    Text("Detail Screen")
                        .font(.largeTitle)
                        .navigationTitle("Details")
                }
            }
            """,
            contentView: AnyView(BasicNavigationView())
        ),
        
        UIComponent(
            title: "Navigation with Parameters",
            description: "Passing data between views.",
            code: """
            struct ParameterNavigationView: View {
                var body: some View {
                    NavigationView {
                        VStack {
                            NavigationLink(destination: DetailView(name: "SwiftUI")) {
                                Text("Go to SwiftUI Details")
                                    .padding()
                            }
                        }
                        .navigationTitle("Home")
                    }
                }
            }
            
            struct DetailView: View {
                let name: String
                var body: some View {
                    Text("Detail for \\(name)")
                        .font(.largeTitle)
                        .navigationTitle(name)
                }
            }
            """,
            contentView: AnyView(ParameterNavigationView())
        ),
        
        UIComponent(
            title: "Custom Navigation Bar",
            description: "Navigation bar with custom buttons.",
            code: """
            struct CustomNavigationBar: View {
                var body: some View {
                    NavigationView {
                        VStack {
                            Text("Custom Navigation Bar")
                                .font(.title)
                        }
                        .navigationTitle("Custom Nav")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    print("Settings tapped")
                                }) {
                                    Image(systemName: "gear")
                                }
                            }
                        }
                    }
                }
            }
            """,
            contentView: AnyView(CustomNavigationBar())
        ),
        
        UIComponent(
            title: "Basic TabView",
            description: "A simple tab-based navigation.",
            code: """
            struct BasicTabView: View {
                var body: some View {
                    TabView {
                        Text("Home")
                            .tabItem {
                                Label("Home", systemImage: "house")
                            }
                        
                        Text("Settings")
                            .tabItem {
                                Label("Settings", systemImage: "gear")
                            }
                    }
                }
            }
            """,
            contentView: AnyView(BasicTabView())
        ),
        
        UIComponent(
            title: "TabView with Icons",
            description: "Tabs with icons and labels.",
            code: """
            struct IconTabView: View {
                var body: some View {
                    TabView {
                        Text("Dashboard")
                            .tabItem {
                                Label("Dashboard", systemImage: "chart.bar")
                            }
                        
                        Text("Profile")
                            .tabItem {
                                Label("Profile", systemImage: "person")
                            }
                    }
                }
            }
            """,
            contentView: AnyView(IconTabView())
        ),
        
        UIComponent(
            title: "Advanced TabView",
            description: "TabView with animations and badge counts.",
            code: """
            struct AdvancedTabView: View {
                @State private var badgeCount = 5
                
                var body: some View {
                    TabView {
                        Text("Inbox")
                            .tabItem {
                                Label("Inbox", systemImage: "envelope.badge")
                            }
                            .badge(badgeCount)
                        
                        Text("Notifications")
                            .tabItem {
                                Label("Notifications", systemImage: "bell")
                            }
                    }
                }
            }
            """,
            contentView: AnyView(AdvancedTabView())
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
        .navigationTitle("SwiftUI Navigation & TabView")
    }
}


struct BasicNavigationView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Go to Detail", destination: DetailView())
                    .padding()
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail Screen")
            .font(.largeTitle)
            .navigationTitle("Details")
    }
}

struct ParameterNavigationView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailView1(name: "SwiftUI")) {
                    Text("Go to SwiftUI Details")
                        .padding()
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailView1: View {
    let name: String
    var body: some View {
        Text("Detail for \(name)")
            .font(.largeTitle)
            .navigationTitle(name)
    }
}
struct CustomNavigationBar: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Custom Navigation Bar")
                    .font(.title)
            }
            .navigationTitle("Custom Nav")
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Settings tapped")
                    }) {
                        Image(systemName: "gear")
                    }
                }
                #elseif os(macOS)
                ToolbarItem {
                    Button(action: {
                        print("Settings tapped")
                    }) {
                        Label("Settings", systemImage: "gear")
                    }
                }
                #endif
            }
        }
    }
}

struct BasicTabView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct IconTabView: View {
    var body: some View {
        TabView {
            Text("Dashboard")
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct AdvancedTabView: View {
    @State private var badgeCount = 5
    
    var body: some View {
        TabView {
            Text("Inbox")
                .tabItem {
                    Label("Inbox", systemImage: "envelope.badge")
                }
                .badge(badgeCount)
            
            Text("Notifications")
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }
                .badge(10)
            
        }
    }
}
