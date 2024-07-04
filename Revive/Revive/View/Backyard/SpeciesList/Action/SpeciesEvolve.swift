//
//  SpeciesEvolve.swift
//  Revive
//
//  Created by Kaile Ying on 12/6/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SpeciesEvolve_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    @State var isEvolved : Bool = false
    
    var body: some View {
        VStack {
            if isEvolved {
                Text("Evolve Successfully")
                    .font(.custom("Georgia-Italic", size: 20))
                    .padding(15)
                    .bold()
                    .foregroundStyle(Color.cBlack)
            }
            
            HStack {
                if !isEvolved {
                    Image("\(String(format: "%03d", manager.currPanelSpecies!.speciesID))")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(20)
                    
                    Image(systemName: "arrowshape.right.fill")
                        .font(.title2)
                    
                    Image("\(String(format: "%03d", manager.currPanelSpecies!.speciesID+1))")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(5)
                } else {
                    Image("\(String(format: "%03d", manager.currPanelSpecies!.speciesID))")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(5)
                }
            }
            
            if !isEvolved {
                Button(action: {
                    manager.evolveToNextStage()
                    isEvolved.toggle()
                }, label: {
                    Text("Evolve")
                        .font(.custom("Georgia-Italic", size: 18))
                        .padding(.horizontal, 15)
                        .padding(10)
                        .bold()
                        .foregroundStyle(Color.cWhite)
                })
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 0.7, x: 2, y: 3)
                .disabled(isEvolved)
            }
        }
    }
}

@available(iOS 16.0, *)
struct SpeciesEvolve_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @State var isEvolved : Bool = false
    
    var body: some View {
        VStack {
            if isEvolved {
                Text("Evolve Successfully")
                    .font(.custom("Georgia-Italic", size: 20))
                    .padding(15)
                    .bold()
                    .foregroundStyle(Color.cBlack)
            }
            
            HStack {
                if !isEvolved {
                    Image("\(String(format: "%03d", manager.currPanelSpecies!.speciesID))")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(20)
                    
                    Image(systemName: "arrowshape.right.fill")
                        .font(.title2)
                    
                    Image("\(String(format: "%03d", manager.currPanelSpecies!.speciesID+1))")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(5)
                } else {
                    Image("\(String(format: "%03d", manager.currPanelSpecies!.speciesID))")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(5)
                }
            }
            
            if !isEvolved {
                Button(action: {
                    manager.evolveToNextStage()
                    isEvolved.toggle()
                }, label: {
                    Text("Evolve")
                        .font(.custom("Georgia-Italic", size: 18))
                        .padding(.horizontal, 15)
                        .padding(10)
                        .bold()
                        .foregroundStyle(Color.cWhite)
                })
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 0.7, x: 2, y: 3)
                .disabled(isEvolved)
            }
        }
    }
}
