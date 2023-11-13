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
            HStack {
                if manager.currPanelSpecies != nil {
                    HStack {
                        Text("Lv")
                            .font(.system(size: 35))
                            .italic()
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                        
                        Text("\(manager.currPanelSpecies?.level ?? 0)")
                            .font(.system(size: 40))
                            .italic()
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                    }

                } else {
                    HStack {
                        Text("Lv")
                            .font(.system(size: 35))
                            .italic()
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                        
                        Text("?")
                            .font(.system(size: 40))
                            .italic()
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
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
            SpeciesPanelImage(currPanelSpecies: $manager.currPanelSpecies)
        }
        .padding()
    }
}

#Preview {
    SpeciesPanel()
        .environment(ReviveManager())
}
