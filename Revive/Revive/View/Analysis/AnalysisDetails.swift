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
                    Text(manager.secTimeToString(time: manager.sta[0].totalTime))
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
                    Text(manager.secTimeToString(time: manager.sta[0].totalHatchingTime))
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
                    Text(manager.secTimeToString(time: manager.sta[0].totalTrainingTime))
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
                    Text(manager.secTimeToString(time: manager.sta[0].totalExploringTime))
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
                    Text(String(manager.sta[0].numOfSpecies))
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
                    Text(String(manager.sta[0].numOfRSpecies))
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
                    Text(String(manager.sta[0].numOfSRSpecies))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Super Species Rare Species")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.sta[0].numOfSSRSpecies))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Stage 2 Species")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.sta[0].numOfStageTwoSpecies))
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
                    Text(String(manager.sta[0].numOfItems))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Maps")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.sta[0].numOfMap))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
                
                HStack {
                    Text("Number of Finished Maps")
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                    Spacer()
                    Text(String(manager.sta[0].numOfFinishedMap))
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
                    Text(String(manager.sta[0].numOfCoins))
                        .font(.callout)
                        .italic()
                        .padding(.bottom, 5)
                }
            }
        }
    }
}
