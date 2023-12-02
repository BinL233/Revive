//
//  SpeciesPanel+ActionButtons.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import SwiftUI

struct SpeciesPanelActionButtons: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Text("Evolve")
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 15)
                    .padding(7)
                    .bold()
                    .foregroundStyle(Color.cWhite)
            })
            .background(manager.canEvolve() ? .orange : .gray)
            .disabled(!manager.canEvolve())
            .opacity(manager.canEvolve() ? 1 : 0.5)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Button(action: {}, label: {
                Text("Info")
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 15)
                    .padding(7)
                    .bold()
                    .foregroundStyle(Color.cWhite)
            })
            .background(Color.cBlue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Button(action: {}, label: {
                Text("Feed")
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(.horizontal, 15)
                    .padding(7)
                    .bold()
                    .foregroundStyle(Color.cWhite)
            })
            .background(Color.cBlueGreen)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
