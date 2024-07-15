//
//  StrictMode.swift
//  Revive
//
//  Created by Kaile Ying on 7/15/24.
//

import SwiftUI

struct StrictMode: View {
    var body: some View {
        Button {
            let x: Int = 0
        } label: {
            HStack {
                Image(systemName: "flame")
                    .font(.caption)
                    .foregroundStyle(Color.cBlackRed)
                Text("Strict Mode")
                    .font(.caption)
                    .foregroundStyle(Color.cBlackRed)
                    .bold()
            }
            .padding(10)
            .background(Color.white.opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 0.7, x: 2, y: 3)
        }
    }
}
