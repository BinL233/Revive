//
//  ExploringView.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import SwiftUI

struct ExploringView: View {
    @Environment(ReviveManager.self) var manager
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
                        .font(.custom("Georgia-Italic", size: 18))
                        .padding()
                        .bold()
                        .foregroundStyle(Color.cBlack)
                    
                    ScrollView {
                        VStack {
                            ForEach(manager.mapList.indices, id: \.self) { i in
                                if i < manager.myMaps.count {
                                    HStack {
                                        MapListImage(currMap: $manager.myMaps[i], currModule: $manager.currExploringMap)
                                        
                                        VStack {
                                            Text("Exploring Time:")
                                                .font(.custom("Georgia-Italic", size: 13))
                                                .bold()
                                                .foregroundStyle(.white)
                                            Text(manager.secTimeToString(time: manager.myMaps[i].currTime))
                                                .font(.custom("Georgia-Italic", size: 15))
                                                .bold()
                                                .foregroundStyle(.white)
                                                .shadow(radius: 3, x: 0, y: 4)
                                            
                                            Spacer()
                                            
                                            Text("Next Treasure:")
                                                .font(.custom("Georgia-Italic", size: 13))
                                                .bold()
                                                .foregroundStyle(.white)
                                            Text("\(manager.secTimeToString(time: manager.getNextRewardTimeRemain()))")
                                                .font(.custom("Georgia-Italic", size: 15))
                                                .bold()
                                                .foregroundStyle(.white)
                                                .shadow(radius: 3, x: 0, y: 4)
                                        }
                                        .padding()
                                        .padding(.top)
                                    }
                                } else {
                                    HStack {
                                        Image("mapFrame\(manager.mapList[i].id)")
                                            .resizable()
                                            .scaledToFit()
                                        
                                        VStack {
                                            Text("Exploring Time:")
                                                .font(.custom("Georgia-Italic", size: 13))
                                                .bold()
                                                .foregroundStyle(.white)
                                            Text("???")
                                                .font(.custom("Georgia-Italic", size: 15))
                                                .bold()
                                                .foregroundStyle(.white)
                                                .shadow(radius: 3, x: 0, y: 4)
                                            
                                            Spacer()
                                            
                                            Text("Next Treasure:")
                                                .font(.custom("Georgia-Italic", size: 13))
                                                .bold()
                                                .foregroundStyle(.white)
                                            Text("???")
                                                .font(.custom("Georgia-Italic", size: 15))
                                                .bold()
                                                .foregroundStyle(.white)
                                                .shadow(radius: 3, x: 0, y: 4)
                                        }
                                        .padding()
                                        .padding(.top)
                                    }
                                    .overlay(Color.black.opacity(0.5))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 2)
                                    .tint(Color.cBlackBrown)
                                    .opacity(0.3)
                            }
                        }
                    }
                    .padding()
                    .background(Color.cDarkBrown)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Button(action: {
                        withAnimation(.bouncy(duration: 0.3)){isMapSelected = true}
                        withAnimation(.bouncy(duration: 0.4)){manager.isMapStartSelect = false}
                    }, label: {
                        Text("Next")
                            .font(.custom("Georgia-Italic", size: 18))
                            .foregroundStyle(.white)
                            .bold()
                            .padding(10)
                            .padding(.horizontal, 40)
                    })
                    .background(Color.cDarkOrange)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.top)
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
                    
                    Button(action: {
                        withAnimation(.bouncy(duration: 0.3)){isMapSelected = false}
                        withAnimation(.bouncy(duration: 0.4)){manager.isMapStartSelect = true}
                    }, label: {
                        Text("Back")
                            .font(.custom("Georgia-Italic", size: 18))
                            .foregroundStyle(.white)
                            .bold()
                            .padding(10)
                            .padding(.horizontal, 40)
                    })
                    .background(Color.cDarkOrange)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.top)
                }
            }
        }
    }
}
