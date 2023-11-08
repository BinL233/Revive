//
//  ContentView.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct FocusView: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                VStack {
                    Title()
                    Spacer()
                    DisplayView()
                        .padding(.vertical, 30)
                    ActionButtons()
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                    TimerModule()
                        .padding(.horizontal, 40)
                    StartButton()
                        .padding(.vertical, 50)
                        .padding(.bottom, 80)
                }
                
                if manager.currHatchingState == .state3 {
                    HatchingComplete()
                        .transition(.scale)
                }
            }
        }
    }
}
