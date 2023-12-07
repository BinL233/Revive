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
    @State private var timer : AnyCancellable?
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
                    .onChange(of: scenePhase) { oldValue, newScenePhase in
                        switch newScenePhase {
                        case .background:
                            print("In background phase")
                            manager.lastBackgroundTime = Date()
                        
                        case .active:
                            print("In active phase")
                            if let lastBackgroundTime = manager.lastBackgroundTime {
                                let timePassed = Date().timeIntervalSince(lastBackgroundTime)
                                manager.timeRemaining -= Double(Int(timePassed))
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
                .onAppear {
                    timer?.cancel()
                    timer = Timer.publish(every: manager.testMode == .on ? 0.001 : 1, on: .main, in: .common)
                        .autoconnect()
                        .sink { _ in
                            timerTick()
                        }
                }
        }
    }
}

extension TimerModule {
    func timerTick() {
        if manager.isTimerStart && manager.timeRemaining > 0 {
            manager.timeRemaining -= 1
            
            // For Hatching
            if manager.currAction == .hatching {
                if Int(manager.timeRemaining) == manager.selectedTime / 2 {
                    // Live Activity
                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
                    Task {
                        await widgetManager.timeRemainingAct?.update(content)
                    }
                    
                    withAnimation{manager.changeToHatchingState2()}
                    
                } else if Int(manager.timeRemaining) == 0 {
                    // Live Activity
                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
                    Task {
                        await widgetManager.timeRemainingAct?.update(content)
                    }
                    
                    withAnimation{manager.changeToHatchingState3()}
                    
                } else if Int(manager.timeRemaining) < manager.selectedTime / 2 {
                    // Live Activity
                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: nil)
                    Task {
                        await widgetManager.timeRemainingAct?.update(content)
                    }
                } else {
                    // Live Activity
                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: "1001"), staleDate: nil)
                    Task {
                        await widgetManager.timeRemainingAct?.update(content)
                    }
                }
            // For Training
            } else if manager.currAction == .training {
                // Live Activity
                let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currTrainingSpecies!.speciesID)), staleDate: nil)
                Task {
                    await widgetManager.timeRemainingAct?.update(content)
                }
                
                if Int(manager.timeRemaining) == 0 {
                    let (levelUpNum, currExp) = manager.getLevelUpNum(species: manager.currTrainingSpecies!, exp: manager.selectedTime)
                    withAnimation{manager.changeToTrainingState2(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate, currExp: currExp, levelUpNum: levelUpNum)}
//                                    }
                }
            }
            // For Exploring
            else {
                // Live Activity
                let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currExploringSpecies!.speciesID)), staleDate: nil)
                Task {
                    await widgetManager.timeRemainingAct?.update(content)
                }
                
                if Int(manager.timeRemaining) == 0 {
                    manager.currExploringItems = manager.getRewards()
                    withAnimation{manager.changeToExploringState2()}
                }
            }
        }
    }
}
