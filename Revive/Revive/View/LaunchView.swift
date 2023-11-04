//
//  LaunchView.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import SwiftUI

struct LaunchView: View {
    @State private var isActive = false
    @State private var isVisible = true
    @Environment(ReviveManager.self) var manager

    var body: some View {
        ZStack {
            Background()
            VStack {
                if isActive {
                    MainTabView()
                } else {
                    Spacer()
                    Text("Revive")
                        .font(.custom("Georgia-Italic", size: 35))
                        .bold()
                        .foregroundStyle(Color.cBlack)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                withAnimation {
                                    self.isActive = true
                                }
                            }
                        }
                        .padding(.bottom, 40)
                    Spacer()
                    Text("Loading...")
                        .font(.custom("Georgia-Italic", size: 20))
                        .bold()
                        .foregroundStyle(Color.cBlack)
                        .opacity(isVisible ? 1 : 0)
                        .padding(.bottom, 30)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                isVisible.toggle()
                            }
                        }
                }
            }
            .transition(.asymmetric(insertion: .opacity, removal: .scale))
            
        }
    }
}
