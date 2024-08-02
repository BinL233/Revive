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
    
    var body: some View {
        
        ZStack {
            Ellipse()
                .fill(.gray)
                .opacity(0.5)
                .frame(width: 90, height: 35)
                .scaledToFit()
                .offset(CGSize(width: 0, height: 46))
            
//            Image(String(manager.currHatchingEgg))
//                .resizable()
//                .scaledToFit()
//                .frame(width: 120)
            
            if animationType == "idle" {
                RegularAnimationView(action: .idle, animationType: $animationType, sequenceIdle: 50, sequenceTouch: 30, speciesId: String(manager.currHatchingEgg), minimumInterval: 0.1)
                    .shadow(radius: 6, x: 0, y: 4)
                    .onTapGesture {
                        animationType = "touch"
                    }
            } else if animationType == "touch" {
                RegularAnimationView(action: .touch, animationType: $animationType, sequenceIdle: 50, sequenceTouch: 30, speciesId: String(manager.currHatchingEgg), minimumInterval: 0.1)
                    .shadow(radius: 6, x: 0, y: 4)
            }
            
        }
    }
}

@available(iOS 16.0, *)
struct HatchingView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @State private var currentFrame = 0
    @State var animationType: String = "idle"
    
    var body: some View {
        ZStack {
            Ellipse()
                .fill(.gray)
                .opacity(0.5)
                .frame(width: 90, height: 35)
                .scaledToFit()
                .offset(CGSize(width: 0, height: 46))
            
//            Image(String(manager.currHatchingEgg))
//                .resizable()
//                .scaledToFit()
//                .frame(width: 120)
            
            if animationType == "idle" {
                RegularAnimationView(action: .idle, animationType: $animationType, sequenceIdle: 51, sequenceTouch: 31, speciesId: String(manager.currHatchingEgg), minimumInterval: 0.1)
                    .shadow(radius: 6, x: 0, y: 4)
                    .onTapGesture {
                        animationType = "touch"
                    }
            } else if animationType == "touch" {
                RegularAnimationView(action: .touch, animationType: $animationType, sequenceIdle: 51, sequenceTouch: 31, speciesId: String(manager.currHatchingEgg), minimumInterval: 0.1)
                    .shadow(radius: 6, x: 0, y: 4)
            }
        }
    }
}
