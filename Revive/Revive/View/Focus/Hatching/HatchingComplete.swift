//
//  HatchingComplete.swift
//  Revive
//
//  Created by Kaile Ying on 11/7/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct HatchingComplete_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    // @Environment(WidgetManager.self) var widgetManager
    
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
                    
                    ZStack {
                        Image(speciesImage)
                            .resizable()
                            .scaledToFill()
                            .padding()
                            .shadow(radius: 6, x: 0, y: 4)
//                            .background(.gray.opacity(0.3))
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
//                            .padding()
                        
                        VStack {
                            HStack {
                                ZStack {
                                    Image(systemName: "seal.fill")
                                        .font(.system(size: 50))
                                        .foregroundStyle(Color.orange)
                                        .shadow(radius: 6, x: 0, y: 4)
                                    
                                    Text(species.rarity)
                                        .font(.custom("Georgia-Italic", size: 35))
                                        .padding()
                                        .bold()
                                        .foregroundStyle(Color.white)
                                }
                                Spacer()
                                
//                                if manager.isNewSpecies {
//                                    Text("NEW")
//                                        .font(.custom("Georgia-Italic", size: 28))
//                                        .padding()
//                                        .bold()
//                                        .foregroundStyle(Color.orange)
//                                }
                            }
                            Spacer()
                        }
                    }
                }
                
                Button(action: {
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

@available(iOS 16.0, *)
struct HatchingComplete_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    // @Environment(WidgetManager.self) var widgetManager
    
    var body: some View {
        ZStack {
            Color.white
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
                    
                    ZStack {
                        Image(speciesImage)
                            .resizable()
                            .scaledToFill()
                            .padding()
                            .shadow(radius: 6, x: 0, y: 4)
//                            .background(.gray.opacity(0.3))
//                            .clipShape(RoundedRectangle(cornerRadius: 15))
//                            .padding()
                        
                        VStack {
                            HStack {
                                ZStack {
                                    Image(systemName: "seal.fill")
                                        .font(.system(size: 50))
                                        .foregroundStyle(Color.orange)
                                        .shadow(radius: 6, x: 0, y: 4)
                                    
                                    Text(species.rarity)
                                        .font(.custom("Georgia-Italic", size: 35))
                                        .padding()
                                        .bold()
                                        .foregroundStyle(Color.white)
                                }
                                Spacer()
                                
//                                if manager.isNewSpecies {
//                                    Text("NEW")
//                                        .font(.custom("Georgia-Italic", size: 28))
//                                        .padding()
//                                        .bold()
//                                        .foregroundStyle(Color.cMidYellow)
//                                }
                            }
                            Spacer()
                        }
                    }
                }
                
                Button(action: {
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
