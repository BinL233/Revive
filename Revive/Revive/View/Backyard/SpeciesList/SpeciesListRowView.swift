//
//  SpeciesListRow.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

struct SpeciesListRow: View {
    @Environment(ReviveManager.self) var manager
    @Binding var currRowSpecies : [MySpecies]
    
    var body: some View {
        HStack {
            ForEach(currRowSpecies.indices, id: \.self) { i in
                SpeciesListSingleFrame(currSpecies: $currRowSpecies[i])
            }
        }
    }
}
