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
        if manager.speciesItemsSelection == .Species {
            ScrollView {
                VStack (alignment: .leading) {
                    
                    Button(action: {
                        manager.panelInfoAction = .info
                    }, label: {
                        Text("Info")
                            .font(.custom("Georgia-Italic", size: 15))
                            .padding(.horizontal, 13)
                            .padding(.vertical, 7)
                            .bold()
                            .foregroundStyle(Color.cWhite)
                            .frame(width: 100)
                    })
                    .background(Color.cBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 0.7, x: 2, y: 3)
                    
                    Button(action: {
                        manager.panelInfoAction = .feed
                    }, label: {
                        Text("Feed")
                            .font(.custom("Georgia-Italic", size: 15))
                            .padding(.horizontal, 13)
                            .padding(.vertical, 7)
                            .bold()
                            .foregroundStyle(Color.cWhite)
                            .frame(width: 100)
                    })
                    .background(Color.cBlueGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 0.7, x: 2, y: 3)
                    
                    Button(action: {
                        manager.panelInfoAction = .evolve
                    }, label: {
                        Text("Evolve")
                            .font(.custom("Georgia-Italic", size: 15))
                            .padding(.horizontal, 13)
                            .padding(.vertical, 7)
                            .bold()
                            .foregroundStyle(Color.cWhite)
                            .frame(width: 100)
                    })
                    .background(manager.canEvolve() ? .orange : .gray)
                    .disabled(!manager.canEvolve())
                    .opacity(manager.canEvolve() ? 1 : 0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: manager.canEvolve() ? 0.7 : 0, x: manager.canEvolve() ? 2 : 0, y: manager.canEvolve() ? 3 : 0)
                    
                    Button(action: {
                        withAnimation(.bouncy(duration: 0.3)) { manager.isReleaseConfirm = true }
                    }, label: {
                        Text("Release")
                            .font(.custom("Georgia-Italic", size: 15))
                            .padding(.horizontal, 13)
                            .padding(.vertical, 7)
                            .bold()
                            .foregroundStyle(Color.cWhite)
                            .frame(width: 100)
                    })
                    .background(manager.mySpecies.count == 1 ? .gray : Color.cdimBlue)
                    .opacity(manager.mySpecies.count == 1 ? 0.5 : 1)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: manager.mySpecies.count == 1 ? 0 : 0.7, x: manager.mySpecies.count == 1 ? 0 : 2, y: manager.mySpecies.count == 1 ? 0 : 3)
                    .disabled(manager.mySpecies.count == 1)
                }
                .padding([.bottom, .trailing], 3)
            }
        }
    }
}
