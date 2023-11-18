//
//  Title.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct FocusTitle: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        let testM = LongPressGesture(minimumDuration: 1)
                .onEnded { value in
                    if manager.testMode == .off {
                        manager.testMode = .on
                        manager.activeAlert = .testMode
                    } else {
                        manager.testMode = .off
                        manager.activeAlert = .testModeOff
                    }
                    
                    manager.timeRemaining = 5
                }
        ZStack {
            Text("Focus")
                .font(.custom("Georgia-Italic", size: 40))
                .padding(15)
                .bold()
                .foregroundStyle(Color.cBlack)
                .gesture(testM)
            HStack {
                Spacer()
                NavigationLink(destination: SettingView()) {
                    Image(systemName: "gearshape")
                        .font(.title2)
                        .foregroundStyle(Color.cBlackBrown)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
