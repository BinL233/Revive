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
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                HStack {
                    Image("XX")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 6, x: 0, y: 4)
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: 300, height: 300)
                        .offset(x: -60, y: geometry.size.height/2 - 300)
                    
                    Spacer()
                }
                
                Image("DialogBox")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 6, x: 0, y: 4)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                if !manager.tutorialDialog2.isEmpty {
                    Text("Xixi")
                        .font(.custom("Georgia-Italic", size: 18))
                        .foregroundStyle(Color.cBlack)
                        .multilineTextAlignment(.leading)
                        .position(x: geometry.size.width * 0.21, y: geometry.size.height * 0.423)
                    
                    Text(manager.tutorialDialog2[currentIndex])
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(30)
                        .foregroundStyle(Color.cBlack)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: geometry.size.height * 0.44)
                }
            }
            .padding(.bottom, 100)
        }
    }
}
