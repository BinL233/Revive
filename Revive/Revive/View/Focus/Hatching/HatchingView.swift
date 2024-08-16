//
//  HatchingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/6/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct HatchingView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    @State private var currentFrame = 0
    @State var animationType: String = "idle"
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        ZStack {
            if scenePhase == .background {
                Image(String(manager.currHatchingEgg))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .shadow(radius: 6, x: 0, y: 4)
                    .shadow(radius: 20, x: 0, y: 18)
            } else if scenePhase == .active {
                if animationType == "idle" {
                    RegularAnimationView(action: .idle, animationType: $animationType, speciesId: String(manager.currHatchingEgg))
                        .shadow(radius: 6, x: 0, y: 4)
                        .shadow(radius: 20, x: 0, y: 18)
                        .onTapGesture {
                            animationType = "touch"
                        }
                } else if animationType == "touch" {
                    RegularAnimationView(action: .touch, animationType: $animationType, speciesId: String(manager.currHatchingEgg))
                        .shadow(radius: 6, x: 0, y: 4)
                        .shadow(radius: 20, x: 0, y: 18)
                }
            }
            
        }
    }
}

@available(iOS 16.0, *)
struct HatchingView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @State private var currentFrame = 0
    @State var animationType: String = "idle"
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        ZStack {
            if scenePhase == .background {
                Image(String(manager.currHatchingEgg))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .shadow(radius: 6, x: 0, y: 4)
                    .shadow(radius: 20, x: 0, y: 18)
            } else if scenePhase == .active {
                if animationType == "idle" {
                    RegularAnimationView(action: .idle, animationType: $animationType, sequenceIdle: 76, sequenceTouch: 46, speciesId: String(manager.currHatchingEgg), minimumInterval: 0.05)
                        .shadow(radius: 6, x: 0, y: 4)
                        .shadow(radius: 20, x: 0, y: 18)
                        .onTapGesture {
                            animationType = "touch"
                        }
                } else if animationType == "touch" {
                    RegularAnimationView(action: .touch, animationType: $animationType, sequenceIdle: 76, sequenceTouch: 46, speciesId: String(manager.currHatchingEgg), minimumInterval: 0.05)
                        .shadow(radius: 6, x: 0, y: 4)
                        .shadow(radius: 20, x: 0, y: 18)
                }
            }
        }
    }
}
