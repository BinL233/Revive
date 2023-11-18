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
                    FocusTitle()
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
                        .padding(.bottom, 50)
                }
                
                // For hatching
                if manager.currAction == .hatching {
                    if manager.currHatchingState == .state3 {
                        HatchingComplete()
                            .transition(.scale)
                    }
                } else if manager.currAction == .training {
                    if manager.currTrainingState == .state2 {
                        TrainingComplete()
                            .transition(.scale)
                    }
                } else {
                    
                }
            }
        }
    }
}
