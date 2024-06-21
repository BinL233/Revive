//
//  TutorialFocusHatching.swift
//  Revive
//
//  Created by Kaile Ying on 3/4/24.
//

import SwiftUI

struct InitTutorial: View {
    @Binding var isTutorialHFinished: Bool
    @State private var state = 0
    @State private var currentIndex1 = 0
    @State private var currentIndex2 = 0
    @Environment(DialogManager.self) var manager
    
    var body: some View {
        ZStack {
            Color.init(red: 0.2431, green: 0.2431, blue: 0.2431).opacity(0.6).ignoresSafeArea()
            
            VStack {
                switch state {
                case 0:
                    NewUserDialog1(currentIndex: $currentIndex1)
                        .onTapGesture {
                            if currentIndex1 < manager.tutorialDialog1.count - 1 {
                                currentIndex1 += 1
                            } else {
                                withAnimation(.bouncy) { state += 1 }
                            }
                        }
                    
                case 1:
                    GuideHatching(currentIndex: $currentIndex2)
                        .onTapGesture {
                            if currentIndex2 < manager.tutorialDialog2.count - 1 {
                                currentIndex2 += 1
                            } else {
                                isTutorialHFinished = true
                            }
                        }
                
                default:
                    EmptyView()
                }
                
            }
        }
    }
}
