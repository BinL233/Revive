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
    
    init() {
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
                
                FocusView()
                    .tabItem {
                        Image(systemName: "pawprint")
                        Text("Focus")
                    }
                    .tag("focus")
                
                AnalysisView()
                    .tabItem {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                        Text("Analysis")
                    }
                    .tag("analysis")
            }
            .tint(.cBlackBrown)
        }
    }
}

#Preview {
    MainTabView()
        .environment(ReviveManager())
}
