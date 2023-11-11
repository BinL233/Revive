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
            if manager.mySpecies.count == 0 {
                Text("Let's hatch one Species!")
                    .font(.custom("Georgia-Italic", size: 20))
                    .padding(15)
                    .bold()
                    .foregroundStyle(Color.cBlack)
            } else {
                ScrollView {
                    LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                        ForEach(manager.mySpecies.indices, id: \.self) { i in
                            SpeciesListImage(currSpecies: $manager.mySpecies[i])
                        }
                    })
                }
                .background(Color.cDarkBrown)
            }
        }
    }
}

#Preview {
    SpeciesListView()
        .environment(ReviveManager())
}
