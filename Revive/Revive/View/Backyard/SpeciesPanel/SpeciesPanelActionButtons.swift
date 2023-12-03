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
            if manager.speciesItemsSelection == .Species {
                Button(action: {
                    manager.panelInfoAction = .evolve
                }, label: {
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
                .shadow(radius: manager.canEvolve() ? 0.7 : 0, x: manager.canEvolve() ? 2 : 0, y: manager.canEvolve() ? 3 : 0)
                
                Button(action: {
                    manager.panelInfoAction = .info
                }, label: {
                    Text("Info")
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 15)
                        .padding(7)
                        .bold()
                        .foregroundStyle(Color.cWhite)
                })
                .background(Color.cBlue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 0.7, x: 2, y: 3)
                
                Button(action: {
                    manager.panelInfoAction = .feed
                }, label: {
                    Text("Feed")
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 15)
                        .padding(7)
                        .bold()
                        .foregroundStyle(Color.cWhite)
                })
                .background(Color.cBlueGreen)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 0.7, x: 2, y: 3)
            } else {
                Button(action: {
                    
                }, label: {
                    Text("Use")
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(.horizontal, 30)
                        .padding(7)
                        .bold()
                        .foregroundStyle(Color.cWhite)
                })
                .background(Color.cBlueGreen)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 0.7, x: 2, y: 3)
            }
        }
    }
}
