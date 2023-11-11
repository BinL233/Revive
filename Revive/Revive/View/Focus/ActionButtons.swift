//
//  ActionButtons.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct ActionButtons: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        HStack {
            if ((manager.currAction == .hatching) || !manager.isTimerStart) {
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        manager.currAction = .hatching
                    }
                }) {
                    Text("Hatching")
                        .foregroundStyle(withAnimation{(!manager.isTimerStart && manager.timeRemaining < 30*60 && manager.testMode == .off) ? .gray : Color.cBlack})
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .hatching) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .disabled(!manager.isTimerStart && manager.timeRemaining < 30*60 && manager.testMode == .off)
            }
            
            if ((manager.currAction == .training) || !manager.isTimerStart) {
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        manager.currAction = .training
                    }
                }) {
                    Text("Training")
                        .foregroundStyle(Color.cBlack)
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .training) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            if ((manager.currAction == .exploring) || !manager.isTimerStart) {
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        manager.currAction = .exploring
                    }
                }) {
                    Text("Exploring")
                        .foregroundStyle(Color.cBlack)
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .exploring) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
//        }
    }
}
