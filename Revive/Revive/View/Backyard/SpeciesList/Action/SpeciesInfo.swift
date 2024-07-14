//
//  SpeciesInfo.swift
//  Revive
//
//  Created by Kaile Ying on 12/3/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SpeciesInfo_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        let species = manager.getSpecies(mySpecies: manager.currPanelSpecies!)
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    
                    if species.stage == 1 {
                        Image(systemName: "1.circle")
                            .font(.title2)
                            .padding(.vertical, 5)
                            .tint(Color.cBlackRed)
                    } else {
                        Image(systemName: "2.circle")
                            .font(.title2)
                            .padding(.vertical, 5)
                            .tint(Color.cBlackRed)
                    }

                    
                    Text(LocalizedStringKey(species.name))
                        .font(.custom("Georgia-Italic", size: 30))
                        .padding(5)
                        .bold()
                        .foregroundStyle(species.rarity == "R" ? .blue : .purple)
                    
                    Text("#\(String(format: "%03d", species.id))")
                        .font(.title)
                        .padding(.vertical, 5)
                        .bold()
                        .foregroundStyle(.gray)
                    
                    Spacer()
                }
                
                Text(LocalizedStringKey(species.intro))
                    .font(.subheadline)
                    .italic()
                    .padding()
                    .bold()
                    .foregroundStyle(Color.cBlack)
                    .opacity(0.5)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text("Hatching Date")
                            .font(.custom("Georgia-Italic", size: 18))
                            .bold()
                            .padding([.top, .horizontal])
                            .foregroundStyle(Color.cBlackBrown)
                        
                        Spacer()
                    }
                
                    Text("\(manager.dateToString(date: manager.currPanelSpecies?.hatchDate ?? Date(), format: "yyyy-MM-dd HH:mm"))")
                        .font(.custom("Georgia-Italic", size: 20))
                        .padding([.bottom, .horizontal])
                        .foregroundStyle(Color.cBlackBrown)
                        
                    
                    HStack {
                        VStack {
                            Text("Height")
                                .font(.custom("Georgia-Italic", size: 18))
                                .padding([.top, .horizontal])
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                            
                            (Text("\(String(format: "%.2f", manager.currPanelSpecies?.height ?? 0))") + Text("m"))
                                .font(.custom("Georgia-Italic", size: 20))
                                .padding([.bottom, .horizontal])
                                .foregroundStyle(Color.cBlackBrown)
                        }
                        
                        VStack {
                            Text("Weight")
                                .font(.custom("Georgia-Italic", size: 18))
                                .padding([.top, .horizontal])
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                            
                            (Text("\(String(format: "%.2f", manager.currPanelSpecies?.weight ?? 0))") + Text("kg"))
                                .font(.custom("Georgia-Italic", size: 20))
                                .padding([.bottom, .horizontal])
                                .foregroundStyle(Color.cBlackBrown)
                        }
                    }
                }
                .padding()
                .background(Color.cLightBrown.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                VStack {
                    HStack {
                        Text("Advantage Areas")
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding([.top, .horizontal])
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                        
                        Spacer()
                    }
                    
                    let sortedAreas = species.area.sorted { $0.value > $1.value }
                    
                    ScrollView(.horizontal) {
                        ForEach(sortedAreas, id: \.key) { area in
                            HStack(spacing: 0) {
                                (Text(LocalizedStringKey("\(area.key)")) + Text(": \(String(format: "%.2f", area.value))"))
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                                    
                                Image(systemName: "arrowshape.up.fill")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.cWhite)
                            }
                            .padding(10)
                            .background(manager.getAdvantageAreaColor(area: area.key))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding(.horizontal)
                        }
                        .padding(.bottom)
                    }
                    
                    HStack {
                        Text("Trait")
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding([.top, .horizontal])
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        Text(LocalizedStringKey(species.trait.rawValue.capitalized))
                            .font(.subheadline)
                            .bold()
                            .padding(10)
                            .background(manager.getTraitBGColor(trait: species.trait))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .foregroundStyle(Color.cWhite)
                            .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
                .padding()
                .background(Color.cLightBrown.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}

@available(iOS 16.0, *)
struct SpeciesInfo_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        let species = manager.getSpecies(mySpecies: manager.currPanelSpecies!)
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    
                    if species.stage == 1 {
                        Image(systemName: "1.circle")
                            .font(.title2)
                            .padding(.vertical, 5)
                            .tint(Color.cBlackRed)
                    } else {
                        Image(systemName: "2.circle")
                            .font(.title2)
                            .padding(.vertical, 5)
                            .tint(Color.cBlackRed)
                    }

                    
                    Text(species.name)
                        .font(.custom("Georgia-Italic", size: 30))
                        .padding(5)
                        .bold()
                        .foregroundStyle(species.rarity == "R" ? .blue : .purple)
                    
                    Text("#\(String(format: "%03d", species.id))")
                        .font(.title)
                        .padding(.vertical, 5)
                        .bold()
                        .foregroundStyle(.gray)
                    
                    Spacer()
                }
                
                Text(species.intro)
                    .font(.subheadline)
                    .italic()
                    .padding()
                    .bold()
                    .foregroundStyle(Color.cBlack)
                    .opacity(0.5)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text("Hatching Date")
                            .font(.custom("Georgia-Italic", size: 18))
                            .bold()
                            .padding([.top, .horizontal])
                            .foregroundStyle(Color.cBlackBrown)
                        
                        Spacer()
                    }
                
                    Text("\(manager.dateToString(date: manager.currPanelSpecies?.hatchDate ?? Date(), format: "yyyy-MM-dd HH:mm"))")
                        .font(.custom("Georgia-Italic", size: 20))
                        .padding([.bottom, .horizontal])
                        .foregroundStyle(Color.cBlackBrown)
                        
                    
                    HStack {
                        VStack {
                            Text("Height")
                                .font(.custom("Georgia-Italic", size: 18))
                                .padding([.top, .horizontal])
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                            
                            Text("\(String(format: "%.2f", manager.currPanelSpecies?.height ?? 0)) m")
                                .font(.custom("Georgia-Italic", size: 20))
                                .padding([.bottom, .horizontal])
                                .foregroundStyle(Color.cBlackBrown)
                        }
                        
                        VStack {
                            Text("Weight")
                                .font(.custom("Georgia-Italic", size: 18))
                                .padding([.top, .horizontal])
                                .bold()
                                .foregroundStyle(Color.cBlackBrown)
                            
                            Text("\(String(format: "%.2f", manager.currPanelSpecies?.weight ?? 0)) kg")
                                .font(.custom("Georgia-Italic", size: 20))
                                .padding([.bottom, .horizontal])
                                .foregroundStyle(Color.cBlackBrown)
                        }
                    }
                }
                .padding()
                .background(Color.cLightBrown.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                VStack {
                    HStack {
                        Text("Advantage Areas")
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding([.top, .horizontal])
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                        
                        Spacer()
                    }
                    
                    let sortedAreas = species.area.sorted { $0.value > $1.value }
                    
                    ScrollView(.horizontal) {
                        ForEach(sortedAreas, id: \.key) { area in
                            HStack(spacing: 0) {
                                Text("\(area.key): \(String(format: "%.2f", area.value))")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundStyle(Color.cWhite)
                                    
                                Image(systemName: "arrowshape.up.fill")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.cWhite)
                            }
                            .padding(10)
                            .background(manager.getAdvantageAreaColor(area: area.key))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding(.horizontal)
                        }
                        .padding(.bottom)
                    }
                    
                    HStack {
                        Text("Trait")
                            .font(.custom("Georgia-Italic", size: 20))
                            .padding([.top, .horizontal])
                            .bold()
                            .foregroundStyle(Color.cBlackBrown)
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        Text(species.trait.rawValue.capitalized)
                            .font(.subheadline)
                            .bold()
                            .padding(10)
                            .background(manager.getTraitBGColor(trait: species.trait))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .foregroundStyle(Color.cWhite)
                            .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
                .padding()
                .background(Color.cLightBrown.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}
