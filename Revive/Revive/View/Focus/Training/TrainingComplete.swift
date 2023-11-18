//
//  TrainingComplete.swift
//  Revive
//
//  Created by Kaile Ying on 11/17/23.
//

import SwiftUI

struct TrainingComplete: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        ZStack {
            Color.init(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(radius: 6, x: 0, y: 4)
            VStack {
                Text("Training Complete!")
                    .font(.custom("Georgia-Italic", size: 20))
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                    .shadow(radius: 0.7, x: 0, y: 2)
                    .padding(15)
                    .background(Color.cLightYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 0.7, x: 0, y: 2)
                
                if let species = manager.currTrainingSpecies {
                    let speciesImage = String(format: "%03d", species.speciesID)
                    
                    HStack {
                        Text("Lv")
                            .font(.title2)
                            .italic()
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                        
                        withAnimation(.bouncy){ Text("\(manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies?.speciesID ?? 0, date: manager.currTrainingSpecies?.hatchDate ?? "")].level)")
                                .font(.title)
                                .italic()
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                        }
                    }
                    
                    let intValue = manager.testMode == .on ? Int($manager.selectedTime.wrappedValue) * 100 : Int($manager.selectedTime.wrappedValue)
                    SpeciesExpBar(currModule: $manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies?.speciesID ?? 0, date: manager.currTrainingSpecies?.hatchDate ?? "")], totalExp: intValue)
                    
                    Image(speciesImage)
                        .resizable()
                        .scaledToFill()
                        .shadow(radius: 6, x: 0, y: 4)
                }
                
                Button(action: {
                    withAnimation{manager.changeToTrainingState1()}
                }) {
                    Text("Got it")
                        .font(.custom("Georgia-Italic", size: 20))
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding(15)
                .background(manager.isExpGain ? Color.cDarkOrange : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 4, x: 0, y: 4)
                .disabled(!manager.isExpGain)
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 180)
    }
}
