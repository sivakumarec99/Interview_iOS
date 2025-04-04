//
//  SplitView.swift
//  Interview
//
//  Created by JIDTP1408 on 04/04/25.
//

import Foundation
import SwiftUI
#if os(macOS)
struct SplitViewScreen :View {
    
    let components = [
    
        UIComponent(
            title: "Horizontal Split View",
            description: "A resizable layout that arranges views horizontally with a divider.",
            code: """
            struct HorizontalSplitViewExample: View {
                var body: some View {
                    HSplitView {
                        VStack {
                            Text("Left Pane")
                                .font(.title)
                            Spacer()
                        }
                        .frame(minWidth: 100)
                        .padding()
                        .background(Color.gray.opacity(0.2))

                        VStack {
                            Text("Right Pane")
                                .font(.title)
                            Spacer()
                        }
                        .frame(minWidth: 100)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                    }
                    .frame(minWidth: 400, minHeight: 300)
                }
            }
            """,
            contentView: AnyView(HorizontalSplitViewExample())
        ),
        UIComponent(
            title: "Vertical Split View",
            description: "A resizable layout that arranges views vertically with a divider.",
            code: """
            struct VerticalSplitViewExample: View {
                var body: some View {
                    VSplitView {
                        VStack {
                            Text("Top Pane")
                                .font(.title)
                            Spacer()
                        }
                        .frame(minHeight: 100)
                        .padding()
                        .background(Color.green.opacity(0.2))

                        VStack {
                            Text("Bottom Pane")
                                .font(.title)
                            Spacer()
                        }
                        .frame(minHeight: 100)
                        .padding()
                        .background(Color.orange.opacity(0.2))
                    }
                    .frame(minWidth: 400, minHeight: 300)
                }
            }
            """,
            contentView: AnyView(VerticalSplitViewExample())
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


struct VerticalSplitViewExample: View {
    var body: some View {
        VSplitView {
            VStack {
                Text("Top Pane")
                    .font(.title)
                Spacer()
            }
            .frame(minHeight: 100)
            .padding()
            .background(Color.green.opacity(0.2))

            VStack {
                Text("Bottom Pane")
                    .font(.title)
                Spacer()
            }
            .frame(minHeight: 100)
            .padding()
            .background(Color.orange.opacity(0.2))
        }
        .frame(minWidth: 400, minHeight: 300)
    }
}

struct HorizontalSplitViewExample: View {
    var body: some View {
        HSplitView {
            VStack {
                Text("Left Pane")
                    .font(.title)
                Spacer()
            }
            .frame(minWidth: 100)
            .padding()
            .background(Color.gray.opacity(0.2))

            VStack {
                Text("Right Pane")
                    .font(.title)
                Spacer()
            }
            .frame(minWidth: 100)
            .padding()
            .background(Color.blue.opacity(0.2))
        }
        .frame(minWidth: 400, minHeight: 300)
    }
}

#endif
