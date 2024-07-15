//
//  Collections.swift
//  Revive
//
//  Created by Kaile Ying on 7/11/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct Collections_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    private let screenWidth = UIScreen.main.bounds.width
    @State private var speciesAchieveRate: CGFloat = 0
    
    var body: some View {
        let adaptiveCloumns = [GridItem(.adaptive(minimum: screenWidth > 380 ? 90 : 70))]
        @Bindable var manager = manager
        
        VStack {
            Text("Species")
                .bold()
                .font(.title2)
                .foregroundStyle(Color.cBlackBrown)
            
            ZStack {
                ProgressBar(color1: Color.cYellow, color2: Color.cYellow, percent: $speciesAchieveRate, height: 15)
                (Text("\(manager.myCollectionsSpecies.count)") + Text("/") + Text("\(manager.speciesList.count)"))
                    .bold()
                    .italic()
                    .font(.caption)
                    .foregroundStyle(Color.cBlack)
            }
        }
        .onAppear {
            speciesAchieveRate = CGFloat(manager.myCollectionsSpecies.count / manager.speciesList.count)
        }
        .padding(.horizontal)
        
        ScrollView {
            LazyVGrid(columns: adaptiveCloumns, spacing: 20) {
                ForEach(manager.speciesList.indices, id: \.self) { i in
                    if manager.myCollectionsSpecies.contains(where: { $0.id == manager.speciesList[i].id }) {
                        CollectionsImage(currSpecies: $manager.speciesList[i], found: true)
                    } else {
                        CollectionsImage(currSpecies: $manager.speciesList[i], found: false)
                    }
                }
            }
        }
        .background(Color.cDarkBrown)
    }
}

@available(iOS 16.0, *)
struct Collections_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    private let screenWidth = UIScreen.main.bounds.width
    @State private var speciesAchieveRate: CGFloat = 0
    
    var body: some View {
        let adaptiveCloumns = [GridItem(.adaptive(minimum: screenWidth > 380 ? 90 : 70))]
        
        VStack {
            Text("Species")
                .bold()
                .font(.title2)
                .foregroundStyle(Color.cBlackBrown)
            
            ZStack {
                ProgressBar(color1: Color.cYellow, color2: Color.cYellow, percent: $speciesAchieveRate, height: 15)
                (Text("\(manager.myCollectionsSpecies.count)") + Text("/") + Text("\(manager.speciesList.count)"))
                    .bold()
                    .italic()
                    .font(.caption)
                    .foregroundStyle(Color.cBlack)
            }
        }
        .onAppear {
            speciesAchieveRate = CGFloat(manager.myCollectionsSpecies.count / manager.speciesList.count)
        }
        .padding(.horizontal)
        
        ScrollView {
            LazyVGrid(columns: adaptiveCloumns, spacing: 20) {
                ForEach(manager.speciesList.indices, id: \.self) { i in
                    if manager.myCollectionsSpecies.contains(where: { $0.id == manager.speciesList[i].id }) {
                        CollectionsImage(currSpecies: $manager.speciesList[i], found: true)
                    } else {
                        CollectionsImage(currSpecies: $manager.speciesList[i], found: false)
                    }
                }
            }
        }
        .background(Color.cDarkBrown)
    }
}
