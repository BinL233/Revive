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
            List {
                ForEach(0..<Int(ceil(Double(manager.mySpecies.count)/4)), id: \.self) { i in
                    let startIndex = i * 4
                    let endIndex = min(startIndex + 4, manager.mySpecies.count)
                    
                    let rowSpeciesBinding = Binding<[MySpecies]>(
                        get: {
                            Array(manager.mySpecies[startIndex..<endIndex])
                        },
                        set: { newValue in
                            manager.mySpecies.replaceSubrange(startIndex..<endIndex, with: newValue)
                        }
                    )

                    SpeciesListRow(currRowSpecies: rowSpeciesBinding)
                }
            }
        }
        .background(.white)
    }
}

#Preview {
    SpeciesListView()
        .environment(ReviveManager())
}
