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
    @State var isIdle : Bool
    @Binding var animationType: String
    let sequenceIdle = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let sequencePAT = [0, 1, 2, 3, 4, 5, 6, 7]
    
    var body: some View {
        TimelineView(.animation(minimumInterval: 0.2, paused: false)) { context in
            if #available(iOS 17.0, *) {
                if let image = UIImage(named: frames[isIdle ? sequenceIdle[currentFrame] : sequencePAT[currentFrame]]) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                        .onChange(of: context.date) {
                            currentFrame = isIdle ? (currentFrame + 1) % sequenceIdle.count : (currentFrame + 1) % sequencePAT.count
                            if (!isIdle && currentFrame == sequencePAT.count - 1) {
                                animationType = "idle"
                            }
                        }
                }
            } else if #available(iOS 16.0, *) {
                if let image = UIImage(named: frames[isIdle ? sequenceIdle[currentFrame] : sequencePAT[currentFrame]]) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                        .onChange(of: context.date) { _ in
                            currentFrame = isIdle ? (currentFrame + 1) % sequenceIdle.count : (currentFrame + 1) % sequencePAT.count
                            if (!isIdle && currentFrame == sequencePAT.count - 1) {
                                animationType = "idle"
                            }
                        }
                }
            }
        }
    }
}
