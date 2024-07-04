//
//  TrainingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/17/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct TrainingView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        let adaptiveCloumns = [GridItem(.adaptive(minimum: screenWidth > 380 ? 73 : 65))]
        @Bindable var manager = manager
        
        if manager.mySpecies.count == 0 {
            Text("Let's hatch one Species!")
                .font(.custom("Georgia-Italic", size: 20))
                .padding(15)
                .bold()
                .foregroundStyle(Color.cBlack)
                .onAppear {
                    manager.isStartButtonDisabled = true
                }
        } else {
            if manager.isTimerStart {
                let speciesImage = String(format: "%03d", manager.currTrainingSpecies?.speciesID ?? 0)
                
                ZStack {
                    Image(speciesImage)
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(15)
                    
                    ForEach(0..<5, id: \.self) { _ in
                        TrainingAnimation_ios17()
                    }
                }

            } else {
                VStack {
                    Text("Select a Species for training")
                        .font(.custom("Georgia-Italic", size: 18))
                        .padding()
                        .bold()
                        .foregroundStyle(Color.black)
                        //.background(Color.cDarkOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    ZStack {
                        ScrollView {
                            LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                                ForEach(manager.mySpecies.indices, id: \.self) { i in
                                    SpeciesListImage_ios17(mode: "Training", currSpecies: $manager.mySpecies[i], currModule: $manager.currTrainingSpecies)
                                }
                            })
                        }
                        .background(Color.cDarkBrown)
                        .padding(10)
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: {
                                    withAnimation(.bouncy(duration: 0.4)){ manager.isScaledSelectView.toggle() }
                                }, label: {
                                    Image(systemName: (manager.isScaledSelectView) ? "arrow.down.forward.and.arrow.up.backward" : "arrow.up.backward.and.arrow.down.forward")
                                        .font(.title2)
                                        .padding(10)
                                })
                                .background(Color.cWhite.opacity(0.8))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                        }
                    }
                    .padding(5)
                    .background(Color.cDarkBrown)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct TrainingView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        let adaptiveCloumns = [GridItem(.adaptive(minimum: screenWidth > 380 ? 73 : 65))]
        
        if manager.mySpecies.count == 0 {
            Text("Let's hatch one Species!")
                .font(.custom("Georgia-Italic", size: 20))
                .padding(15)
                .bold()
                .foregroundStyle(Color.cBlack)
                .onAppear {
                    manager.isStartButtonDisabled = true
                }
        } else {
            if manager.isTimerStart {
                let speciesImage = String(format: "%03d", manager.currTrainingSpecies?.speciesID ?? 0)
                
                ZStack {
                    Image(speciesImage)
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(15)
                    
                    ForEach(0..<5, id: \.self) { _ in
                        TrainingAnimation_ios16()
                    }
                }

            } else {
                VStack {
                    Text("Select a Species for training")
                        .font(.custom("Georgia-Italic", size: 18))
                        .padding()
                        .bold()
                        .foregroundStyle(Color.black)
                        //.background(Color.cDarkOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    ZStack {
                        ScrollView {
                            LazyVGrid(columns: adaptiveCloumns, spacing: 20, content: {
                                ForEach(manager.mySpecies.indices, id: \.self) { i in
                                    SpeciesListImage_ios16(mode: "Training", currSpecies: $manager.mySpecies[i], currModule: $manager.currTrainingSpecies)
                                }
                            })
                        }
                        .background(Color.cDarkBrown)
                        .padding(10)
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: {
                                    withAnimation(.bouncy(duration: 0.4)){ manager.isScaledSelectView.toggle() }
                                }, label: {
                                    Image(systemName: (manager.isScaledSelectView) ? "arrow.down.forward.and.arrow.up.backward" : "arrow.up.backward.and.arrow.down.forward")
                                        .font(.title2)
                                        .padding(10)
                                })
                                .background(Color.cWhite.opacity(0.8))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                        }
                    }
                    .padding(5)
                    .background(Color.cDarkBrown)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        }
    }
}
