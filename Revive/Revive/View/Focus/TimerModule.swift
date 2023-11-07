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
        VStack {
            TimerSlider()
            Text(manager.timeStringGetter())
                .bold()
                .italic()
                .font(.system(size: 35))
                .foregroundStyle(Color.cBlackBrown)
                .onReceive(timer, perform: { _ in
                    if manager.isTimerStart && manager.timeRemaining > 0 {
                        manager.timeRemaining -= 1
                        if Int(manager.timeRemaining) == manager.selectedTime / 2 {
                            withAnimation{manager.changeToHatchingState2()}
                        } else if Int(manager.timeRemaining) == manager.selectedTime {
                            manager.currHatchingState = .state3
                        }
                    }
                })
        }
    }
}

#Preview {
    TimerModule()
        .environment(ReviveManager())
}
