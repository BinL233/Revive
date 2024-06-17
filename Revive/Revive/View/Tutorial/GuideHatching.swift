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
            Image("DialogBox")
                .resizable()
                .scaledToFit()
                .shadow(radius: 6, x: 0, y: 4)
            
            if !manager.tutorialDialog2.isEmpty {
                Text(manager.tutorialDialog2[currentIndex])
                    .font(.custom("Georgia-Italic", size: 15))
                    .padding(30)
                    .foregroundStyle(Color.cBlack)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
