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
            ZStack {
                Button(action: { withAnimation(.spring(duration: 0.2)) { details = true }}, label: {
                    if (!details) {
                        switch manager.currPanelSpecies?.friendship {
                            
                        case .some(let friendship) where friendship < 30:
                            FriendshipImage(imageName: "FriendshipLevel1")
                            
                        case.some(let friendship) where friendship < 120:
                            FriendshipImage(imageName: "FriendshipLevel2")
                            
                        case.some(let friendship) where friendship < 300:
                            FriendshipImage(imageName: "FriendshipLevel3")
                            
                        case.some(let friendship) where friendship < 900:
                            FriendshipImage(imageName: "FriendshipLevel4")
                            
                        case.some(let friendship) where friendship < 1800:
                            FriendshipImage(imageName: "FriendshipLevel5")
                            
                        default:
                            FriendshipImage(imageName: "FriendshipLevel6")
                        }
                    }
                })
                
                // Friendship details
                if (details) {
                    SpeciesFriendshipDetails(details: $details)
                        .frame(width: 46, height: 38)
                }
            }
            
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
