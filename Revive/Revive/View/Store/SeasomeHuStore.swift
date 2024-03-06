//
//  SeasomeHuStore.swift
//  Revive
//
//  Created by Kaile Ying on 12/17/23.
//

import SwiftUI

struct SeasomeHuStore: View {
    @Environment(ReviveManager.self) var manager
    @State var animationType: String = "idle"
    
    var body: some View {
        let framesIdle = manager.animations.id["4001"]?.idle
        let framesPurchase = manager.animations.id["4001"]?.purchase
        let framesTouch = manager.animations.id["4001"]?.touch
        
        
//        Image("4001")
//            .resizable()
//            .scaledToFit()
//            .frame(width: UIScreen.main.bounds.width)
//            .clipped()
        
        ZStack {
            if animationType == "idle" {
                if let frames = framesIdle {
                    StoreAnimationView(frames: frames, isIdle: true, animationType: $animationType)
                }
            } else if animationType == "purchase" {
                if let frames = framesPurchase {
                    StoreAnimationView(frames: frames, isIdle: false, animationType: $animationType)
                }
            } else {
                if let frames = framesTouch {
                    StoreAnimationView(frames: frames, isIdle: false, animationType: $animationType)
                }
            }
            
            Circle()
                .frame(width: 150, height: 150)
                .foregroundStyle(Color.cWhite.opacity(0.01))
                .onTapGesture {
                    if let frames = framesTouch {
                        animationType = "touch"
                    }
                }
        }
    }
}
