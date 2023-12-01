//
//  StartButton.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct StartButton: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        
        var alertMessage : Text {
            if manager.currAction == .hatching {
                return Text("You will fail to hatch this Species.")
            } else if manager.currAction == .training {
                return Text("You will fail to train this Species.")
            } else {
                return Text("You will fail to explore.")
            }
        }
        
        Button(action: {
            if manager.isTimerStart {
                manager.activeAlert = .stop
            } else {
                withAnimation{
                    if manager.keepDisplay {
                        UIApplication.shared.isIdleTimerDisabled = true
                    }
                    
                    manager.selectedTime = Int(manager.timeRemaining)
                    
                    // For Hatching
                    if manager.currAction == .hatching {
                        manager.isTimerStart.toggle()
                        manager.currTrainingState = .none
                        manager.currExploringState = .none
                        manager.currHatchingSpecies = manager.hatchingStartButton()
                    } else if manager.currAction == .training {
                        // For Training
                        if manager.currTrainingSpecies != nil {
                            manager.isTimerStart.toggle()
                            manager.currHatchingState = .none
                            manager.currExploringState = .none
                            manager.currTrainingState = .state1
                        }
                    } else {
                        // For Exploring
                        if manager.currExploringSpecies != nil {
                            manager.isTimerStart.toggle()
                            manager.currHatchingState = .none
                            manager.currTrainingState = .none
                            manager.currExploringState = .state1
                        }
                    }
                    
                }
            }
        }) {
            if manager.isTimerStart {
                Text("Stop")
                    .font(.custom("Georgia-Italic", size: 23))
                    .padding(30)
                    .bold()
                    .foregroundStyle(Color.cWhite)
            } else {
                Text("Start")
                    .font(.custom("Georgia-Italic", size: 23))
                    .padding(30)
                    .bold()
                    .foregroundStyle(Color.cWhite)
            }
        }
        .background(manager.isStartButtonDisabled ? .gray : Color.cDarkOrange)
        .clipShape(Circle())
        .shadow(radius: 6, x: 0, y: 4)
        .disabled(manager.isStartButtonDisabled)
        .alert(item: $manager.activeAlert) { alertType in
            switch alertType {
            case .stop:
                return Alert(
                    title: Text("Are you sure?"),
                    message: alertMessage,
                    primaryButton: .destructive(Text("Confirm")) {
                        withAnimation{
                            if manager.currAction == .hatching {
                                manager.changeToHatchingState1()
                            } else if manager.currAction == .training {
                                manager.changeToTrainingState1()
                            } else {
                                manager.changeToExploringState1()
                            }
                        }
                    },
                    secondaryButton: .cancel() {
                        manager.activeAlert = .none
                    }
                )
            case .testMode:
                return Alert(
                    title: Text("TEST MODE ACTIVATED"),
                    message: Text("You are now in Test Mode."),
                    dismissButton: .default(Text("OK")) {
                        manager.activeAlert = .none
                    }
                )
            case .testModeOff:
                return Alert(
                    title: Text("TEST MODE DEACTIVATED"),
                    message: Text("You are now in User Mode."),
                    dismissButton: .default(Text("OK")) {
                        manager.activeAlert = .none
                        manager.timeRemaining = 30*60
                    }
                )
            }
        }
    }
}
