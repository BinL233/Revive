//
//  SpeciesPanelImage.swift
//  Revive
//
//  Created by Kaile Ying on 11/10/23.
//

import SwiftUI

struct SpeciesPanelImage: View {
    @Binding var currPanelSpecies : MySpecies?
    @State private var currentFrame = 0
    let frames = ["10070", "10071", "10072", "10073", "10074", "10075", "10076", "10077", "10078"]
    
    var body: some View {
        if currPanelSpecies != nil {
            let speciesImage = String(format: "%03d", currPanelSpecies!.speciesID)
            ZStack {
//                Ellipse()
//                    .fill(.gray)
//                    .opacity(0.5)
//                    .frame(width: 150, height: 50)
//                    .scaledToFit()
//                    .offset(CGSize(width: 0, height: 40.0))
                if speciesImage == "007" {
                    AnimationView(frames: frames)
                        .shadow(radius: 6, x: 0, y: 4)
                } else {
                    Image(speciesImage)
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(5)
                }
            }
        } else {
                ZStack {
//                    Ellipse()
//                        .fill(.gray)
//                        .opacity(0.3)
//                        .frame(width: 50, height: 30)
//                        .scaledToFit()
//                        .offset(CGSize(width: 0, height: 40.0))
                    Text("?")
                        .font(.system(size: 80))
                        .italic()
                        .bold()
                        .foregroundStyle(Color.cBlackBrown)
                        .shadow(radius: 6, x: 0, y: 4)
                    
            }
        }
    }
}
