//
//  TabView.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct MainTabView_ios17: View {
    @State private var selectedTab = "focus"
    @State private var isTutorialHFinished = false
    @Environment(ReviveManager_ios17.self) var manager
    @Binding var isTestModeOn : Bool
    
    init(isTestModeOn: Binding<Bool>) {
        self._isTestModeOn = isTestModeOn
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        @Bindable var manager = manager
        
        ZStack {
            TabView (selection: $selectedTab) {
                FocusView_ios17()
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
                
                BackyardView_ios17()
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
                
                StoreView_ios17()
                    .tabItem {
                        Image(systemName: "storefront.fill")
                        Text("Store")
                    }
                    .tag("store")
                    .onAppear {
                        if !DataManager.shared.loadStaData().isEmpty {
                            manager.sta = DataManager.shared.loadStaData()
                        }
                    }
                
                if !manager.mySpecies.isEmpty {
                    AnalysisView()
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .opacity(manager.mySpecies.isEmpty ? 0.5 : 1)
                            Text("Analysis")
                                .opacity(manager.mySpecies.isEmpty ? 0.5 : 1)
                        }
                        .tag("analysis")
                        .onAppear {
                            manager.focusLog = DataManager.shared.loadLogData()
                            if !DataManager.shared.loadStaData().isEmpty {
                                manager.sta = DataManager.shared.loadStaData()
                            }
                        }
                } else {
                    Text("Let's hatch one Species!")
                        .font(.custom("Georgia-Italic", size: 20))
                        .padding(15)
                        .bold()
                        .foregroundStyle(Color.cBlack)
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                            Text("Analysis")
                        }
                        .tag("analysis_non")
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
            
            if (!manager.isTutorialFinished && !manager.hideInitTutorial) {
                InitTutorial_ios17(hideInitTutorial: $manager.hideInitTutorial, state: $manager.tutorialState)
            }
        }
    }
}

@available(iOS 16.0, *)
struct MainTabView_ios16: View {
    @State private var selectedTab = "focus"
    @State private var isTutorialHFinished = false
    @EnvironmentObject var manager: ReviveManager_ios16
    @Binding var isTestModeOn : Bool
    
    init(isTestModeOn: Binding<Bool>) {
        self._isTestModeOn = isTestModeOn
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        ZStack {
            TabView (selection: $selectedTab) {
                FocusView_ios16()
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
                
                BackyardView_ios16()
                    .tabItem {
                        Image(systemName: "house.fill")
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
                
                StoreView_ios16()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Store")
                    }
                    .tag("store")
                    .onAppear {
                        if !DataManager.shared.loadStaData().isEmpty {
                            manager.sta = DataManager.shared.loadStaData()
                        }
                    }
                
                if !manager.mySpecies.isEmpty {
                    AnalysisView()
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .opacity(manager.mySpecies.isEmpty ? 0.5 : 1)
                            Text("Analysis")
                                .opacity(manager.mySpecies.isEmpty ? 0.5 : 1)
                        }
                        .tag("analysis")
                        .onAppear {
                            manager.focusLog = DataManager.shared.loadLogData()
                            if !DataManager.shared.loadStaData().isEmpty {
                                manager.sta = DataManager.shared.loadStaData()
                            }
                        }
                } else {
                    Text("Let's hatch one Species!")
                        .font(.custom("Georgia-Italic", size: 20))
                        .padding(15)
                        .bold()
                        .foregroundStyle(Color.cBlack)
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                            Text("Analysis")
                        }
                        .tag("analysis_non")
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
            
            if (!manager.isTutorialFinished && !manager.hideInitTutorial) {
                InitTutorial_ios16(hideInitTutorial: $manager.hideInitTutorial, state: $manager.tutorialState)
            }
        }
    }
}

