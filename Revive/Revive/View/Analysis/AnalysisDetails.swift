//
//  AnalysisDetails.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct AnalysisDetails: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        Section {
            List {
                HStack {
                    Text("Total Time")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(manager.secTimeToString(time: manager.totalTime))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Total Hatching Time")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(manager.secTimeToString(time: manager.totalHatchingTime))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Total Training Time")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(manager.secTimeToString(time: manager.totalTrainingTime))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Total Exploring Time")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(manager.secTimeToString(time: manager.totalExploringTime))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Species")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.numOfSpecies))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Rare Species")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.numOfRSpecies))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Super Rare Species")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.numOfSRSpecies))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Items")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.numOfItems))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Coins")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.numOfCoins))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
            }
        }
    }
}
