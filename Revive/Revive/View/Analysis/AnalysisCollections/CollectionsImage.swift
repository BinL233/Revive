//
//  CollectionImage.swift
//  Revive
//
//  Created by Kaile Ying on 7/11/24.
//

import SwiftUI

struct CollectionsImage: View {
    @Binding var currSpecies : Species
    let found : Bool
    
    var body: some View {
        ZStack {
            Image("frame")
                .resizable()
                .scaledToFit()
            
            if found {
                Image("\(String(format: "%03d", currSpecies.id))")
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                Image("S\(String(format: "%03d", currSpecies.id))")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }

    }
}
