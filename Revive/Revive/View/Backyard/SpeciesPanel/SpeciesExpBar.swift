//
//  SpeciesExpBar.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct SpeciesExpBar: View {
    @Environment(ReviveManager.self) var manager
    @Binding var currModule : MySpecies
    @State var totalExp : Int
    let timer = Timer.publish(every: 0.0001, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        var percentBinding: Binding<CGFloat> {
            Binding<CGFloat>(
                get: {
                    CGFloat(Double(self.currModule.currExp) / Double(self.manager.getCurrSpeciesTotalExp(id: self.currModule.speciesID, date: self.currModule.hatchDate)))
                },
                set: { _ in }
            )   
        }
        
        ZStack {
            ProgressBar(color1: Color.cYellow, color2: Color.cYellow, percent: percentBinding, widthPercent: 0.3)
                Text(
                    "\(currModule.currExp)/\(manager.getCurrSpeciesTotalExp(id: currModule.speciesID, date: currModule.hatchDate))"
                )
                .font(.caption)
                .italic()
                .bold()
                .foregroundStyle(Color.cBlackBrown)
                .onReceive(timer) { _ in
                    if manager.currTrainingState == .state2 {
                        if totalExp > 0 {
                            if manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].currExp == manager.getCurrSpeciesTotalExp(id: manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].speciesID, date: manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].hatchDate) - 1 {
                                manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].currExp = 0
                                totalExp -= 1
                                manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].level += 1
                            } else {
                                manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].currExp += 1
                                totalExp -= 1
                            }
                        } else {
                            timer.upstream.connect().cancel()
                        }
                    }
                 }
        }
    }
}
