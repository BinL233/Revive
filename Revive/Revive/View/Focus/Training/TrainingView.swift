//
//  TrainingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/17/23.
//

import SwiftUI

struct TrainingView: View {
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
            ScrollView {
                LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                    ForEach(manager.mySpecies.indices, id: \.self) { i in
                        SpeciesListImage(currSpecies: $manager.mySpecies[i], currModule: $manager.currTrainingSpecies)
                    }
                })
            }
            .background(Color.cDarkBrown)
        }
    }
}
