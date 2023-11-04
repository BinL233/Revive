//
//  TimerModule.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct TimerModule: View {
    @State private var timeSelection : Double = 5
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        VStack {
            Timer(timeSelection: $timeSelection)
            Text(manager.timeConvertor(time: Int(timeSelection)))
                .bold()
                .italic()
                .font(.title)
                .foregroundStyle(Color.cBlackBrown)
        }
    }
}

#Preview {
    TimerModule()
        .environment(ReviveManager())
}
