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
                SingleDetails(title: "Total Time", data: manager.secTimeToString(time: manager.sta[0].totalTime))
                SingleDetails(title: "Total Hatching Time", data: manager.secTimeToString(time: manager.sta[0].totalHatchingTime))
                SingleDetails(title: "Total Training Time", data: manager.secTimeToString(time: manager.sta[0].totalTrainingTime))
                SingleDetails(title: "Total Exploring Time", data: manager.secTimeToString(time: manager.sta[0].totalExploringTime))
                SingleDetails(title: "Number of Species", data: String(manager.sta[0].numOfSpecies))
                SingleDetails(title: "Number of R Species", data: String(manager.sta[0].numOfRSpecies))
                SingleDetails(title: "Number of SR Species", data: String(manager.sta[0].numOfSRSpecies))
                SingleDetails(title: "Number of SSR Species", data: String(manager.sta[0].numOfSSRSpecies))
                SingleDetails(title: "Number of Stage 2 Species", data: String(manager.sta[0].numOfStageTwoSpecies))
                SingleDetails(title: "Number of Items", data: String(manager.sta[0].numOfItems))
                SingleDetails(title: "Number of Maps", data: String(manager.sta[0].numOfMap))
                SingleDetails(title: "Number of Finished Maps", data: String(manager.sta[0].numOfFinishedMap))
                SingleDetails(title: "Number of Coins", data: String(manager.sta[0].numOfCoins))
            }
        }
    }
}
