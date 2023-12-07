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
        ZStack {
            HStack {
                if manager.speciesItemsSelection == .Species {
                    ScrollView (.horizontal) {
                        HStack {
                            Button(action: {
                                manager.panelInfoAction = .evolve
                            }, label: {
                                Text("Evolve")
                                    .font(.custom("Georgia-Italic", size: 15))
                                    .padding(.horizontal, 13)
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
                                    .padding(.horizontal, 13)
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
                                    .padding(.horizontal, 13)
                                    .padding(7)
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                            })
                            .background(Color.cBlueGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 0.7, x: 2, y: 3)
                            
                            Button(action: {
                                withAnimation(.bouncy(duration: 0.3)) { manager.isReleaseConfirm = true }
                            }, label: {
                                Text("Release")
                                    .font(.custom("Georgia-Italic", size: 15))
                                    .padding(.horizontal, 13)
                                    .padding(7)
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                            })
                            .background(Color.cdimBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 0.7, x: 2, y: 3)
                        }
                        .padding(.bottom, 3)
                    }
                    
                } else if !manager.myItems.isEmpty {
                    if manager.getItem(id: manager.currPanelItem!.id).functionType.count != 1 || !manager.getItem(id: manager.currPanelItem!.id).functionType.contains(FunctionType(rawValue: "exp")!) {
                        Button(action: {
                            manager.itemBuff()
                        }, label: {
                            Text("Use")
                                .font(.custom("Georgia-Italic", size: 15))
                                .padding(.horizontal, 30)
                                .padding(7)
                                .bold()
                                .foregroundStyle(Color.cWhite)
                        })
                        .background(manager.currPanelItem!.amount == 0 ? .gray : Color.cBlueGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 0.7, x: 2, y: 3)
                        .disabled(manager.currPanelItem!.amount == 0)
                    } else {
                        Text("Feed your Species!")
                            .font(.custom("Georgia-Italic", size: 15))
                            .padding(.horizontal, 30)
                            .padding(7)
                            .bold()
                            .foregroundStyle(Color.cBlack)
                    }
                }
            }
        }
    }
}
