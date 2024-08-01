//
//  SpeciesPanelImage.swift
//  Revive
//
//  Created by Kaile Ying on 11/10/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SpeciesPanelImage_ios17: View {
    @Binding var currPanelSpecies : MySpecies?
    @State private var currentFrame = 0
    @State var animationType: String = "idle"
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        let framesIdle = manager.animations.id["species"]?.idle
        let framesTouch = manager.animations.id["species"]?.touch
        
        if currPanelSpecies != nil {
//            if currPanelSpecies!.speciesID == 7 {
                if animationType == "idle" {
                    if let frames = framesIdle {
                        RegularAnimationView(frames: frames, isIdle: true, animationType: $animationType, speciesId: String(format: "%03d", currPanelSpecies!.speciesID))
                            .shadow(radius: 6, x: 0, y: 4)
                            .onTapGesture {
                                animationType = "touch"
                            }
                    }
                } else if animationType == "touch" {
                    if let frames = framesTouch {
                        RegularAnimationView(frames: frames, isIdle: false, animationType: $animationType, speciesId: String(format: "%03d", currPanelSpecies!.speciesID))
                            .shadow(radius: 6, x: 0, y: 4)
                    }
                }
//            } else {
//                let speciesImage = String(format: "%03d", currPanelSpecies!.speciesID)
//                Image(speciesImage)
//                    .resizable()
//                    .scaledToFit()
//                    .shadow(radius: 6, x: 0, y: 4)
//            }
        } else {
            ZStack {
                Text("?")
                    .font(.system(size: 80))
                    .italic()
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                    .shadow(radius: 6, x: 0, y: 4)
                    
            }
        }
    }
}

@available(iOS 16.0, *)
struct SpeciesPanelImage_ios16: View {
    @Binding var currPanelSpecies : MySpecies?
    @State private var currentFrame = 0
    @State var animationType: String = "idle"
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        let framesIdle = manager.animations.id["species"]?.idle
        let framesTouch = manager.animations.id["species"]?.touch
        
        if currPanelSpecies != nil {
            if animationType == "idle" {
                if let frames = framesIdle {
                    RegularAnimationView(frames: frames, isIdle: true, animationType: $animationType, speciesId: String(format: "%03d", currPanelSpecies!.speciesID))
                        .shadow(radius: 6, x: 0, y: 4)
                        .onTapGesture {
                            animationType = "touch"
                        }
                }
            } else if animationType == "touch" {
                if let frames = framesTouch {
                    RegularAnimationView(frames: frames, isIdle: false, animationType: $animationType, speciesId: String(format: "%03d", currPanelSpecies!.speciesID))
                        .shadow(radius: 6, x: 0, y: 4)
                }
            }
        } else {
            ZStack {
                Text("?")
                    .font(.system(size: 80))
                    .italic()
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                    .shadow(radius: 6, x: 0, y: 4)
                    
            }
        }
    }
}
