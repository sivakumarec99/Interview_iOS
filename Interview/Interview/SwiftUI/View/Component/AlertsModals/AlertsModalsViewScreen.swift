//
//  AlertsModalsViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct AlertsModalsViewScreen: View {
    
    let components = [
        UIComponent(
            title: "Basic Alert",
            description: "A simple `Alert` with an OK button.",
            code: """
            struct BasicAlertView: View {
                @State private var showAlert = false
                
                var body: some View {
                    Button("Show Alert") {
                        showAlert = true
                    }
                    .alert("Hello, SwiftUI!", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
            }
            """,
            contentView: AnyView(BasicAlertView())
        ),
        
        UIComponent(
            title: "Alert with Multiple Actions",
            description: "An alert with multiple buttons.",
            code: """
            struct MultiActionAlertView: View {
                @State private var showAlert = false
                
                var body: some View {
                    Button("Show Alert") {
                        showAlert = true
                    }
                    .alert("Choose an Option", isPresented: $showAlert) {
                        Button("Delete", role: .destructive) { print("Deleted") }
                        Button("Cancel", role: .cancel) { }
                    }
                }
            }
            """,
            contentView: AnyView(MultiActionAlertView())
        ),
        
        UIComponent(
            title: "Basic Sheet",
            description: "A `Sheet` for modal presentation.",
            code: """
            struct BasicSheetView: View {
                @State private var showSheet = false
                
                var body: some View {
                    Button("Open Sheet") {
                        showSheet = true
                    }
                    .sheet(isPresented: $showSheet) {
                        VStack {
                            Text("Sheet Content")
                                .font(.largeTitle)
                            Button("Close") { showSheet = false }
                        }
                    }
                }
            }
            """,
            contentView: AnyView(BasicSheetView())
        ),
        
        UIComponent(
            title: "Popover Example",
            description: "A small pop-up view for additional information.",
            code: """
            struct PopoverExampleView: View {
                @State private var showPopover = false
                
                var body: some View {
                    Button("Show Popover") {
                        showPopover = true
                    }
                    .popover(isPresented: $showPopover) {
                        VStack {
                            Text("Popover Content")
                                .font(.headline)
                            Button("Close") { showPopover = false }
                        }
                        .padding()
                    }
                }
            }
            """,
            contentView: AnyView(PopoverExampleView())
        ),
        
        UIComponent(
            title: "Custom Styled Sheet",
            description: "A full-screen modal with custom styling.",
            code: """
            struct CustomSheetView: View {
                @State private var showSheet = false
                
                var body: some View {
                    Button("Open Custom Sheet") {
                        showSheet = true
                    }
                    .sheet(isPresented: $showSheet) {
                        VStack {
                            Text("Custom Styled Sheet")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                            Button("Dismiss") { showSheet = false }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue.ignoresSafeArea())
                    }
                }
            }
            """,
            contentView: AnyView(CustomSheetView())
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
        .navigationTitle("SwiftUI Alerts & Modals")
    }
}

struct BasicAlertView: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .alert("Hello, SwiftUI!", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct BasicSheetView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Open Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Text("Sheet Content")
                    .font(.largeTitle)
                Button("Close") { showSheet = false }
            }
        }
    }
}
struct MultiActionAlertView: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .alert("Choose an Option", isPresented: $showAlert) {
            Button("Delete", role: .destructive) { print("Deleted") }
            Button("Cancel", role: .cancel) { }
        }
    }
}

struct PopoverExampleView: View {
    @State private var showPopover = false
    
    var body: some View {
        Button("Show Popover") {
            showPopover = true
        }
        .popover(isPresented: $showPopover) {
            VStack {
                Text("Popover Content")
                    .font(.headline)
                Button("Close") { showPopover = false }
            }
            .padding()
        }
    }
}


struct CustomSheetView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Open Custom Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Text("Custom Styled Sheet")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Button("Dismiss") { showSheet = false }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.ignoresSafeArea())
        }
    }
}
