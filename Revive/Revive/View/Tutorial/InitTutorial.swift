//
//  TutorialFocusHatching.swift
//  Revive
//
//  Created by Kaile Ying on 3/4/24.
//

import SwiftUI

struct InitTutorial: View {
    @Binding var hideInitTutorial: Bool
    @Binding var state: Int
    @State private var currentIndex1 = 0
    @State private var currentIndex2 = 0
    @State private var currentIndex3 = 0
    @Environment(DialogManager.self) var manager
    @Environment(ReviveManager.self) var reviveManager
    
    var body: some View {
        @Bindable var manager = manager
        
        ZStack {
            Color.init(red: 0.2431, green: 0.2431, blue: 0.2431).opacity(0.6).ignoresSafeArea()
            
            VStack {
                switch state {
                case 0:
                    NewUserDialog(currentIndex: $currentIndex1, dialog: $manager.tutorialDialog1)
                        .onTapGesture {
                            if currentIndex1 < manager.tutorialDialog1.count - 1 {
                                currentIndex1 += 1
                            } else {
                                withAnimation(.bouncy) { state += 1 }
                            }
                        }
                    
                case 1:
                    NewUserDialog(currentIndex: $currentIndex2, dialog: $manager.tutorialDialog2)
                        .onTapGesture {
                            if currentIndex2 < manager.tutorialDialog2.count - 1 {
                                currentIndex2 += 1
                            } else {
                                hideInitTutorial = true
                            }
                        }
                        .offset(y: -200)
                    
                case 2:
                    NewUserDialog(currentIndex: $currentIndex3, dialog: $manager.tutorialDialog3)
                        .onTapGesture {
                            if currentIndex3 < manager.tutorialDialog3.count - 1 {
                                currentIndex3 += 1
                            } else {
                                hideInitTutorial = true
                                reviveManager.isTutorialFinished = true
                                UserDefaults.standard.set(true, forKey: "isTutorialFinished")
                            }
                        }
                
                default:
                    EmptyView()
                }
                
            }
        }
    }
}
