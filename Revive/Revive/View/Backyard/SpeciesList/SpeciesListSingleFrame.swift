//
//  SpeciesListSingleFrame.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

struct SpeciesListSingleFrame: View {
    @Environment(ReviveManager.self) var manager
    @Binding var currSpecies : MySpecies
    
    var body: some View {
        ZStack {
            Rectangle()
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.cBlackBrown, lineWidth: 5)
                )
                .aspectRatio(1, contentMode: .fit)
                .padding(60)
            ZStack {
                Image(systemName: "heart.fill")
                    .foregroundStyle(currSpecies.favorite ? .red : .white)
                    .font(.system(size: 100))
                    .offset(CGSize(width: 130, height: 130))
                Image(systemName: "heart")
                    .foregroundStyle(Color.cBlackBrown)
                    .font(.system(size: 100))
                    .offset(CGSize(width: 130, height: 130))
            }
        }
    }
}
