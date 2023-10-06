//
//  StartButton.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

struct StartButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Start")
                .font(.custom("Georgia-Italic", size: 20))
                .padding(30)
                .bold()
                .foregroundStyle(Color.cWhite)
        }
        .background(Color.cDarkOrange)
        .clipShape(Circle())
        .shadow(radius: 6, x: 0, y: 4)
    }
}

#Preview {
    StartButton()
}
