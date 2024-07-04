//
//  SpeciesListView.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SpeciesListView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
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
                if manager.panelInfoAction == .none {
                    SpeciesList_ios17()
                } else {
                    SpeciesAction_ios17()
                        .onAppear {
                            if !manager.myItems.isEmpty {
                                manager.currPanelItem = manager.myItems[0]
                            }
                        }
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct SpeciesListView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        NavigationStack {
            if manager.speciesItemsSelection == .Species && manager.mySpecies.count == 0 {
                Text("Let's hatch one Species!")
                    .font(.custom("Georgia-Italic", size: 20))
                    .padding(15)
                    .bold()
                    .foregroundStyle(Color.cBlack)
            } else {
                if manager.panelInfoAction == .none {
                    SpeciesList_ios16()
                } else {
                    SpeciesAction_ios16()
                        .onAppear {
                            if !manager.myItems.isEmpty {
                                manager.currPanelItem = manager.myItems[0]
                            }
                        }
                }
            }
        }
    }
}
