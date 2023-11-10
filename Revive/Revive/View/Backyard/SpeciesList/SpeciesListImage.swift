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
        ZStack {
            SpeciesListSingleFrame(currSpecies: $currSpecies)
            if let species = manager.currHatchingSpecies {
                let speciesImage = String(format: "%03d", species.id)
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 6, x: 0, y: 4)
                    .padding(40)
            }
        }
    }
}
