//
//  SwiftUIView.swift
//  Revive
//
//  Created by Kaile Ying on 12/3/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SpeciesAction_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        
        NavigationStack {
            if manager.panelInfoAction == .evolve {
                SpeciesEvolve_ios17()
            } else if manager.panelInfoAction == .info {
                SpeciesInfo_ios17()
            } else {
                SpeciesFeed_ios17()
            }
        }
//        .navigationTitle(currAction)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack (spacing: 0) {
                    Button {
                        manager.panelInfoAction = .none
                    } label: {
                        Image(systemName: "multiply.square.fill")
                            .font(.title)
                            .tint(Color.cBlackBrown)
                    }

                }
            }
        }
        .padding()
    }
}

@available(iOS 16.0, *)
struct SpeciesAction_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        
        NavigationStack {
            if manager.panelInfoAction == .evolve {
                SpeciesEvolve_ios16()
            } else if manager.panelInfoAction == .info {
                SpeciesInfo_ios16()
            } else {
                SpeciesFeed_ios16()
            }
        }
//        .navigationTitle(currAction)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack (spacing: 0) {
                    Button {
                        manager.panelInfoAction = .none
                    } label: {
                        Image(systemName: "multiply.square.fill")
                            .font(.title)
                            .tint(Color.cBlackBrown)
                    }

                }
            }
        }
        .padding()
    }
}
