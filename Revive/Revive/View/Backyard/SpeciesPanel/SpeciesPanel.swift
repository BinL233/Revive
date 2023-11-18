//
//  SpeciesPanel.swift
//  Revive
//
//  Created by Kaile Ying on 11/10/23.
//

import SwiftUI

struct SpeciesPanel: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        VStack {
            VStack {
                if manager.currPanelSpecies == nil {
                    Text("???")
                        .font(.system(size: 25))
                        .italic()
                        .bold()
                        .foregroundStyle(Color.cBlack)
                        .padding(.bottom, 5)
                } else {
                    Text("\(manager.getSpecies(mySpecies: manager.currPanelSpecies!).name)")
                        .font(.system(size: 25))
                        .italic()
                        .bold()
                        .foregroundStyle(manager.getSpecies(mySpecies: manager.currPanelSpecies!).rarity == "R" ? .blue : .purple)
                        .padding(.bottom, 5)
                }
                
                HStack {
                    if manager.currPanelSpecies != nil {
                        HStack {
                            Text("Lv")
                                .font(.title2)
                                .italic()
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                            
                            Text("\(manager.currPanelSpecies?.level ?? 0)")
                                .font(.title)
                                .italic()
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                        }
                    }
                    
                    Spacer()
                    HStack {
                        if manager.currPanelSpecies != nil {
//                            Text("Exp:")
//                                .font(.title3)
//                                .bold()
//                                .italic()
//                                .foregroundStyle(Color.cBlackBrown)
                            ZStack {
                                ProgressBar(color1: Color.cYellow, color2: Color.cYellow, percent: CGFloat(Double(manager.currPanelSpecies?.currExp ?? 0)/Double(manager.getCurrSpeciesTotalExp(id: manager.currPanelSpecies?.speciesID ?? 0, date: manager.currPanelSpecies?.hatchDate ?? ""))), widthPercent: 0.3)
                                    Text(
                                        "\(manager.currPanelSpecies?.currExp ?? 0)/\(manager.getCurrSpeciesTotalExp(id: manager.currPanelSpecies?.speciesID ?? 0, date: manager.currPanelSpecies?.hatchDate ?? ""))"
                                    )
                                    .font(.caption)
                                    .italic()
                                    .bold()
                                    .foregroundStyle(Color.cBlackBrown)
                            }
                        }
                    }
                    Spacer()
                    
                    Button {
                        manager.currPanelSpecies?.favorite.toggle()
                        manager.SpeciesFavorToggle(id: manager.currPanelSpecies?.speciesID ?? 0, date: manager.currPanelSpecies?.hatchDate ?? "")
                        if let currPS = manager.currPanelSpecies {
                            DataManager.shared.updateMySpeciesFavorite(for: currPS.speciesID, with: currPS.favorite, mySpecies: manager.mySpecies)
                        }
                    } label: {
                        if let currPS = manager.currPanelSpecies {
                            if (currPS.favorite) {
                                Image(systemName: "heart.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.red)
                            } else {
                                Image(systemName: "heart")
                                    .font(.largeTitle)
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }
            }
            .padding()
            .background(Color.black.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            SpeciesPanelImage(currPanelSpecies: $manager.currPanelSpecies)
        }
    }
}
