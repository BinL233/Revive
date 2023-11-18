//
//  TimerModule.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct TimerModule: View {
    @Environment(ReviveManager.self) var manager
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                .onReceive(timer, perform: { _ in
                    if manager.isTimerStart && manager.timeRemaining > 0 {
                        manager.timeRemaining -= 1
                        
                        // For Hatching
                        if manager.currAction == .hatching {
                            if Int(manager.timeRemaining) == manager.selectedTime / 2 {
                                withAnimation{manager.changeToHatchingState2()}
                            } else if Int(manager.timeRemaining) == 0 {
                                withAnimation{manager.changeToHatchingState3()}
                            }
                        } else if manager.currAction == .training {
                            if Int(manager.timeRemaining) == 0 {
                                let (levelUpNum, currExp) = manager.getLevelUpNum(species: manager.currTrainingSpecies!)
                                withAnimation{manager.changeToTrainingState2(id: manager.currTrainingSpecies!.speciesID, date: manager.currTrainingSpecies!.hatchDate, currExp: currExp, levelUpNum: levelUpNum)}
                            }
                        }
                    }
                })
        }
    }
}
