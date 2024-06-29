//
//  GuideHatching.swift
//  Revive
//
//  Created by Kaile Ying on 6/17/24.
//

import SwiftUI

struct GuideHatching: View {
    @Environment(DialogManager.self) var manager
    @Binding var currentIndex: Int
    
    var body: some View {
        ZStack {
            HStack {
                    Image("XX")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 6, x: 0, y: 4)
                    .scaleEffect(x: -1, y: 1)
                    .frame(width: 300, height: 300)
                    .offset(x: -60, y: -60)
                
                Spacer()
            }
            
            Image("DialogBox")
                .resizable()
                .scaledToFit()
                .shadow(radius: 6, x: 0, y: 4)
                .offset(y: 80)
            
            if !manager.tutorialDialog2.isEmpty {
                Text(manager.tutorialDialog2[currentIndex])
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(30)
                    .foregroundStyle(Color.cBlack)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(y: 80)
            }
        }
        .padding(.bottom, 100)
    }
}
