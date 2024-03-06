//
//  TutorialFocusHatching.swift
//  Revive
//
//  Created by Kaile Ying on 3/4/24.
//

import SwiftUI

struct TutorialFocusHatching: View {
    @Binding var isTutorialHFinished: Bool
    @State private var stage: Int = 0
    
    var body: some View {
        ZStack {
            Color.init(red: 0.2431, green: 0.2431, blue: 0.2431).opacity(0.6).ignoresSafeArea()
            
            switch stage {
            case 0:
                VStack {
                    Spacer()
                    Image("DialogBox")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .padding(.bottom, 100)
                }
                
            case 1:
                VStack {

                }
                
            default:
                EmptyView()
            }
        }
        .onTapGesture {
            if (stage != 1) {
                stage += 1
            } else {
                isTutorialHFinished = true
            }
        }
    }
}
