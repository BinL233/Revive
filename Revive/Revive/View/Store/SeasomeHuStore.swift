//
//  SeasomeHuStore.swift
//  Revive
//
//  Created by Kaile Ying on 12/17/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SeasomeHuStore_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    @State var animationType: String = "idle"
    
    var body: some View {
        let framesIdle = manager.animations.id["4001"]?.idle
        let framesPurchase = manager.animations.id["4001"]?.purchase
        let framesTouch = manager.animations.id["4001"]?.touch
        
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
                    animationType = "touch"
                }
        }
    }
}

@available(iOS 16.0, *)
struct SeasomeHuStore_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @State var animationType: String = "idle"
    
    var body: some View {
        let framesIdle = manager.animations.id["4001"]?.idle
        let framesPurchase = manager.animations.id["4001"]?.purchase
        let framesTouch = manager.animations.id["4001"]?.touch
        
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
                    animationType = "touch"
                }
        }
    }
}
