//
//  SpeciesListView.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

struct SpeciesListView: View {
    @Environment(ReviveManager.self) var manager
    private let adaptiveCloumns = [GridItem(.adaptive(minimum: 90))]
    
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            if manager.speciesItemsSelection == .Species && manager.mySpecies.count == 0 {
                Text("Let's hatch one Species!")
                    .font(.custom("Georgia-Italic", size: 20))
                    .padding(15)
                    .bold()
                    .foregroundStyle(Color.cBlack)
            } else {
                
                VStack (spacing: 0) {
                    Picker("SpeciesOrItems", selection: $manager.speciesItemsSelection) {
                        Text("Species").tag(SpeciesItems.Species)
                        Text("Items").tag(SpeciesItems.Items)
                    }
                    .pickerStyle(.segmented)
                    .padding(5)
                    .background(Color.cLightBrown)
                    
                    if manager.speciesItemsSelection == .Species {
                            ScrollView {
                                LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                                    ForEach(manager.mySpecies.indices, id: \.self) { i in
                                        SpeciesListImage(mode: "Backyard", currSpecies: $manager.mySpecies[i], currModule: $manager.currPanelSpecies)
                                    }
                                })
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
                            ScrollView {
                                LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                                    ForEach(manager.myItems.indices, id: \.self) { i in
                                        ItemBYListImage(currItem: $manager.myItems[i], currModule: $manager.currPanelItem)
                                    }
                                })
                            }
                            .background(Color.cDarkBrown)
                        }
                    }
                }
            }
        }
    }
}
