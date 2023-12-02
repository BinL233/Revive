//
//  ExploringStartView.swift
//  Revive
//
//  Created by Kaile Ying on 12/1/23.
//

import SwiftUI

struct ExploringStartView: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        
        VStack {
            ZStack {
                Image(String(manager.currExploringMap?.id ?? 0))
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                HStack {
                    let speciesImage = String(format: "%03d", manager.currExploringSpecies?.speciesID ?? 0)
                    Image(speciesImage)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: manager.getSpecies(mySpecies: manager.currExploringSpecies!).flip ? -1 : 1, y: 1)
                        .padding(.top, 90)
                        .padding(.bottom, 40)
                        .padding()
                    
                    Spacer()
                    
                    Image("2001")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 90)
                        .padding(.bottom, 40)
                        .padding()
                }
            }
        }
    }
}
