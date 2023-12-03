//
//  SwiftUIView.swift
//  Revive
//
//  Created by Kaile Ying on 12/3/23.
//

import SwiftUI

struct SpeciesAction: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        
        NavigationStack {
            if manager.panelInfoAction == .evolve {
                
            } else if manager.panelInfoAction == .info {
                SpeciesInfo()
            } else {
                SpeciesFeed()
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
