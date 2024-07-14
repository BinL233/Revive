//
//  SpeciesPanel.swift
//  Revive
//
//  Created by Kaile Ying on 11/10/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SpeciesPanel_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    @State private var nickName : String = ""
    @State var details: Bool = false
    
    var body: some View {
        @Bindable var manager = manager

        ZStack {
            VStack {
                // info panel
                VStack {
                    if manager.speciesItemsSelection == .Species {
                        if manager.currPanelSpecies == nil {
                            Text("???")
                                .font(.system(size: 25))
                                .italic()
                                .bold()
                                .foregroundStyle(Color.cBlack)
                                .padding(.bottom, 5)
                                .shadow(radius: 0.7, x: 2, y: 3)
                        } else {
                            SpeciesPanelName_ios17(details: $details)
                        }
                        
                    } else {
                        if manager.currPanelItem == nil {
                            HStack {
                                Spacer()
                                
                                Text("???")
                                    .font(.system(size: 25))
                                    .italic()
                                    .bold()
                                    .foregroundStyle(Color.cBlack)
                                    .padding(.bottom, 5)
                                    .shadow(radius: 0.7, x: 2, y: 3)
                                
                                Spacer()
                            }
                            
                        } else {
                            ItemPanelName_ios17()
                        }
                    }
                    
                    if manager.speciesItemsSelection == .Items {
                        if !manager.myItems.isEmpty && manager.currPanelItem != nil {
                            HStack {
                                Spacer()
                                Text(manager.getItem(id: manager.currPanelItem!.id).description)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(nil)
                                    .font(.caption)
                                    .italic()
                                    .foregroundStyle(Color.cBlack)
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                Text(manager.getItem(id: manager.currPanelItem!.id).function)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(Color.cBlue)
                                Spacer()
                            }
                        }
                    } else {
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
                            
                            if manager.currPanelSpecies != nil {
                                if let speciesBinding = manager.nonOptionalBinding($manager.currPanelSpecies) {
                                    SpeciesExpBar_ios17(currModule: speciesBinding, totalExp: 0)
                                        .shadow(radius: 1, x: 0.5, y: 0.5)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                manager.currPanelSpecies?.favorite.toggle()
                                manager.SpeciesFavorToggle(id: manager.currPanelSpecies?.speciesID ?? 0, date: manager.currPanelSpecies?.hatchDate ?? Date())
                                if let currPS = manager.currPanelSpecies {
                                    DataManager.shared.updateMySpeciesFavorite(for: currPS.speciesID, for: currPS.hatchDate, with: currPS.favorite, mySpecies: manager.mySpecies)
                                }
                                manager.changeSpeciesListSorter()
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
                }
                .padding()
                .background(Color.black.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                
                
                VStack {
                    HStack {
                        if manager.currPanelSpecies != nil {
                            SpeciesPanelActionButtons_ios17()
                        }
                        
                        Spacer()
                        
                        if manager.speciesItemsSelection == .Species {
                            SpeciesPanelImage(currPanelSpecies: $manager.currPanelSpecies)
                        } else {
                            ItemPanelImage(currPanelItem: $manager.currPanelItem)
                        }
                        
                        Spacer()
                    }
                    
                    if manager.speciesItemsSelection == .Items && !manager.myItems.isEmpty && manager.currPanelItem != nil {
                        if !manager.getItem(id: manager.currPanelItem!.id).functionType.contains(FunctionType(rawValue: "exp")!) {
                            Button(action: {
                                manager.itemBuff()
                                manager.isItemUsed = true
                            }, label: {
                                Text("Use")
                                    .font(.custom("Georgia-Italic", size: 15))
                                    .padding(.horizontal, 30)
                                    .padding(7)
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                            })
                            .background(manager.currPanelItem!.amount <= 0 || manager.isTimerStart || manager.isItemUsed ? .gray : Color.cBlueGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 0.7, x: 2, y: 3)
                            .disabled(manager.currPanelItem!.amount <= 0 || manager.isTimerStart || manager.isItemUsed)
                        } else {
                            Button(action: {
                                manager.speciesItemsSelection = .Species
                                manager.panelInfoAction = .feed
                            }, label: {
                                Text("Use")
                                    .font(.custom("Georgia-Italic", size: 15))
                                    .padding(.horizontal, 30)
                                    .padding(7)
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                            })
                            .background(manager.currPanelItem!.amount <= 0 || manager.isTimerStart ? .gray : Color.cBlueGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 0.7, x: 2, y: 3)
                            .disabled(manager.currPanelItem!.amount <= 0 || manager.isTimerStart)

                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

@available(iOS 16.0, *)
struct SpeciesPanel_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @State private var nickName : String = ""
    @State var details: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                // info panel
                VStack {
                    if manager.speciesItemsSelection == .Species {
                        if manager.currPanelSpecies == nil {
                            Text("???")
                                .font(.system(size: 25))
                                .italic()
                                .bold()
                                .foregroundStyle(Color.cBlack)
                                .padding(.bottom, 5)
                                .shadow(radius: 0.7, x: 2, y: 3)
                        } else {
                            SpeciesPanelName_ios16(details: $details)
                        }
                        
                    } else {
                        if manager.currPanelItem == nil {
                            HStack {
                                Spacer()
                                
                                Text("???")
                                    .font(.system(size: 25))
                                    .italic()
                                    .bold()
                                    .foregroundStyle(Color.cBlack)
                                    .padding(.bottom, 5)
                                    .shadow(radius: 0.7, x: 2, y: 3)
                                
                                Spacer()
                            }
                            
                        } else {
                            ItemPanelName_ios16()
                        }
                    }
                    
                    if manager.speciesItemsSelection == .Items {
                        if !manager.myItems.isEmpty && manager.currPanelItem != nil {
                            HStack {
                                Spacer()
                                Text(manager.getItem(id: manager.currPanelItem!.id).description)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(nil)
                                    .font(.caption)
                                    .italic()
                                    .foregroundStyle(Color.cBlack)
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                Text(manager.getItem(id: manager.currPanelItem!.id).function)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(Color.cBlue)
                                Spacer()
                            }
                        }
                    } else {
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
                            
                            if manager.currPanelSpecies != nil {
                                if let speciesBinding = manager.nonOptionalBinding($manager.currPanelSpecies) {
                                    SpeciesExpBar_ios16(currModule: speciesBinding, totalExp: 0)
                                        .shadow(radius: 1, x: 0.5, y: 0.5)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                manager.currPanelSpecies?.favorite.toggle()
                                manager.SpeciesFavorToggle(id: manager.currPanelSpecies?.speciesID ?? 0, date: manager.currPanelSpecies?.hatchDate ?? Date())
                                if let currPS = manager.currPanelSpecies {
                                    DataManager.shared.updateMySpeciesFavorite(for: currPS.speciesID, for: currPS.hatchDate, with: currPS.favorite, mySpecies: manager.mySpecies)
                                }
                                manager.changeSpeciesListSorter()
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
                }
                .padding()
                .background(Color.black.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                
                
                VStack {
                    HStack {
                        if manager.currPanelSpecies != nil {
                            SpeciesPanelActionButtons_ios16()
                        }
                        
                        Spacer()
                        
                        if manager.speciesItemsSelection == .Species {
                            SpeciesPanelImage(currPanelSpecies: $manager.currPanelSpecies)
                        } else {
                            ItemPanelImage(currPanelItem: $manager.currPanelItem)
                        }
                        
                        Spacer()
                    }
                    
                    if manager.speciesItemsSelection == .Items && !manager.myItems.isEmpty && manager.currPanelItem != nil {
                        if !manager.getItem(id: manager.currPanelItem!.id).functionType.contains(FunctionType(rawValue: "exp")!) {
                            Button(action: {
                                manager.itemBuff()
                                manager.isItemUsed = true
                            }, label: {
                                Text("Use")
                                    .font(.custom("Georgia-Italic", size: 15))
                                    .padding(.horizontal, 30)
                                    .padding(7)
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                            })
                            .background(manager.currPanelItem!.amount <= 0 || manager.isTimerStart || manager.isItemUsed ? .gray : Color.cBlueGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 0.7, x: 2, y: 3)
                            .disabled(manager.currPanelItem!.amount <= 0 || manager.isTimerStart || manager.isItemUsed)
                        } else {
                            Button(action: {
                                manager.speciesItemsSelection = .Species
                                manager.panelInfoAction = .feed
                            }, label: {
                                Text("Use")
                                    .font(.custom("Georgia-Italic", size: 15))
                                    .padding(.horizontal, 30)
                                    .padding(7)
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                            })
                            .background(manager.currPanelItem!.amount <= 0 || manager.isTimerStart ? .gray : Color.cBlueGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 0.7, x: 2, y: 3)
                            .disabled(manager.currPanelItem!.amount <= 0 || manager.isTimerStart)

                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}
