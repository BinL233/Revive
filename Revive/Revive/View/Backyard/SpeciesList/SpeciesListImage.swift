//
//  SpeciesListImage.swift
//  Revive
//
//  Created by Kaile Ying on 11/9/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SpeciesListImage_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    var mode : String
    @Binding var currSpecies : MySpecies
    @Binding var currModule : MySpecies?
    @State private var color: Color = .white
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Button(action: {currModule = currSpecies}, label: {
            ZStack {
                if currModule == currSpecies {
                    Image("frame_selected")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("frame")
                        .resizable()
                        .scaledToFit()
                }

                let speciesImage = String(format: "%03d", currSpecies.speciesID)
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .padding(15)
                if currModule == currSpecies {
                    Image(currSpecies.favorite ? "heart_fill_selected" : "heart_selected")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(currSpecies.favorite ? "heart_fill" : "heart")
                        .resizable()
                        .scaledToFit()
                }
                
                if manager.currAction == .exploring && manager.isMapTypeFitsSpecies(species: currSpecies) && mode == "Exploring"{
                    VStack {
                        HStack {
                            Image(systemName: "arrowshape.up.fill")
                                .font(.title2)
                                .tint(color)
                                .onReceive(timer, perform: { _ in
                                    color = Color(
                                        red: Double.random(in: 0.5...1),
                                        green: Double.random(in: 0.5...1),
                                        blue: Double.random(in: 0.5...1)
                                    )
                                })
                                .animation(.easeInOut, value: color)
                                .overlay(
                                    Image(systemName: "arrowshape.up.fill")
                                        .font(.title2)
                                        .tint(color)
                                        .onReceive(timer, perform: { _ in
                                            color = Color(
                                                red: Double.random(in: 0.5...1),
                                                green: Double.random(in: 0.5...1),
                                                blue: Double.random(in: 0.5...1)
                                            )
                                        })
                                        .animation(.easeInOut, value: color)
                                        .blur(radius: 3)
                                )
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 5)
                }
            }
        })
    }
}

@available(iOS 16.0, *)
struct SpeciesListImage_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    var mode : String
    @Binding var currSpecies : MySpecies
    @Binding var currModule : MySpecies?
    @State private var color: Color = .white
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Button(action: {currModule = currSpecies}, label: {
            ZStack {
                if currModule == currSpecies {
                    Image("frame_selected")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("frame")
                        .resizable()
                        .scaledToFit()
                }

                let speciesImage = String(format: "%03d", currSpecies.speciesID)
                Image(speciesImage)
                    .resizable()
                    .scaledToFit()
                    .padding(15)
                if currModule == currSpecies {
                    Image(currSpecies.favorite ? "heart_fill_selected" : "heart_selected")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(currSpecies.favorite ? "heart_fill" : "heart")
                        .resizable()
                        .scaledToFit()
                }
                
                if manager.currAction == .exploring && manager.isMapTypeFitsSpecies(species: currSpecies) && mode == "Exploring"{
                    VStack {
                        HStack {
                            Image(systemName: "arrowshape.up.fill")
                                .font(.title2)
                                .tint(color)
                                .onReceive(timer, perform: { _ in
                                    color = Color(
                                        red: Double.random(in: 0.5...1),
                                        green: Double.random(in: 0.5...1),
                                        blue: Double.random(in: 0.5...1)
                                    )
                                })
                                .animation(.easeInOut, value: color)
                                .overlay(
                                    Image(systemName: "arrowshape.up.fill")
                                        .font(.title2)
                                        .tint(color)
                                        .onReceive(timer, perform: { _ in
                                            color = Color(
                                                red: Double.random(in: 0.5...1),
                                                green: Double.random(in: 0.5...1),
                                                blue: Double.random(in: 0.5...1)
                                            )
                                        })
                                        .animation(.easeInOut, value: color)
                                        .blur(radius: 3)
                                )
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 5)
                }
            }
        })
    }
}
