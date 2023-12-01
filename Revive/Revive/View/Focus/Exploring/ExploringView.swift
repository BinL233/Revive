//
//  ExploringView.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import SwiftUI

struct ExploringView: View {
    @Environment(ReviveManager.self) var manager
    private let adaptiveMapCloumns = [GridItem(.adaptive(minimum: 150))]
    private let adaptiveSpeciesCloumns = [GridItem(.adaptive(minimum: 73))]
    @State var isMapSelected = false
    
    var body: some View {
        @Bindable var manager = manager
        if manager.mySpecies.count == 0 {
            Text("Let's hatch one Species!")
                .font(.custom("Georgia-Italic", size: 20))
                .padding(15)
                .bold()
                .foregroundStyle(Color.cBlack)
        } else {
            if manager.isTimerStart {
                ExploringStartView()
            } else if !isMapSelected {
                VStack {
                    Text("Select Map")
                        .font(.custom("Georgia-Italic", size: 15))
                        .bold()
                        .foregroundStyle(Color.black)
                        //.background(Color.cDarkBrown)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    ScrollView {
                        LazyVGrid(columns: adaptiveMapCloumns, spacing: 20, content: {
                            ForEach(manager.mapList.indices, id: \.self) { i in
                                MapListImage(currMap: $manager.myMaps[i], currModule: $manager.currExploringMap)
                            }
                        })
                    }
                    .padding()
                    .background(Color.cDarkBrown)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Button(action: {
                        withAnimation{isMapSelected = true}
                    }, label: {
                        Text("Next")
                            .font(.custom("Georgia-Italic", size: 18))
                            .foregroundStyle(.white)
                            .bold()
                            .padding()
                            .padding(.horizontal, 30)
                    })
                    .background(Color.cDarkOrange)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
            } else {
                VStack {
                    Text("Select adventure buddy")
                        .font(.custom("Georgia-Italic", size: 18))
                        .padding()
                        .bold()
                        .foregroundStyle(Color.cBlack)
                        .onAppear {
                            manager.isStartButtonDisabled = false
                        }
                    
                    ScrollView {
                        LazyVGrid(columns: adaptiveSpeciesCloumns, spacing: 20, content: {
                            ForEach(manager.mySpecies.indices, id: \.self) { i in
                                SpeciesListImage(mode: "Exploring", currSpecies: $manager.mySpecies[i], currModule: $manager.currExploringSpecies)
                            }
                        })
                    }
                    .padding()
                    .background(Color.cDarkBrown)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        }
    }
}
