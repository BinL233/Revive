//
//  SpeciesListView.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

struct SpeciesListView: View {
    @Environment(ReviveManager.self) var manager
    
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
                    SpeciesList()
                } else {
                    SpeciesAction()
                }
            }
        }
    }
}
