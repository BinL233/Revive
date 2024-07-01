//
//  NewUserDialog1.swift
//  Revive
//
//  Created by Kaile Ying on 6/17/24.
//

import SwiftUI

struct NewUserDialog1: View {
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
                        .offset(x: -60, y: geometry.size.height - 300)
                    
                    Spacer()
                }
                
                Image("DialogBox")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 6, x: 0, y: 4)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(y: (geometry.size.height - 40) / 2)
                
                if !manager.tutorialDialog1.isEmpty {
                    Text("Xixi")
                        .font(.custom("Georgia-Italic", size: 18))
                        .foregroundStyle(Color.cBlack)
                        .multilineTextAlignment(.leading)
                        .position(x: geometry.size.width * 0.21, y: (geometry.size.height - 40) / 2 * 1.875)
                    
                    Text(manager.tutorialDialog1[currentIndex])
                        .font(.custom("Georgia-Italic", size: 15))
                        .padding(30)
                        .foregroundStyle(Color.cBlack)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: (geometry.size.height - 40) * 0.96)
                }
            }
        }
        .padding(.bottom, 100)
    }
}
