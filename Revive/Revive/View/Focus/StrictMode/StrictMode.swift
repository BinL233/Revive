//
//  StrictMode.swift
//  Revive
//
//  Created by Kaile Ying on 7/15/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct StrictMode_ios17: View {
    @Environment(ReviveManager_ios17.self) var reviveManager
    @Binding var isStrictConfirmOpen: Bool
    
    var body: some View {
        Button {
            withAnimation(){ isStrictConfirmOpen = true }
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

@available(iOS 16.0, *)
struct StrictMode_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @Binding var isStrictConfirmOpen: Bool
    
    var body: some View {
        Button {
            isStrictConfirmOpen = true
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
