//
//  Animation.swift
//  Revive
//
//  Created by Kaile Ying on 12/7/23.
//

import SwiftUI

struct StoreAnimationView: View {
    @State private var currentFrame = 0
    @State var frames : [String]
    let sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
    
    var body: some View {
        TimelineView(.animation(minimumInterval: 0.1, paused: false)) { context in
            if let image = UIImage(named: frames[sequence[currentFrame]]) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    .onChange(of: context.date) {
                        currentFrame = (currentFrame + 1) % sequence.count
                    }
            }
        }
    }
}
