//
//  WebViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 07/04/25.
//

import Foundation
import SwiftUI
import WebKit
struct WebViewScreen : View {
    
    let components = [
        UIComponent(
            title: "WebView",
            description: "A SwiftUI WebView using `WKWebView` with delegate support and JavaScript permission handling.",
            code: """
            import SwiftUI
            import WebKit

            struct WebView: UIViewRepresentable {
                let url: URL

                func makeCoordinator() -> Coordinator {
                    Coordinator()
                }

                func makeUIView(context: Context) -> WKWebView {
                    let config = WKWebViewConfiguration()
                    config.defaultWebpagePreferences.allowsContentJavaScript = true

                    let webView = WKWebView(frame: .zero, configuration: config)
                    webView.navigationDelegate = context.coordinator
                    webView.uiDelegate = context.coordinator
                    webView.load(URLRequest(url: url))
                    return webView
                }

                func updateUIView(_ uiView: WKWebView, context: Context) {}
            }

            class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
                func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                             initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
                    if let vc = UIApplication.shared.windows.first?.rootViewController {
                        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in completionHandler() })
                        vc.present(alert, animated: true)
                    }
                }

                func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
                    print("Started loading: \\(String(describing: webView.url))")
                }

                func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
                    print("Finished loading: \\(String(describing: webView.url))")
                }

                func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
                    print("Navigation failed: \\(error.localizedDescription)")
                }
            }

            struct WebViewComponent: View {
                var body: some View {
                    WebView(url: URL(string: "https://developer.apple.com")!)
                        .navigationTitle("Apple Developer")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            """,
            contentView: AnyView(WebViewComponent())
        ),
        UIComponent(
            title: "Simple WebView",
            description: "A lightweight SwiftUI wrapper for displaying a website using `WKWebView`.",
            code: """
            import SwiftUI
            import WebKit

            struct SimpleWebView: UIViewRepresentable {
                let url: URL

                func makeUIView(context: Context) -> WKWebView {
                    let webView = WKWebView()
                    let request = URLRequest(url: url)
                    webView.load(request)
                    return webView
                }

                func updateUIView(_ uiView: WKWebView, context: Context) {
                    // No update needed
                }
            }

            struct SimpleWebViewComponent: View {
                var body: some View {
                    SimpleWebView(url: URL(string: "https://apple.com")!)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            """,
            contentView: AnyView(SimpleWebViewComponent())
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



struct WebView: UIViewRepresentable {
    let url: URL

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences.allowsContentJavaScript = true

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        if let vc = UIApplication.shared.windows.first?.rootViewController {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in completionHandler() })
            vc.present(alert, animated: true)
        }
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Started loading: \(String(describing: webView.url))")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished loading: \(String(describing: webView.url))")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Navigation failed: \(error.localizedDescription)")
    }
}

struct WebViewComponent: View {
    var body: some View {
        WebView(url: URL(string: "https://developer.apple.com")!)
            .navigationTitle("Apple Developer")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SimpleWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No update needed
    }
}

struct SimpleWebViewComponent: View {
    var body: some View {
        SimpleWebView(url: URL(string: "https://apple.com")!)
            .edgesIgnoringSafeArea(.all)
    }
}
