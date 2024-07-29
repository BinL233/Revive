//
//  BackyardAnimationView.swift
//  Revive
//
//  Created by Kaile Ying on 7/16/24.
//

import SwiftUI

struct BackyardAnimationView: View {
    @State private var currentFrame = 0
    @State var frames : [String]
    @State var isIdle : Bool
    @Binding var animationType: String
    let sequenceIdle = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let sequenceTouch = [0, 1, 2, 3, 4, 5, 6, 7]
    let speciesId : String
        
    var body: some View {
        TimelineView(.animation(minimumInterval: 0.15, paused: false)) { context in
            if #available(iOS 17.0, *) {
                if let image = UIImage(named: speciesId + frames[isIdle ? sequenceIdle[currentFrame] : sequenceTouch[currentFrame]]) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .onChange(of: context.date) {
                            currentFrame = isIdle ? (currentFrame + 1) % sequenceIdle.count : (currentFrame + 1) % sequenceTouch.count
                            if (!isIdle && currentFrame == sequenceTouch.count - 1) {
                                animationType = "idle"
                            }
                        }
                }
            } else if #available(iOS 16.0, *) {
                if let image = UIImage(named: speciesId + frames[isIdle ? sequenceIdle[currentFrame] : sequenceTouch[currentFrame]]) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .onChange(of: context.date) { _ in
                            currentFrame = isIdle ? (currentFrame + 1) % sequenceIdle.count : (currentFrame + 1) % sequenceTouch.count
                            if (!isIdle && currentFrame == sequenceTouch.count - 1) {
                                animationType = "idle"
                            }
                        }
                }
            }
        }
    }
}