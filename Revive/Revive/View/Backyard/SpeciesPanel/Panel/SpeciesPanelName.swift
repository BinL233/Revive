//
//  SpeciesPanelName.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import SwiftUI

struct SpeciesPanelName: View {
    @Environment(ReviveManager.self) var manager
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        @Bindable var manager = manager
        
        HStack {
            Button(action: { isTextFieldFocused = true }, label: {
                    Image(systemName: "square.and.pencil")
                    .tint(.gray)
                    .opacity(0)
                    .font(.title3)
                    .disabled(true)
                })
            TextField("Nick Name",
                      text: Binding(
                        get: { manager.mySpecies[manager.getSpeciesIndex(id: manager.currPanelSpecies!.speciesID, date: manager.currPanelSpecies!.hatchDate)].nickName },
                        set: {
                            let trimmedString = $0.trimmingCharacters(in: .whitespacesAndNewlines)

                            if trimmedString.isEmpty {
                                manager.mySpecies[manager.getSpeciesIndex(id: manager.currPanelSpecies!.speciesID, date: manager.currPanelSpecies!.hatchDate)].nickName = manager.getSpecies(mySpecies: manager.currPanelSpecies!).name
                            } else {
                                let newValue = String(trimmedString.prefix(10))
                                manager.mySpecies[manager.getSpeciesIndex(id: manager.currPanelSpecies!.speciesID, date: manager.currPanelSpecies!.hatchDate)].nickName = newValue
                            }
                        })
                      )
                .font(.system(size: 25))
                .italic()
                .bold()
                .foregroundStyle(manager.getSpecies(mySpecies: manager.currPanelSpecies!).rarity == "R" ? .blue : .purple)
                .focused($isTextFieldFocused)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
                .onSubmit {
                    DataManager.shared.updateMySpeciesNickName(for: manager.currPanelSpecies?.speciesID ?? 0, with: manager.mySpecies[manager.getSpeciesIndex(id: manager.currPanelSpecies!.speciesID, date: manager.currPanelSpecies!.hatchDate)].nickName, mySpecies: manager.mySpecies)
                }
        
            Button(action: { isTextFieldFocused = true }, label: {
                    Image(systemName: "square.and.pencil")
                    .tint(.gray)
                    .opacity(0.5)
                    .font(.title3)
                })
        }
    }
}
