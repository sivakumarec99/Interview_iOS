//
//  ComponentView.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//

import SwiftUI
#if os(macOS)
import AppKit
#else
import UIKit
#endif

struct ComponentView<Content:View>: View {
    let component: UIComponent
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView {
                Text(component.title)
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Text(component.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                content
                Spacer()
                CodeBlockView(code: component.code)
            }
            
            Button(action: {
                copyToClipboard(component.code)
            }) {
                HStack {
                    Image(systemName: "doc.on.doc")
                    Text("Copy Code")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline) // ✅ Only applied on iOS
        #endif
    }
    
    // ✅ Background color compatible with macOS & iOS
    private var backgroundColor: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.secondarySystemBackground)
        #endif
    }

    // ✅ Clipboard function for macOS & iOS
    func copyToClipboard(_ text: String) {
        #if os(macOS)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(text, forType: .string)
        #else
        UIPasteboard.general.string = text
        #endif
    }
}
struct CodeBlockView: View {
    let code: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) { // Allow horizontal scrolling
            Text(code)
                .font(.system(.body, design: .monospaced)) // Monospaced font for code
                .padding()
                .background(Color.black.opacity(0.8)) // Dark background
                .foregroundColor(.green) // Code-style text color
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
        }
    }
}
