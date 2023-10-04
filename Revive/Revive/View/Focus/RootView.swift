//
//  ContentView.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        ZStack {
            Background()
            VStack {
                Title()
                TimerModule()
                    .padding(.horizontal, 40)
                ActionButtons()
                    .padding(.horizontal, 45)
                    .padding(.vertical, 10)
                StartButton()
                    .padding(.vertical, 50)
                    .padding(.bottom, 180)
            }
        }
    }
}

#Preview {
    RootView()
}
