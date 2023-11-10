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
                    manager.activeAlert = .testMode
                    manager.timeRemaining = 5
                }
        
        Text("Focus")
            .font(.custom("Georgia-Italic", size: 40))
            .padding(15)
            .bold()
            .foregroundStyle(Color.cBlack)
            .gesture(testM)
    }
}
