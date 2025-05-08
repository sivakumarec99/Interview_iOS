//
//  ResizeBox.swift
//  Interview
//
//  Created by JIDTP1408 on 07/05/25.
//

import Foundation
import SwiftUI


struct ResizeBox: View {
    var body: some View {
        VStack {
            Text("Resizable Box")
                .font(.headline)
            ResizableBox()
        }
    }
}


struct ResizableBox: View {
    @State private var boxSize: CGSize = CGSize(width: 150, height: 150)

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .fill(Color.blue)
                .frame(width: boxSize.width, height: boxSize.height)
                .cornerRadius(12)
                .shadow(radius: 5)

            ResizeHandle()
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newWidth = max(50, boxSize.width + value.translation.width)
                            let newHeight = max(50, boxSize.height + value.translation.height)
                            boxSize = CGSize(width: newWidth, height: newHeight)
                        }
                )
                .offset(x: -10, y: -10)
        }
        .padding()
    }
}

struct ResizeHandle: View {
    var body: some View {
        Image(systemName: "arrow.up.left.and.arrow.down.right")
            .padding(8)
            .background(Color.white)
            .foregroundColor(.blue)
            .clipShape(Circle())
            .shadow(radius: 2)
            .frame(width: 30, height: 30)
            .contentShape(Rectangle())
    }
}
