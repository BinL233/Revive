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
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        
        if currPanelSpecies != nil {
            if scenePhase == .active {
                if animationType == "idle" {
                    RegularAnimationView(action: .idle, animationType: $animationType, speciesId: String(format: "%03d", currPanelSpecies!.speciesID))
                        .shadow(radius: 6, x: 0, y: 4)
                        .onTapGesture {
                            animationType = "touch"
                        }
                } else if animationType == "touch" {
                    RegularAnimationView(action: .touch, animationType: $animationType, speciesId: String(format: "%03d", currPanelSpecies!.speciesID))
                        .shadow(radius: 6, x: 0, y: 4)
                }
            } else if scenePhase == .background {
                let speciesImage = String(format: "%03d", currPanelSpecies!.speciesID)
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 6, x: 0, y: 4)
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

@available(iOS 16.0, *)
struct SpeciesPanelImage_ios16: View {
    @Binding var currPanelSpecies : MySpecies?
    @State private var currentFrame = 0
    @State var animationType: String = "idle"
    @EnvironmentObject var manager: ReviveManager_ios16
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        
        if currPanelSpecies != nil {
            if scenePhase == .active {
                if animationType == "idle" {
                    RegularAnimationView(action: .idle, animationType: $animationType, speciesId: String(format: "%03d", currPanelSpecies!.speciesID))
                        .shadow(radius: 6, x: 0, y: 4)
                        .onTapGesture {
                            animationType = "touch"
                        }
                } else if animationType == "touch" {
                    RegularAnimationView(action: .touch, animationType: $animationType, speciesId: String(format: "%03d", currPanelSpecies!.speciesID))
                        .shadow(radius: 6, x: 0, y: 4)
                }
            } else if scenePhase == .background {
                let speciesImage = String(format: "%03d", currPanelSpecies!.speciesID)
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 6, x: 0, y: 4)
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
