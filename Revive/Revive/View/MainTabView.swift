//
//  TabView.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = "focus"
    @Environment(ReviveManager.self) var manager
    @Binding var isTestModeOn : Bool
    
    init(isTestModeOn: Binding<Bool>) {
        self._isTestModeOn = isTestModeOn
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        ZStack {
            TabView (selection: $selectedTab) {
                BackyardView()
                    .tabItem {
                        Image(systemName: "house.and.flag.fill")
                        Text("Backyard")
                    }
                    .tag("backyard")
                    .onAppear {
                        manager.mySpecies = DataManager.shared.loadData()
                        manager.changeSpeciesListSorter()
                        manager.myItems = DataManager.shared.loadItemData()
                        manager.changeItemListSorter()
                        
                        if !manager.mySpecies.isEmpty {
                            manager.currPanelSpecies = manager.mySpecies[0]
                        }
                        
                        if !manager.myItems.isEmpty {
                            manager.currPanelItem = manager.myItems[0]
                        }
                    }
                
                FocusView()
                    .tabItem {
                        Image(systemName: "pawprint")
                        Text("Focus")
                    }
                    .tag("focus")
                    .onAppear {
                        manager.myMaps = DataManager.shared.loadMapData()
                        manager.mySpecies = DataManager.shared.loadData()
                        manager.changeSpeciesListSorter()
                        
                        if !manager.mySpecies.isEmpty {
                            manager.currPanelSpecies = manager.mySpecies[0]
                        }
                    }
                
                AnalysisView()
                    .tabItem {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                        Text("Analysis")
                    }
                    .tag("analysis")
                    .onAppear {
                        manager.focusLog = DataManager.shared.loadLogData()
                        manager.sta = DataManager.shared.loadStaData()
                    }
            }
            .tint(.cBlackBrown)
            .onAppear {
                if isTestModeOn {
                    manager.testMode = .on
                } else {
                    manager.testMode = .off
                }
            }
        }
    }
}
