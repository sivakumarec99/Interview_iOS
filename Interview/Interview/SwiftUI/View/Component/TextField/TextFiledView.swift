//
//  TextFiled.swift
//  Interview
//
//  Created by JIDTP1408 on 02/04/25.
//

import Foundation
import SwiftUI

struct TextFieldView: View {
    
    let components = [
        UIComponent(
            title: "Basic TextField",
            description: "A simple text input field.",
            code: """
            struct BasicTextField: View {
                @State private var text: String = ""
                
                var body: some View {
                    TextField("Enter text", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
            }
            """,
            contentView: AnyView(BasicTextField())
        ),
        
        UIComponent(
            title: "SecureField",
            description: "A password input field that hides text.",
            code: """
            struct SecureTextField: View {
                @State private var password: String = ""
                
                var body: some View {
                    SecureField("Enter password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
            }
            """,
            contentView: AnyView(SecureTextField())
        ),
        
        UIComponent(
            title: "TextField with Placeholder",
            description: "A TextField with a styled placeholder.",
            code: """
            struct PlaceholderTextField: View {
                @State private var text: String = ""
                
                var body: some View {
                    TextField("Enter your name", text: $text)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding()
                }
            }
            """,
            contentView: AnyView(PlaceholderTextField())
        ),
        
        UIComponent(
            title: "Bordered TextField",
            description: "A TextField with a custom border.",
            code: """
            struct BorderedTextField: View {
                @State private var text: String = ""
                
                var body: some View {
                    TextField("Enter text", text: $text)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 2))
                        .padding()
                }
            }
            """,
            contentView: AnyView(BorderedTextField())
        ),
        
        UIComponent(
            title: "Rounded TextField",
            description: "A TextField with rounded corners and padding.",
            code: """
            struct RoundedTextField: View {
                @State private var text: String = ""
                
                var body: some View {
                    TextField("Enter text", text: $text)
                        .padding(12)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(25)
                        .padding()
                }
            }
            """,
            contentView: AnyView(RoundedTextField())
        ),
        
        UIComponent(
            title: "TextField with Validation",
            description: "A TextField that validates input.",
            code: """
            struct ValidatedTextField: View {
                @State private var email: String = ""
                @State private var isValid: Bool = true
                
                var body: some View {
                    VStack {
                        TextField("Enter email", text: $email)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(isValid ? Color.green : Color.red, lineWidth: 2))
                            .onChange(of: email) { newValue in
                                isValid = newValue.contains("@") && newValue.contains(".")
                            }
                        
                        Text(isValid ? "Valid email" : "Invalid email")
                            .foregroundColor(isValid ? .green : .red)
                            .padding(.top, 5)
                    }
                    .padding()
                }
            }
            """,
            contentView: AnyView(ValidatedTextField())
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
        .navigationTitle("SwiftUI TextField Components")
    }
}

struct BasicTextField: View {
    @State private var text: String = ""
    
    var body: some View {
        TextField("Enter text", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct SecureTextField: View {
    @State private var password: String = ""
    
    var body: some View {
        SecureField("Enter password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
struct PlaceholderTextField: View {
    @State private var text: String = ""
    
    var body: some View {
        TextField("Enter your name", text: $text)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
    }
}
struct ValidatedTextField: View {
    @State private var email: String = ""
    @State private var isValid: Bool = true
    
    var body: some View {
        VStack {
            TextField("Enter email", text: $email)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(isValid ? Color.green : Color.red, lineWidth: 2))
                .onChange(of: email) { newValue in
                    isValid = newValue.contains("@") && newValue.contains(".")
                }
            
            Text(isValid ? "Valid email" : "Invalid email")
                .foregroundColor(isValid ? .green : .red)
                .padding(.top, 5)
        }
        .padding()
    }
}
struct RoundedTextField: View {
    @State private var text: String = ""
    
    var body: some View {
        TextField("Enter text", text: $text)
            .padding(12)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(25)
            .padding()
    }
}
struct BorderedTextField: View {
    @State private var text: String = ""
    
    var body: some View {
        TextField("Enter text", text: $text)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.blue, lineWidth: 2))
            .padding()
    }
}
