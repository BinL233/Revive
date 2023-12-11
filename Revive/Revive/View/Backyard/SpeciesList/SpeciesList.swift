//
//  SpeciesList.swift
//  Revive
//
//  Created by Kaile Ying on 12/3/23.
//

import SwiftUI

struct SpeciesList: View {
    @Environment(ReviveManager.self) var manager
    private let adaptiveCloumns = [GridItem(.adaptive(minimum: 90))]
    
    var body: some View {
        @Bindable var manager = manager
        VStack (spacing: 0) {
            Picker("SpeciesOrItems", selection: $manager.speciesItemsSelection) {
                Text("Species").tag(SpeciesItems.Species)
                Text("Items").tag(SpeciesItems.Items)
            }
            .pickerStyle(.segmented)
            .padding(5)
            .background(Color.cLightBrown)
            
            if manager.speciesItemsSelection == .Species {
                HStack (spacing: 0) {
                    Spacer()
                    Text("Sorted by")
                        .bold()
                        .foregroundStyle(Color.cBlackBrown)
                    Picker("SpeciesListSorter", selection: $manager.UDSpeciesListSort) {
                        Text("Name").tag(SpeciesListSorter.name.rawValue)
                        Text("Favorite").tag(SpeciesListSorter.favorite.rawValue)
                        Text("Level").tag(SpeciesListSorter.level.rawValue)
                        Text("Rarity").tag(SpeciesListSorter.rarity.rawValue)
                        Text("Hatching Date").tag(SpeciesListSorter.hatchingDate.rawValue)
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .background(Color.white)

                ScrollView {
                    LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                        ForEach(manager.mySpecies.indices, id: \.self) { i in
                            SpeciesListImage(mode: "Backyard", currSpecies: $manager.mySpecies[i], currModule: $manager.currPanelSpecies)
                        }
                    })
                    .onAppear {
                        manager.changeSpeciesListSorter()
                    }
                    .onChange(of: manager.UDSpeciesListSort) {
                        UserDefaults.standard.set(manager.UDSpeciesListSort, forKey: "UDSpeciesListSort")
                        manager.changeSpeciesListSorter()
                    }
                }
                .background(Color.cDarkBrown)
            } else {
                if manager.myItems.count == 0 {
                    VStack {
                        Spacer()
                        Text("Oops...")
                            .font(.custom("Georgia-Italic", size: 23))
                            .bold()
                            .foregroundStyle(Color.cBlack)
                        Text("Nothing in your bag pack yet")
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding(3)
                            .bold()
                            .foregroundStyle(Color.cBlack)
                        Spacer()
                    }
                } else {
                    HStack (spacing: 0) {
                        Spacer()
                        Text("Sorted by")
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                        Picker("ItemListSorter", selection: $manager.UDItemListSort) {
                            Text("Name").tag(ItemListSorter.name.rawValue)
                            Text("Amount").tag(ItemListSorter.amount.rawValue)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .background(Color.white)
                    
                    ScrollView {
                        LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                            ForEach(manager.myItems.indices, id: \.self) { i in
                                ItemBYListImage(currItem: $manager.myItems[i], currModule: $manager.currPanelItem)
                            }
                        })
                        .onAppear {
                            manager.changeItemListSorter()
                        }
                        .onChange(of: manager.UDItemListSort) {
                            UserDefaults.standard.set(manager.UDItemListSort, forKey: "UDItemListSort")
                            manager.changeItemListSorter()
                        }
                    }
                    .background(Color.cDarkBrown)
                }
            }
        }
    }
}
