//
//  Animation.swift
//  Revive
//
//  Created by Kaile Ying on 12/7/23.
//

import SwiftUI

struct AnimationView: View {
    @State private var currentFrame = 0
    @State var frames : [String]
    let sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    var body: some View {
        TimelineView(.animation(minimumInterval: 0.1, paused: false)) { context in
            if let image = UIImage(named: frames[sequence[currentFrame]]) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .onChange(of: context.date) {
                        currentFrame = (currentFrame + 1) % sequence.count
                    }
            }
        }
    }
}
