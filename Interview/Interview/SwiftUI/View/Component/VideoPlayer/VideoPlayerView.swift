//
//  VideoPlayerView.swift
//  Interview
//
//  Created by JIDTP1408 on 07/04/25.
//

import Foundation
import SwiftUI
import AVKit

struct VideoPlayerView :View {
    let components = [
        UIComponent(
            title: "Video Player",
            description: "Plays a video using SwiftUI's built-in VideoPlayer from AVKit.",
            code: """
            import SwiftUI
            import AVKit

            struct VideoPlayerExampleView: View {
                private let player = AVPlayer(url: URL(string: "https://www.w3schools.com/html/mov_bbb.mp4")!)

                var body: some View {
                    VideoPlayer(player: player)
                        .frame(height: 250)
                        .onAppear {
                            player.play()
                        }
                        .cornerRadius(10)
                        .padding()
                }
            }
            """,
            contentView: AnyView(VideoPlayerExampleView())
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


struct VideoPlayerExampleView: View {
    private let player = AVPlayer(url: URL(string: "https://www.w3schools.com/html/mov_bbb.mp4")!)

    var body: some View {
        VideoPlayer(player: player)
            .frame(height: 250)
            .onAppear {
                player.play()
            }
            .cornerRadius(10)
            .padding()
    }
}
