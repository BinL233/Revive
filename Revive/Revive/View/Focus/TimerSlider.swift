//
//  Timer.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct TimerSlider: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        HStack {
            Slider(
                value: $manager.timeRemaining,
                in: 5*60...180*60,
                step: 5*60
            )
            .disabled(manager.isTimerStart)
            .accentColor(.cDarkOrange)
        }
    }
}
