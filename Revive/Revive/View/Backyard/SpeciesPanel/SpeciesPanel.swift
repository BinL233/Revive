//
//  SpeciesPanel.swift
//  Revive
//
//  Created by Kaile Ying on 11/10/23.
//

import SwiftUI

struct SpeciesPanel: View {
    @Environment(ReviveManager.self) var manager
    @State private var nickName : String = ""
    @FocusState private var isTextFieldFocused: Bool
    
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
                        
                            if let speciesBinding = manager.nonOptionalBinding($manager.currPanelSpecies) {
                                SpeciesExpBar(currModule: speciesBinding, totalExp: 0)
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
            HStack {
                SpeciesPanelImage(currPanelSpecies: $manager.currPanelSpecies)
            }
        }
    }
}
