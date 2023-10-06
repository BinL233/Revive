//
//  TimerModule.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct TimerModule: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.cLightYellow)
                //.frame(width: 300, height: 200)
                .cornerRadius(50)
                .shadow(radius: 8, x: 0, y: 8)
            Timer()
        }
    }
}

#Preview {
    TimerModule()
}
