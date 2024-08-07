//
//  Timer.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct TimerSlider_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    @State private var newUserTime: TimeInterval = 10
    
    var body: some View {
        @Bindable var manager = manager
        HStack {
            if (manager.checkNoSpecies()) {
                Slider(
                    value: $manager.timeRemaining,
                    in: 10...11,
                    step: 1
                )
                .onAppear {
                    manager.timeRemaining = 10
                }
                .disabled(manager.isTimerStart)
                .accentColor(.cDarkOrange)

            } else {
                Slider(
                    value: $manager.timeRemaining,
                    in: (5*60...180*60),
                    step: 5*60
                )
                .onChange(of: manager.timeRemaining, { oldValue, newValue in
                    if manager.currAction == .hatching && newValue < 30*60 && !manager.isTimerStart {
                        manager.isStartButtonDisabled2 = true
                    } else if manager.currAction == .exploring && newValue < 10*60 && !manager.isTimerStart {
                        manager.isStartButtonDisabled2 = true
                    } else {
                        manager.isStartButtonDisabled2 = false
                    }
                })
                .disabled(manager.isTimerStart)
                .accentColor(.cDarkOrange)
            }
        }
    }
}

@available(iOS 16.0, *)
struct TimerSlider_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @State private var newUserTime: TimeInterval = 10
    
    var body: some View {
        HStack {
            if (manager.checkNoSpecies()) {
                Slider(
                    value: $manager.timeRemaining,
                    in: 10...11,
                    step: 1
                )
                .onAppear {
                    manager.timeRemaining = 10
                }
                .disabled(manager.isTimerStart)
                .accentColor(.cDarkOrange)

            } else {
                Slider(
                    value: $manager.timeRemaining,
                    in: (5*60...180*60),
                    step: 5*60
                )
                .onChange(of: manager.timeRemaining) { newValue in
                    if manager.currAction == .hatching && newValue < 30*60 && !manager.isTimerStart {
                        manager.isStartButtonDisabled2 = true
                    } else if manager.currAction == .exploring && newValue < 10*60 && !manager.isTimerStart {
                        manager.isStartButtonDisabled2 = true
                    } else {
                        manager.isStartButtonDisabled2 = false
                    }
                }
                .disabled(manager.isTimerStart)
                .accentColor(.cDarkOrange)
            }
        }
    }
}
