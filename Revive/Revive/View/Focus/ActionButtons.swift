//
//  ActionButtons.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ActionButtons_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        HStack {
            if ((manager.currAction == .hatching) || !manager.isTimerStart) {
                Button(action: {
                    withAnimation(.bouncy(duration: 0.2)) {
                        manager.currAction = .hatching
                        manager.isStartButtonDisabled = false
                        manager.isScaledSelectView = false
                    }
                }) {
                    Text("Hatching")
                        .foregroundStyle(withAnimation{(!manager.isTimerStart && manager.timeRemaining < 30*60 && !manager.checkNoSpecies()) ? .gray : Color.cBlack})
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .hatching) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .disabled((!manager.isTimerStart && manager.timeRemaining < 30*60 && !manager.checkNoSpecies()) || manager.isTimerStart)
            }
            
            if ((manager.currAction == .training) || !manager.isTimerStart) {
                Button(action: {
                    withAnimation(.bouncy(duration: 0.1)) {
                        manager.currAction = .training
                        manager.isStartButtonDisabled = false
                    }
                    withAnimation(.bouncy(duration: 0.4)){manager.isScaledSelectView = false}
                }) {
                    Text("Training")
                        .foregroundStyle(withAnimation{(manager.checkNoSpecies()) ? .gray : Color.cBlack})
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .training) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .disabled(manager.checkNoSpecies() || manager.isTimerStart)
            }
            
            if ((manager.currAction == .exploring) || !manager.isTimerStart) {
                Button(action: {
                    manager.deleteDuplicatedMaps()
                    withAnimation(.bouncy(duration: 0.2)) {
                        manager.currAction = .exploring
                        manager.currExploringMap = manager.myMaps[0]
                        manager.isStartButtonDisabled = true
                    }
                    withAnimation(.bouncy(duration: 0.4)){manager.isScaledSelectView = true}
                }) {
                    Text("Exploring")
                        .foregroundStyle(withAnimation{((!manager.isTimerStart && manager.timeRemaining < 10*60) || manager.checkNoSpecies()) ? .gray : Color.cBlack})
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .exploring) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .disabled(((!manager.isTimerStart && manager.timeRemaining < 10*60) || manager.checkNoSpecies()) || manager.isTimerStart)
            }
        }
    }
//        }
}

@available(iOS 16.0, *)
struct ActionButtons_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        HStack {
            if ((manager.currAction == .hatching) || !manager.isTimerStart) {
                Button(action: {
                    withAnimation(.bouncy(duration: 0.2)) {
                        manager.currAction = .hatching
                        manager.isStartButtonDisabled = false
                        manager.isScaledSelectView = false
                    }
                }) {
                    Text("Hatching")
                        .foregroundStyle(withAnimation{(!manager.isTimerStart && manager.timeRemaining < 30*60 && !manager.checkNoSpecies()) ? .gray : Color.cBlack})
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .hatching) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .disabled((!manager.isTimerStart && manager.timeRemaining < 30*60 && !manager.checkNoSpecies()) || manager.isTimerStart)
            }
            
            if ((manager.currAction == .training) || !manager.isTimerStart) {
                Button(action: {
                    withAnimation(.bouncy(duration: 0.1)) {
                        manager.currAction = .training
                        manager.isStartButtonDisabled = false
                    }
                    withAnimation(.bouncy(duration: 0.4)){manager.isScaledSelectView = false}
                }) {
                    Text("Training")
                        .foregroundStyle(withAnimation{(manager.checkNoSpecies()) ? .gray : Color.cBlack})
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .training) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .disabled(manager.checkNoSpecies() || manager.isTimerStart)
            }
            
            if ((manager.currAction == .exploring) || !manager.isTimerStart) {
                Button(action: {
                    manager.deleteDuplicatedMaps()
                    withAnimation(.bouncy(duration: 0.2)) {
                        manager.currAction = .exploring
                        manager.currExploringMap = manager.myMaps[0]
                        manager.isStartButtonDisabled = true
                    }
                    withAnimation(.bouncy(duration: 0.4)){manager.isScaledSelectView = true}
                }) {
                    Text("Exploring")
                        .foregroundStyle(withAnimation{((!manager.isTimerStart && manager.timeRemaining < 10*60) || manager.checkNoSpecies()) ? .gray : Color.cBlack})
                        .font(.custom("Georgia-Italic", size: 15))
                }
                .padding(15)
                .background((manager.currAction == .exploring) ? Color.cLightBrown : .clear)
                .animation(.easeInOut(duration: 0.2), value: manager.currAction)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .disabled(((!manager.isTimerStart && manager.timeRemaining < 10*60) || manager.checkNoSpecies()) || manager.isTimerStart)
            }
        }
    }
//        }
}
