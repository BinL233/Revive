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
        
        Button(action: {
            if manager.isTimerStart {
                manager.activeAlert = .stop
            } else {
                withAnimation{
                    manager.isTimerStart.toggle()
                    
                    // For Hatching
                    if manager.currAction == .hatching {
                        manager.currHatchingSpecies = manager.hatchingStartButton()
                    } else {
                        // For Training
                        manager.currHatchingState = .none
                        manager.trainingStartButton()
                    }
                    
                }
                manager.selectedTime = Int(manager.timeRemaining)
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
        .background(Color.cDarkOrange)
        .clipShape(Circle())
        .shadow(radius: 6, x: 0, y: 4)
        .alert(item: $manager.activeAlert) { alertType in
            switch alertType {
            case .stop:
                return Alert(
                    title: Text("Are you sure?"),
                    message: 
                        if manager.currAction == .hatching {
                            Text("You will fail to hatch this Species."),
                        } else if manager.currAction == .training {
                            Text("You will fail to train this Species."),
                        } else {
                            Text("You will fail to explore."),
                        }
                    primaryButton: .destructive(Text("Confirm")) {
                        withAnimation{manager.changeToHatchingState1()}
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
