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
                    manager.currHatchingSpecies = manager.hatchingStartButton()
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
                    message: Text("You will fail to hatch this Species."),
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
            }
        }
    }
}
