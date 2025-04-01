//
//  TextView.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//

import SwiftUI

struct TextView: View {
    
    let components = [
        UIComponent(
            title: "Hello, SwiftUI!",
            description: "Hello, SwiftUI!",
            code:
                """
                    struct HellowText :View{
                        // Default Large Title
                        var body: some View{
                            VStack {
                                Text("Hello, SwiftUI!")
                                    .customTitleStyle()
                
                            }
                        }
                    }
                    func customTitleStyle() -> some View {
                        self
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.blue)
                    }
                """,
            contentView: AnyView(HellowText())),
        
        UIComponent(
            title: "Mulitiline",
            description: "Mulitiline",
            code:
                """
                struct Mulitiline :View{
                    // Default Large Title
                    var body: some View{
                        VStack {
                            // Multi-line Text
                            Text("This is a multi-platform text example.\nSwiftUI makes UI design simple!")
                                .font(.body)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                    }
                }
                """,
            contentView: AnyView(Mulitiline())),
        
        UIComponent(
            title: "Underlined",
            description: "Underlined",
            code:
                """
                   struct Underlined :View{
                       // Default Large Title
                       var body: some View{
                           VStack {
                               // Underlined Text
                               Text("Underlined Text")
                                   .font(.headline)
                                   .underline()
                                   .foregroundColor(.purple)
                           }
                       }
                   }
                """,
            contentView: AnyView(Underlined())),
        UIComponent(
            title: "Strikethrough",
            description: "Strikethrough",
            code:
                """
                      struct Strikethrough :View{
                          // Default Large Title
                          var body: some View{
                              VStack {
                                  // Strikethrough Text
                                  Text("Strikethrough Example")
                                      .font(.headline)
                                      .strikethrough(true, color: .red)
                              }
                          }
                      }
                """,
            contentView: AnyView(Strikethrough())),
        
        UIComponent(
            title: "ItalicStyled",
            description: "ItalicStyled",
            code:
                """
                    struct ItalicStyled :View{
                        // Default Large Title
                        var body: some View{
                            VStack {
                                // Italic Text
                                Text("Italic Styled Text")
                                    .font(.title2)
                                    .italic()
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                """,
            contentView: AnyView(ItalicStyled())),
        UIComponent(
            title: "LetterSpacing",
            description: "LetterSpacing",
            code:
                """
                       struct LetterSpacing :View{
                           // Default Large Title
                           var body: some View{
                               VStack {
                                   // Custom Letter Spacing
                                   Text("Letter Spacing Example")
                                       .font(.headline)
                                       .kerning(2)
                                       .foregroundColor(.blue)
                               }
                           }
                       }
                """,
            contentView: AnyView(LetterSpacing())),
        UIComponent(
            title: "LineSpacing",
            description: "LineSpacing",
            code:
                """
                    struct LineSpacing :View{
                        // Default Large Title
                        var body: some View{
                            VStack {
                                // Line Spacing
                                Text("Line Spacing Example\nSwiftUI makes styling text easy.")
                                    .font(.body)
                                    .lineSpacing(10)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                """,
            contentView: AnyView(LineSpacing())),
        UIComponent(
            title: "CustomFont",
            description: "CustomFont",
            code:
                """
                    struct CustomFont :View{
                        // Default Large Title
                        var body: some View{
                            VStack {
                                // Custom Font
                                Text("Custom Font Example")
                                    .font(.custom("AvenirNext-Bold", size: 22))
                                    .foregroundColor(.teal)
                
                            }
                        }
                    }
                """,
            contentView: AnyView(CustomFont())),
        UIComponent(
            title: "Highlighted",
            description: "Highlighted",
            code:
                """
                    struct Highlighted :View{
                        // Default Large Title
                        var body: some View{
                            VStack {
                                // Background Highlight
                                Text("Highlighted Text")
                                    .font(.title3)
                                    .padding(10)
                                    .background(Color.yellow)
                                    .cornerRadius(10)
                            }
                        }
                    }
                """,
            contentView: AnyView(Highlighted())),
        UIComponent(
            title: "ShadowEffect",
            description: "ShadowEffect",
            code:
                """
                    struct ShadowEffect :View{
                        // Default Large Title
                        var body: some View{
                            VStack {
                                // Shadow Effect
                                Text("Shadow Effect")
                                    .font(.title)
                                    .bold()
                                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
                            }
                        }
                    }
                """,
            contentView: AnyView(ShadowEffect())),
        
    ]
    
    struct HellowText :View{
        // Default Large Title
        var body: some View{
            VStack {
                Text("Hello, SwiftUI!")
                    .customTitleStyle()
            }
        }
    }
    struct Mulitiline :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Multi-line Text
                Text("This is a multi-platform text example.\nSwiftUI makes UI design simple!")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
    
    struct Underlined :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Underlined Text
                Text("Underlined Text")
                    .font(.headline)
                    .underline()
                    .foregroundColor(.purple)
            }
        }
    }
    struct Strikethrough :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Strikethrough Text
                Text("Strikethrough Example")
                    .font(.headline)
                    .strikethrough(true, color: .red)
            }
        }
    }
    struct ItalicStyled :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Italic Text
                Text("Italic Styled Text")
                    .font(.title2)
                    .italic()
                    .foregroundColor(.orange)
            }
        }
    }
    struct LetterSpacing :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Custom Letter Spacing
                Text("Letter Spacing Example")
                    .font(.headline)
                    .kerning(2)
                    .foregroundColor(.blue)
            }
        }
    }
    
    struct LineSpacing :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Line Spacing
                Text("Line Spacing Example\nSwiftUI makes styling text easy.")
                    .font(.body)
                    .lineSpacing(10)
                    .multilineTextAlignment(.leading)
            }
        }
    }
    struct CustomFont :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Custom Font
                Text("Custom Font Example")
                    .font(.custom("AvenirNext-Bold", size: 22))
                    .foregroundColor(.teal)
                
            }
        }
    }
    
    struct Highlighted :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Background Highlight
                Text("Highlighted Text")
                    .font(.title3)
                    .padding(10)
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
        }
    }
    
    struct ShadowEffect :View{
        // Default Large Title
        var body: some View{
            VStack {
                // Shadow Effect
                Text("Shadow Effect")
                    .font(.title)
                    .bold()
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
            }
        }
    }
    
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


extension Text {
    /// Custom Title Style
    func customTitleStyle() -> some View {
        self
            .font(.largeTitle)
            .bold()
            .foregroundColor(.blue)
    }
    
    /// Custom Subtitle Style
    func customSubtitleStyle() -> some View {
        self
            .font(.subheadline)
            .foregroundColor(.gray)
    }
    
    /// Custom Highlighted Style
    func customHighlightedStyle() -> some View {
        self
            .font(.title3)
            .padding(10)
            .background(Color.yellow)
            .cornerRadius(10)
    }
}
