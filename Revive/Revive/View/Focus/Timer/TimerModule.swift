//
//  TimerModule.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI
import Combine
import ActivityKit

struct TimerModule: View {
    @Environment(ReviveManager.self) var manager
    @State private var timer : AnyCancellable?
    @Environment(WidgetManager.self) var widgetManager
    
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
                ProgressBar(percent: percentBinding)
                    .animation(.spring, value: manager.timeRemaining)
                    .padding(5)
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
            let attributes = ReviveWidgetAttributes(action: manager.currAction.rawValue)
            manager.timeRemaining -= 1
            
            // For Hatching
            if manager.currAction == .hatching {
                if Int(manager.timeRemaining) == manager.selectedTime / 2 {
                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(manager.currHatchingEgg)), staleDate: Date())
                    Task {
                        await widgetManager.timeRemainingAct?.update(content)
                    }
                    widgetManager.timeRemainingAct = try? Activity<ReviveWidgetAttributes>.request(attributes: attributes, content: content)
                    
                    withAnimation{manager.changeToHatchingState2()}
                } else if Int(manager.timeRemaining) == 0 {
                    withAnimation{manager.changeToHatchingState3()}
                } else {
                    let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: "1001"), staleDate: Date())
                    Task {
                        await widgetManager.timeRemainingAct?.update(content)
                    }
                }
            // For Training
            } else if manager.currAction == .training {
                let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currTrainingSpecies!.speciesID)), staleDate: Date())
                Task {
                    await widgetManager.timeRemainingAct?.update(content)
                }
                
                if Int(manager.timeRemaining) == 0 {
                    let (levelUpNum, currExp) = manager.getLevelUpNum(species: manager.currTrainingSpecies!, exp: manager.selectedTime)
                    withAnimation{manager.changeToTrainingState2(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate, currExp: currExp, levelUpNum: levelUpNum)}
                }
            }
            // For Exploring
            else {
                let content = ActivityContent(state: ReviveWidgetAttributes.ContentState(timeLeft: manager.secTimeToString(time: Int(manager.timeRemaining)), ImageName: String(format: "%03d",  manager.currExploringSpecies!.speciesID)), staleDate: Date())
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
