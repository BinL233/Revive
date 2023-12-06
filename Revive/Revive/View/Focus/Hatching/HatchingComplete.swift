//
//  HatchingComplete.swift
//  Revive
//
//  Created by Kaile Ying on 11/7/23.
//

import SwiftUI

struct HatchingComplete: View {
    @Environment(ReviveManager.self) var manager
    @Environment(WidgetManager.self) var widgetManager
    
    var body: some View {
        ZStack {
            Color.init(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(radius: 6, x: 0, y: 4)
            VStack {
                Text("Hatching Complete!")
                    .font(.custom("Georgia-Italic", size: 20))
                    .bold()
                    .foregroundStyle(Color.cBlackBrown)
                    .shadow(radius: 0.7, x: 0, y: 2)
                    .padding(15)
                    .background(Color.cLightYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 0.7, x: 0, y: 2)
                Text("Species Get")
                    .font(.custom("Georgia-Italic", size: 15))
                    .bold()
                    .foregroundStyle(Color.cBlack)
                    .padding(.top)
                
                if let species = manager.currHatchingSpecies {
                    let speciesImage = String(format: "%03d", species.id)
                    if species.rarity == "R" {
                        Text(species.name)
                            .font(.custom("Georgia-Italic", size: 22))
                            .padding(.top)
                            .bold()
                            .foregroundStyle(Color.blue)
                    } else if species.rarity == "SR" {
                        Text(species.name)
                            .font(.custom("Georgia-Italic", size: 22))
                            .padding(.top)
                            .bold()
                            .foregroundStyle(Color.purple)
                    } else {
                        Text(species.name)
                            .font(.custom("Georgia-Italic", size: 22))
                            .padding(.top)
                            .bold()
                            .foregroundStyle(Color.orange)
                    }
                    
                    Image(speciesImage)
                        .resizable()
                        .scaledToFill()
                        .shadow(radius: 6, x: 0, y: 4)
                }
                
                Button(action: {
                    widgetManager.endActivity()
                    manager.isStartButtonDisabled = false
                    withAnimation{manager.changeToHatchingState1()}
                }) {
                    Text("Got it")
                        .font(.custom("Georgia-Italic", size: 20))
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding(15)
                .background(Color.cDarkOrange)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 4, x: 0, y: 4)
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 180)
    }
}
