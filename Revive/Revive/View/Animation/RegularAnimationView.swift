//
//  BackyardAnimationView.swift
//  Revive
//
//  Created by Kaile Ying on 7/16/24.
//

import SwiftUI

struct RegularAnimationView: View {
    @State private var currentFrame = 0
//    @State var frames : [String]
    @State var action : AnimationAction = .idle
    @Binding var animationType: String
    @State var sequenceIdle = 12
    @State var sequenceTouch = 7
     @State var sequencePurchase = 16
    let speciesId : String
    @State var minimumInterval = 0.15
    var currIdle = 0
    var currTouch = 0
    var currPurchase = 0
    var frame: String {
        switch action {
        case .idle:
            return "idle_" + String(currentFrame)
        case .touch:
            return "touch_" + String(currentFrame)
        case .purchase:
            return "purchase_" + String(currentFrame)
        }
    }
        
    var body: some View {
        
        TimelineView(.animation(minimumInterval: minimumInterval, paused: false)) { context in
            if #available(iOS 17.0, *) {
                if let image = UIImage(named: speciesId + "_" + frame) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .onChange(of: context.date) {
                            DispatchQueue.main.async {
                                updateFrameSequence()
                                
                                if (action != .idle && currentFrame == sequenceTouch-1) {
                                    animationType = "idle"
                                    action = .idle
                                }
                            }
                        }
                }
            } else if #available(iOS 16.0, *) {
                if let image = UIImage(named: speciesId + "_" + frame) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .onChange(of: context.date) { _ in
                            DispatchQueue.main.async {
                                updateFrameSequence()
                                
                                if (action != .idle && currentFrame == sequenceTouch-1) {
                                    animationType = "idle"
                                    action = .idle
                                }
                            }
                        }
                }
            }
        }
    }
    
    func updateFrameSequence() {
        switch action {
        case .idle:
            currentFrame = (currentFrame + 1) % sequenceIdle
        case .touch:
            currentFrame = (currentFrame + 1) % sequenceTouch
        case .purchase:
            currentFrame = (currentFrame + 1) % sequencePurchase
        }
    }
}
