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
    var widthPercent : Double = 0.3
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        var boostExp : Bool = true
        var percentBinding: Binding<CGFloat> {
            Binding<CGFloat>(
                get: {
                    CGFloat(Double(self.currModule.currExp) / Double(self.manager.getCurrSpeciesTotalExp(id: self.currModule.speciesID, date: self.currModule.hatchDate)))
                },
                set: { _ in }
            )   
        }
        
        ZStack {
            ProgressBar(color1: Color.cYellow, color2: Color.cYellow, percent: percentBinding, widthPercent: widthPercent)
                Text(
                    "\(currModule.currExp)/\(manager.getCurrSpeciesTotalExp(id: currModule.speciesID, date: currModule.hatchDate))"
                )
                .font(.caption)
                .italic()
                .bold()
                .foregroundStyle(Color.cBlackBrown)
                .onAppear {
                    if totalExp > 2000 {
                        boostExp = true
                    }
                }
                .onReceive(timer) { _ in
                    if manager.currTrainingState == .state2 {
                        manager.isExpGain = false
                        if totalExp > 0 {
                            // if currExp == total Exp of this level - 1
                            if manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].currExp == manager.getCurrSpeciesTotalExp(id: manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].speciesID, date: manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].hatchDate) - 1 {
                                manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].currExp = 0
                                totalExp -= 1
                                manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].level += 1
                            } else {
                                // if currExp < total Exp of this level - 10
                                if manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].currExp < manager.getCurrSpeciesTotalExp(id: manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].speciesID, date: manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].hatchDate) - 10 && boostExp {
                                    manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].currExp += 9
                                    totalExp -= 9
                                } else {
                                    manager.mySpecies[manager.getSpeciesIndex(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate)].currExp += 1
                                    totalExp -= 1
                                }
                            }
                        } else {
                                timer.upstream.connect().cancel()
                                manager.isExpGain = true
                            }
                    }
                 }
        }
    }
}
