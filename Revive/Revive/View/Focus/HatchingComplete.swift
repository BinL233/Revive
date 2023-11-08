//
//  HatchingComplete.swift
//  Revive
//
//  Created by Kaile Ying on 11/7/23.
//

import SwiftUI

struct HatchingComplete: View {
    @Environment(ReviveManager.self) var manager
    var body: some View {
        ZStack {
            Color.init(Color.white)
            VStack {
                Text("Hatching Complete!")
                    .font(.custom("Georgia-Italic", size: 20))
                    .bold()
                    .foregroundStyle(Color.cBlack)
                    .padding()
                Text("Species Get")
                    .font(.custom("Georgia-Italic", size: 15))
                    .bold()
                    .foregroundStyle(Color.cBlack)
                if let species = manager.currHatchingSpecies {
                    let speciesImage = String(format: "%03d", species.id)
                    if species.rarity == "R" {
                        Text(species.name)
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding()
                            .bold()
                            .foregroundStyle(Color.blue)
                    } else if species.rarity == "SR" {
                        Text(species.name)
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding()
                            .bold()
                            .foregroundStyle(Color.purple)
                    } else {
                        Text(species.name)
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding()
                            .bold()
                            .foregroundStyle(Color.orange)
                    }
                    
                    Image(speciesImage)
                        .resizable()
                        .scaledToFill()
                }
                
                Button(action: {manager.currHatchingState = .state1}) {
                    Text("Got it")
                        .font(.custom("Georgia-Italic", size: 20))
                        .bold()
                        .foregroundStyle(Color.cWhite)
                }
                .padding(15)
                .background(Color.cLightBrown)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding()
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 180)
    }
}

#Preview {
    HatchingComplete()
        .environment(ReviveManager())
}