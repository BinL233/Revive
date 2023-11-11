//
//  SpeciesPanelImage.swift
//  Revive
//
//  Created by Kaile Ying on 11/10/23.
//

import SwiftUI

struct SpeciesPanelImage: View {
    @Binding var currPanelSpecies : MySpecies?
    
    var body: some View {
        if currPanelSpecies != nil {
            let speciesImage = String(format: "%03d", currPanelSpecies!.speciesID)
            ZStack {
                Ellipse()
                    .fill(.gray)
                    .opacity(0.5)
                    .frame(width: 90, height: 35)
                    .scaledToFit()
                    .offset(CGSize(width: 0, height: 40.0))
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
        } else {
                ZStack {
                    Ellipse()
                        .fill(.gray)
                        .opacity(0.3)
                        .frame(width: 50, height: 30)
                        .scaledToFit()
                        .offset(CGSize(width: 0, height: 40.0))
                    Text("?")
                        .font(.system(size: 80))
                        .italic()
                        .bold()
                        .foregroundStyle(Color.cBlackBrown)
                    
            }
        }
    }
}
