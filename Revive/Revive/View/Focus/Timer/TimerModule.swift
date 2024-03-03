//
//  TimerModule.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI
import Combine
import UserNotifications
import ActivityKit

struct TimerModule: View {
    @Environment(ReviveManager.self) var manager
    // @State private var timer : AnyCancellable?
    @Environment(WidgetManager.self) var widgetManager
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        @Bindable var manager = manager
        var percentBinding: Binding<CGFloat> {
            Binding<CGFloat>(
                get: {
                    CGFloat(manager.timeRemaining / Double(manager.selectedTime))
                },
                set: { _ in }
            )
        }
            
        VStack {
            if !manager.isTimerStart {
                TimerSlider()
            } else {
                //                if manager.backgroundRunning {
                ProgressBar(percent: percentBinding)
                    .animation(.spring, value: manager.timeRemaining)
                    .padding(5)
                    .onAppear() {
                        if (Double(manager.selectedTime) == manager.timeRemaining) {
                            manager.timerStart()
                        }
                    }
                    .onChange(of: scenePhase) { oldValue, newScenePhase in
                        switch newScenePhase {
                        case .background:
                            print("In background phase")
                            manager.lastBackgroundTime = Date()
                            
                            if let noti = manager.bgNotification {
                                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [noti])
                            }
                            
                            manager.bgNotification = manager.addNotification(title: "Revive \(manager.currAction.rawValue.capitalized) Completed", subtitle: "Check it out!", date: manager.lastBackgroundTime!.addingTimeInterval( manager.timeRemaining ))
                        
                        case .active:
                            print("In active phase")
                            if let lastBackgroundTime = manager.lastBackgroundTime {
                                let timePassed = Date().timeIntervalSince(lastBackgroundTime)
                                if manager.timeRemaining > Double(Int(timePassed)) {
                                    manager.timeRemaining -= Double(Int(timePassed))
                                } else {
                                    manager.timeRemaining = 1
                                    
                                    if let noti = manager.bgNotification {
                                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [noti])
                                    }
                                }
                                
                                manager.lastBackgroundTime = nil
                            }
                        default:
                            break
                        }
                    }
                
//                    .onChange(of: manager.timeRemaining) {
//                        .
//                        //                            manager.scheduleAppRefresh()
//                        //                            manager.scheduleProcessing()
//                    }
//                } else {
//                    ProgressBar(percent: percentBinding)
//                        .animation(.spring, value: manager.timeRemaining)
//                        .padding(5)
//                }

            }
            
            Text(manager.timeStringGetter())
                .bold()
                .italic()
                .font(.system(size: 35))
                .foregroundStyle(Color.cBlackBrown)
                .onChange(of: manager.timeStringGetter()) {
                    timerTick()
                }
        }
    }
}

extension TimerModule {
    func timerTick() {
        if manager.isTimerStart {
            
            // For Hatching
            if manager.currAction == .hatching {
                if Int(manager.timeRemaining) == manager.selectedTime / 2 {
                    // Live Activity
//                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
//                    Task {
//                        await widgetManager.timeRemainingAct?.update(content)
//                    }
                    
                    withAnimation{manager.changeToHatchingState2()}
                    
                } else if Int(manager.timeRemaining) == 0 {
                    // Live Activity
//                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
//                    Task {
//                        await widgetManager.timeRemainingAct?.update(content)
//                    }
                    manager.focusTimer?.cancel()
                    withAnimation{manager.changeToHatchingState3()}
                    
                } else if Int(manager.timeRemaining) < manager.selectedTime / 2 {
                    // Live Activity
//                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
//                    Task {
//                        await widgetManager.timeRemainingAct?.update(content)
//                    }
                } else {
                    // Live Activity
//                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: "1001"), staleDate: nil)
//                    Task {
//                        await widgetManager.timeRemainingAct?.update(content)
//                    }
                }
            // For Training
            } else if manager.currAction == .training {
                // Live Activity
//                let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currTrainingSpecies!.speciesID)), staleDate: nil)
//                Task {
//                    await widgetManager.timeRemainingAct?.update(content)
//                }
                
                if Int(manager.timeRemaining) == 0 {
                    manager.focusTimer?.cancel()
                    let (levelUpNum, currExp) = manager.getLevelUpNum(species: manager.currTrainingSpecies!, exp: manager.selectedTime)
                    withAnimation{manager.changeToTrainingState2(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate, currExp: currExp, levelUpNum: levelUpNum)}
//                                    }
                }
            }
            // For Exploring
            else {
                // Live Activity
//                let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currExploringSpecies!.speciesID)), staleDate: nil)
//                Task {
//                    await widgetManager.timeRemainingAct?.update(content)
//                }
                
                if Int(manager.timeRemaining) == 0 {
                    manager.focusTimer?.cancel()
                    manager.getCoins()
                    manager.currExploringItems = manager.getRewards()
                    withAnimation{manager.changeToExploringState2()}
                }
            }
        }
    }
}
