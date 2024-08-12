//
//  BackyardAnimationView.swift
//  Revive
//
//  Created by Kaile Ying on 7/16/24.
//

import SwiftUI

struct RegularAnimationView: View {
    @State private var currentFrame = 0
    @State var action: AnimationAction = .idle
    @Binding var animationType: String
    @State var sequenceIdle = 76
    @State var sequenceTouch = 46
    @State var sequencePurchase = 17
    let speciesId: String
    @State var minimumInterval = 0.05
    @State var scaleToFit = true
    var currIdle = 0
    var currTouch = 0
    var currPurchase = 0
    @State private var timer: Timer?
    
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
        if #available(iOS 17.0, *) {
            if let image = UIImage(named: speciesId + "_" + frame) {
                if scaleToFit {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .onAppear {
                            startTimer()
                        }
                        .onDisappear {
                            stopTimer()
                        }
                } else {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .onAppear {
                            startTimer()
                        }
                        .onDisappear {
                            stopTimer()
                        }
                }
            }
        } else if #available(iOS 16.0, *) {
            if let image = UIImage(named: speciesId + "_" + frame) {
                if scaleToFit {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .onAppear {
                            startTimer()
                        }
                        .onDisappear {
                            stopTimer()
                        }
                } else {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .onAppear {
                            startTimer()
                        }
                        .onDisappear {
                            stopTimer()
                        }
                }
            }
        }
    }
    
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: minimumInterval, repeats: true) { timer in
            updateFrameSequence()
            
            if (action != .idle && currentFrame == sequenceTouch - 1) {
                animationType = "idle"
                action = .idle
                currentFrame = 0
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
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
