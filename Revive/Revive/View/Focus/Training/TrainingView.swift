//
//  TrainingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/17/23.
//

import SwiftUI

struct TrainingView: View {
    @Environment(ReviveManager.self) var manager
    private let adaptiveCloumns = [GridItem(.adaptive(minimum: 73))]
    
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
                let speciesImage = String(format: "%03d", manager.currTrainingSpecies?.speciesID ?? 0)
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .padding(15)
            } else {
                VStack {
                    Text("Select a Species for training")
                        .font(.custom("Georgia-Italic", size: 15))
                        .bold()
                        .foregroundStyle(Color.black)
                        //.background(Color.cDarkOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    ScrollView {
                        LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                            ForEach(manager.mySpecies.indices, id: \.self) { i in
                                SpeciesListImage(mode: "Training", currSpecies: $manager.mySpecies[i], currModule: $manager.currTrainingSpecies)
                            }
                        })
                    }
                    .padding()
                    .background(Color.cDarkBrown)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        }
    }
}
