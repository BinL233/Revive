//
//  ExploringView.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import SwiftUI

struct ExploringView: View {
    @Environment(ReviveManager.self) var manager
    private let adaptiveCloumns = [GridItem(.adaptive(minimum: 70))]
    
    var body: some View {
        @Bindable var manager = manager
        if manager.mySpecies.count == 0 {
            Text("Let's hatch one Species!")
                .font(.custom("Georgia-Italic", size: 20))
                .padding(15)
                .bold()
                .foregroundStyle(Color.cBlack)
        } else {
            if manager.isTimerStart {
                let speciesImage = String(format: "%03d", manager.currExploringSpecies?.speciesID ?? 0)
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .padding(15)
            } else {
                ScrollView {
                    LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                        ForEach(manager.mySpecies.indices, id: \.self) { i in
                            SpeciesListImage(currSpecies: $manager.mySpecies[i], currModule: $manager.currExploringSpecies)
                        }
                    })
                }
                .background(Color.cDarkBrown)
            }
        }
    }
}

#Preview {
    ExploringView()
        .environment(ReviveManager())
}
