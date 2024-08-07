//
//  StartButton.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI
import ActivityKit

@available(iOS 17.0, *)
struct StartButton_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    // @Environment(WidgetManager.self) var widgetManager
    
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
                            manager.timeRemaining = manager.timeRemaining * manager.trainingBuffRate
                        }
                    } else {
                        // For Exploring
                        if manager.currExploringSpecies != nil {
                            manager.isTimerStart.toggle()
                            manager.currHatchingState = .none
                            manager.currTrainingState = .none
                            manager.currExploringState = .state1
                            manager.timeRemaining = manager.timeRemaining * manager.exploringBuffRate
                        }
                    }
                }
                
                // Live Activity
                
//                let attributes = ReviveWidgetAttributes(action: manager.currAction.rawValue)
//                var content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
                
//                switch manager.currAction {
//                case .hatching:
//                    content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
//                case .training:
//                    content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currTrainingSpecies!.speciesID)), staleDate: nil)
//                case .exploring:
//                    content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currExploringSpecies!.speciesID)), staleDate: nil)
//                }
//                
//                if widgetManager.timeRemainingAct == nil {
//                    widgetManager.endActivity()
//                    widgetManager.timeRemainingAct = try? Activity<ReviveWidgetAttributes>.request(attributes: attributes, content: content)
//                } else {
//                    Task {
//                        await widgetManager.timeRemainingAct?.update(content)
//                    }
//                }
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
        .background(manager.isStartButtonDisabled || manager.isStartButtonDisabled2 ? .gray : Color.cDarkOrange)
        .clipShape(Circle())
        .shadow(radius: 6, x: 0, y: 4)
        .disabled(manager.isStartButtonDisabled || manager.isStartButtonDisabled2)
        .alert(item: $manager.activeAlert) { alertType in
            switch alertType {
            case .stop:
                return Alert(
                    title: Text("Are you sure?"),
                    message: alertMessage,
                    primaryButton: .destructive(Text("Confirm")) {
                        withAnimation{
//                            widgetManager.endActivity()
                            if manager.currAction == .hatching {
                                manager.changeToHatchingState1()
                            } else if manager.currAction == .training {
                                manager.changeToTrainingState1()
                            } else {
                                manager.changeToExploringState1()
                            }
                        }
                        
                        if let noti = manager.bgNotification {
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [noti])
                            manager.bgNotification = nil
                        }
                        
                        manager.updatePendingItem()
                        manager.resetBuffRate()
                        manager.focusTimer?.cancel()
                    },
                    secondaryButton: .cancel() {
                        manager.activeAlert = .none
                    }
                )
            }
        }
    }
}

@available(iOS 16.0, *)
struct StartButton_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    // @Environment(WidgetManager.self) var widgetManager
    
    var body: some View {
        
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
                            manager.timeRemaining = manager.timeRemaining * manager.trainingBuffRate
                        }
                    } else {
                        // For Exploring
                        if manager.currExploringSpecies != nil {
                            manager.isTimerStart.toggle()
                            manager.currHatchingState = .none
                            manager.currTrainingState = .none
                            manager.currExploringState = .state1
                            manager.timeRemaining = manager.timeRemaining * manager.exploringBuffRate
                        }
                    }
                }
                
                // Live Activity
                
//                let attributes = ReviveWidgetAttributes(action: manager.currAction.rawValue)
//                var content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
                
//                switch manager.currAction {
//                case .hatching:
//                    content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
//                case .training:
//                    content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currTrainingSpecies!.speciesID)), staleDate: nil)
//                case .exploring:
//                    content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currExploringSpecies!.speciesID)), staleDate: nil)
//                }
//
//                if widgetManager.timeRemainingAct == nil {
//                    widgetManager.endActivity()
//                    widgetManager.timeRemainingAct = try? Activity<ReviveWidgetAttributes>.request(attributes: attributes, content: content)
//                } else {
//                    Task {
//                        await widgetManager.timeRemainingAct?.update(content)
//                    }
//                }
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
        .background(manager.isStartButtonDisabled || manager.isStartButtonDisabled2 ? .gray : Color.cDarkOrange)
        .clipShape(Circle())
        .shadow(radius: 6, x: 0, y: 4)
        .disabled(manager.isStartButtonDisabled || manager.isStartButtonDisabled2)
        .alert(item: $manager.activeAlert) { alertType in
            switch alertType {
            case .stop:
                return Alert(
                    title: Text("Are you sure?"),
                    message: alertMessage,
                    primaryButton: .destructive(Text("Confirm")) {
                        withAnimation{
//                            widgetManager.endActivity()
                            if manager.currAction == .hatching {
                                manager.changeToHatchingState1()
                            } else if manager.currAction == .training {
                                manager.changeToTrainingState1()
                            } else {
                                manager.changeToExploringState1()
                            }
                        }
                        
                        if let noti = manager.bgNotification {
                            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [noti])
                            manager.bgNotification = nil
                        }
                        
                        manager.updatePendingItem()
                        manager.resetBuffRate()
                        manager.focusTimer?.cancel()
                    },
                    secondaryButton: .cancel() {
                        manager.activeAlert = .none
                    }
                )
            }
        }
    }
}
