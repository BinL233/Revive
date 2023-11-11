//
//  SpeciesListImage.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

struct SpeciesListImage: View {
    @Environment(ReviveManager.self) var manager
    @Binding var currSpecies : MySpecies
    
    var body: some View {
        Button(action: {manager.currPanelSpecies = currSpecies}, label: {
            ZStack {
                Image("frame")
                    .resizable()
                    .scaledToFit()
                let speciesImage = String(format: "%03d", currSpecies.speciesID)
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                Image(currSpecies.favorite ? "heart_fill" : "heart")
                    .resizable()
                    .scaledToFit()
            }
        })
    }
}
