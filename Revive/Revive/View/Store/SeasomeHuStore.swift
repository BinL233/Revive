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
        
        ZStack {
            if animationType == "idle" {
                RegularAnimationView(action: .idle, animationType: $animationType, sequenceIdle: 25, sequenceTouch: 15, speciesId: "4001", minimumInterval: 0.1)
            } else if animationType == "purchase" {
                RegularAnimationView(action: .idle, animationType: $animationType, sequenceIdle: 25, sequenceTouch: 15, speciesId: "4001", minimumInterval: 0.1)
            } else {
                RegularAnimationView(action: .touch, animationType: $animationType, sequenceIdle: 25, sequenceTouch: 15, speciesId: "4001", minimumInterval: 0.1)
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
        
        ZStack {
            if animationType == "idle" {
                RegularAnimationView(action: .idle, animationType: $animationType, sequenceIdle: 25, sequenceTouch: 15, speciesId: "4001", minimumInterval: 0.1)
            } else if animationType == "purchase" {
                RegularAnimationView(action: .idle, animationType: $animationType, sequenceIdle: 25, sequenceTouch: 15, speciesId: "4001", minimumInterval: 0.1)
            } else {
                RegularAnimationView(action: .touch, animationType: $animationType, sequenceIdle: 25, sequenceTouch: 15, speciesId: "4001", minimumInterval: 0.1)
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
