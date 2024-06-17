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
    @Binding var details: Bool
    
    var body: some View {
        @Bindable var manager = manager
        
        HStack {
            Button(action: { withAnimation(.spring(duration: 0.2)) { details = true }}, label: {
                if (!details) {
                    Image("FriendlinessLevel1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.cBlue.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 0.7, x: 2, y: 3)
                }
            })
            
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
                                let newValue = String(trimmedString.prefix(23))
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
            .padding(.leading, 50)
        }
        
    }
}
